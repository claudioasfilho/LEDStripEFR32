/***************************************************************************//**
 * @file main.c
 * @brief This project demonstrates DMA driven pulse width modulation using the
 * TIMER module. The GPIO pin specified in the readme.txt is configured to
 * output a 1kHz signal. The DMA continuously updates the CCVB register to vary
 * the duty cycle.
 *******************************************************************************
 * # License
 * <b>Copyright 2020 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * SPDX-License-Identifier: Zlib
 *
 * The licensor of this software is Silicon Laboratories Inc.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 *******************************************************************************
 * # Evaluation Quality
 * This code has been minimally tested to ensure that it builds and is suitable 
 * as a demonstration for evaluation purposes only. This code will be maintained
 * at the sole discretion of Silicon Labs.
 ******************************************************************************/

#include "em_device.h"
#include "em_cmu.h"
#include "em_emu.h"
#include "em_chip.h"
#include "em_gpio.h"
#include "em_timer.h"
#include "em_ldma.h"
#include "bsp.h"
#include "em_prs.h"

#include <stdio.h>
#include <string.h>

// Note: change this to set the desired Output frequency in Hz
#define PWM_FREQ 800000



// DMA channel used for the example
#define LDMA_CHANNEL      0
#define LDMA_CH_MASK      (1 << LDMA_CHANNEL)

#define NUMBEROFLEDS  10

#define ONE_LED_BUFFER_SIZE 24
#define TWO_LED_BUFFER_SIZE ONE_LED_BUFFER_SIZE + ONE_LED_BUFFER_SIZE
#define THREE_LED_BUFFER_SIZE ONE_LED_BUFFER_SIZE + ONE_LED_BUFFER_SIZE + ONE_LED_BUFFER_SIZE
#define FOUR_LED_BUFFER_SIZE TWO_LED_BUFFER_SIZE + TWO_LED_BUFFER_SIZE
#define RESET_LOGIC_BUFFER_SIZE 40//51//67
#define MESSAGE_BUFFER_SIZE (NUMBEROFLEDS*ONE_LED_BUFFER_SIZE)+RESET_LOGIC_BUFFER_SIZE


enum LogicState
    {
    LOGIC_0 = 25,
    LOGIC_1 = 50,
    LOGIC_RESET = 0
    };

// Note: change this to change the duty cycles used in this example
 uint16_t dutyCyclePercentages[MESSAGE_BUFFER_SIZE];
    //{LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_1, LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0};

static const uint16_t ColorGreen[ONE_LED_BUFFER_SIZE] =
    {LOGIC_1, LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0};


static const uint16_t ColorRed[ONE_LED_BUFFER_SIZE] =
    {LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0,LOGIC_1, LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0};


static const uint16_t ColorBlue[ONE_LED_BUFFER_SIZE] =
    {LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0,LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0, LOGIC_0,LOGIC_1, LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1};



static const uint16_t ColorWhite[ONE_LED_BUFFER_SIZE] =
    {LOGIC_1, LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1, LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1, LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1,LOGIC_1};



 uint16_t LogicReset[RESET_LOGIC_BUFFER_SIZE] =
    {
        LOGIC_RESET, LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,
        LOGIC_RESET, LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,
        LOGIC_RESET, LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,
        LOGIC_RESET, LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET,LOGIC_RESET };


// Buffer of duty cycle values for DMA transfer to CCVB
// Buffer is populated after TIMER is initialized and Top value is set

typedef struct ledobj{uint16_t n[ONE_LED_BUFFER_SIZE];} LEDOBJ;

struct {

    LEDOBJ Led1;
    LEDOBJ Led2;
    LEDOBJ Led3;
    LEDOBJ Led4;
    LEDOBJ Led5;
}LedStrip;

static uint16_t buffer[MESSAGE_BUFFER_SIZE];

/**************************************************************************//**
 * @brief
 *    GPIO initialization
 *****************************************************************************/
void initGpio(void)
{
  // Configure PA6 as output
  GPIO_PinModeSet(gpioPortA, 6, gpioModePushPull, 0);


}

/**************************************************************************//**
 * @brief
 *    CMU initialization
 *****************************************************************************/
void initCmu(void)
{
  //CMU->EM01GRPACLKCTRL = 1;

  CMU_HFRCODPLLBandSet(cmuHFRCODPLLFreq_80M0Hz);

  // Enable clock to GPIO and TIMER0
  CMU_ClockEnable(cmuClock_GPIO, true);
  CMU_ClockEnable(cmuClock_TIMER0, true);
}

/**************************************************************************//**
 * @brief
 *    TIMER initialization
 *****************************************************************************/
void initTimer(void)
{
  // Initialize and start timer with no prescaling
  TIMER_Init_TypeDef timerInit = TIMER_INIT_DEFAULT;
  // Configure TIMER0 Compare/Capture for output compare
  TIMER_InitCC_TypeDef timerCCInit = TIMER_INITCC_DEFAULT;

  // Use PWM mode, which sets output on overflow and clears on compare events
  timerInit.enable = false;
  timerInit.dmaClrAct = true;
  timerCCInit.mode = timerCCModePWM;
  timerInit.clkSel = timerClkSelHFPerClk;


  // Configure but do not start the timer
  TIMER_Init(TIMER0, &timerInit);

  // Route Timer0 CC0 output to PA6
  GPIO->TIMERROUTE[0].ROUTEEN  = GPIO_TIMER_ROUTEEN_CC0PEN;
  GPIO->TIMERROUTE[0].CC0ROUTE = (gpioPortA << _GPIO_TIMER_CC0ROUTE_PORT_SHIFT)
                    | (6 << _GPIO_TIMER_CC0ROUTE_PIN_SHIFT);

  TIMER_InitCC(TIMER0, 0, &timerCCInit);

  // Set top value to overflow at the desired PWM_FREQ frequency
  TIMER_TopSet(TIMER0, CMU_ClockFreqGet(cmuClock_TIMER0) / PWM_FREQ);

  // Start the timer
  TIMER_Enable(TIMER0, true);
}



/**************************************************************************//**
* @brief
*    Initialize the LDMA module
*
* @details
*    Configure the channel descriptor to use the default peripheral to
*    memory transfer descriptor. Modify it to not generate an interrupt
*    upon transfer completion (we don't need it). Additionally, the transfer
*    configuration selects the TIMER0_UFOF signal as the trigger for the LDMA
*    transaction to occur.
*
* @note
*    The descriptor object needs to at least have static scope persistence so
*    that the reference to the object is valid beyond its first use in
*    initialization
*****************************************************************************/
void initLdma(void)
{
  // Start the transfer
  uint32_t channelNum = LDMA_CHANNEL;

  // LDMA initialization
  LDMA_Init_t init = LDMA_INIT_DEFAULT;
  LDMA_Init(&init);

  // Transfer configuration and trigger selection
  LDMA_TransferCfg_t transferConfig =
    LDMA_TRANSFER_CFG_PERIPHERAL(ldmaPeripheralSignal_TIMER0_UFOF);
 // LDMA_TRANSFER_CFG_PERIPHERAL(ldmaPeripheralSignal_NONE);

  // Channel descriptor configuration
  static LDMA_Descriptor_t descriptor =
    LDMA_DESCRIPTOR_LINKREL_M2P_BYTE(&buffer,            // Memory source address
                                    &TIMER0->CC[0].OCB, // Peripheral destination address
                                    MESSAGE_BUFFER_SIZE,         // Number of bytes per transfer
                                    0);                  // Link to same descriptor
  descriptor.xfer.size     = ldmaCtrlSizeHalf; // Unit transfer size
  descriptor.xfer.doneIfs  = 0;                // Don't trigger interrupt when done

//  descriptor.xfer.reqMode = ldmaCtrlReqModeAll;
//  descriptor.xfer.structReq = false;

  LDMA_StartTransfer(channelNum, &transferConfig, &descriptor);
}


/**************************************************************************//**
 * @brief
 *    Populate buffer with timer duty cycle values
 *****************************************************************************/
void populateBuffer(void)
{
  for (uint32_t i = 0; i < MESSAGE_BUFFER_SIZE; i++) {
    buffer[i] = (uint16_t) (TIMER_TopGet(TIMER0) * dutyCyclePercentages[i] / 100);
  }

}

#if 0
void populateMessageBuffer(void)
{
  for (uint32_t i = 0; i < MESSAGE_BUFFER_SIZE; i++) {


        if (i<ONE_LED_BUFFER_SIZE) dutyCyclePercentages[i] = ColorRed[i];

        if ((i>=ONE_LED_BUFFER_SIZE) && (i<ONE_LED_BUFFER_SIZE + ONE_LED_BUFFER_SIZE)) dutyCyclePercentages[i] = ColorRed[i-ONE_LED_BUFFER_SIZE];

        if ((i>=ONE_LED_BUFFER_SIZE + ONE_LED_BUFFER_SIZE) && (i<ONE_LED_BUFFER_SIZE + ONE_LED_BUFFER_SIZE+ ONE_LED_BUFFER_SIZE)) dutyCyclePercentages[i] = ColorWhite[i-(ONE_LED_BUFFER_SIZE + ONE_LED_BUFFER_SIZE)];

        if ((i>=ONE_LED_BUFFER_SIZE + ONE_LED_BUFFER_SIZE+ ONE_LED_BUFFER_SIZE ) && (i<ONE_LED_BUFFER_SIZE + ONE_LED_BUFFER_SIZE+ ONE_LED_BUFFER_SIZE + RESET_LOGIC_BUFFER_SIZE)) dutyCyclePercentages[i] = LogicReset[i-(ONE_LED_BUFFER_SIZE + ONE_LED_BUFFER_SIZE+ ONE_LED_BUFFER_SIZE)];


  }

}

#else

void populateMessageBuffer(void)
{
  char i;
  char offset = 0;

  for (i=0; i<RESET_LOGIC_BUFFER_SIZE;i++)
    {
      LogicReset[i] = 0;
    }

  for (i=0; i<NUMBEROFLEDS;i++)

    {
      memcpy(dutyCyclePercentages + offset, ColorRed, ONE_LED_BUFFER_SIZE * sizeof(uint16_t));
      offset+=ONE_LED_BUFFER_SIZE;
    }

  memcpy(dutyCyclePercentages + offset, LogicReset, RESET_LOGIC_BUFFER_SIZE * sizeof(uint16_t));
}

#endif

/**************************************************************************//**
 * @brief  Main function
 *****************************************************************************/
int main(void)
{
  // Chip errata
  CHIP_Init();


  memcpy(LedStrip.Led1.n, ColorRed, ONE_LED_BUFFER_SIZE);
  memcpy(LedStrip.Led2.n, ColorRed, ONE_LED_BUFFER_SIZE);
  memcpy(LedStrip.Led3.n, ColorRed, ONE_LED_BUFFER_SIZE);

  populateMessageBuffer();
  // Initializations
  initCmu();
  initGpio();

  initTimer();

  // Initialize DMA only after buffer is populated
  populateBuffer();
  initLdma();




  while (1) {


  }
}

void LDMA_IRQHandler(void)
{
  uint32_t pending;

  // Read interrupt source
  pending = LDMA_IntGet();

  // Clear interrupts
  LDMA_IntClear(pending);

  // Check for LDMA error
  if (pending & LDMA_IF_ERROR)
  {
  // Loop here to enable the debugger to see what has happened
  while (1);
  }
 // LDMA->SWREQ |= LDMA_CH_MASK;
}
