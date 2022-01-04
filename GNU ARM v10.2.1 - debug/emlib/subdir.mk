################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/emlib/src/em_cmu.c \
/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/emlib/src/em_core.c \
/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/emlib/src/em_emu.c \
/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/emlib/src/em_gpio.c \
/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/emlib/src/em_ldma.c \
/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/emlib/src/em_system.c \
/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/emlib/src/em_timer.c 

OBJS += \
./emlib/em_cmu.o \
./emlib/em_core.o \
./emlib/em_emu.o \
./emlib/em_gpio.o \
./emlib/em_ldma.o \
./emlib/em_system.o \
./emlib/em_timer.o 

C_DEPS += \
./emlib/em_cmu.d \
./emlib/em_core.d \
./emlib/em_emu.d \
./emlib/em_gpio.d \
./emlib/em_ldma.d \
./emlib/em_system.d \
./emlib/em_timer.d 


# Each subdirectory must supply rules for building sources it contributes
emlib/em_cmu.o: /Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/emlib/src/em_cmu.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DRETARGET_VCOM=1' '-DEFR32MG22C224F512IM40=1' -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files_inc" -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/emlib/inc" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/bsp" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/CMSIS/Include" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/EFR32MG22_BRD4182A/config" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/drivers" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/Device/SiliconLabs/EFR32MG22/Include" -O0 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"emlib/em_cmu.d" -MT"emlib/em_cmu.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

emlib/em_core.o: /Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/emlib/src/em_core.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DRETARGET_VCOM=1' '-DEFR32MG22C224F512IM40=1' -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files_inc" -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/emlib/inc" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/bsp" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/CMSIS/Include" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/EFR32MG22_BRD4182A/config" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/drivers" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/Device/SiliconLabs/EFR32MG22/Include" -O0 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"emlib/em_core.d" -MT"emlib/em_core.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

emlib/em_emu.o: /Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/emlib/src/em_emu.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DRETARGET_VCOM=1' '-DEFR32MG22C224F512IM40=1' -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files_inc" -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/emlib/inc" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/bsp" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/CMSIS/Include" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/EFR32MG22_BRD4182A/config" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/drivers" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/Device/SiliconLabs/EFR32MG22/Include" -O0 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"emlib/em_emu.d" -MT"emlib/em_emu.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

emlib/em_gpio.o: /Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/emlib/src/em_gpio.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DRETARGET_VCOM=1' '-DEFR32MG22C224F512IM40=1' -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files_inc" -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/emlib/inc" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/bsp" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/CMSIS/Include" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/EFR32MG22_BRD4182A/config" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/drivers" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/Device/SiliconLabs/EFR32MG22/Include" -O0 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"emlib/em_gpio.d" -MT"emlib/em_gpio.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

emlib/em_ldma.o: /Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/emlib/src/em_ldma.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DRETARGET_VCOM=1' '-DEFR32MG22C224F512IM40=1' -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files_inc" -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/emlib/inc" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/bsp" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/CMSIS/Include" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/EFR32MG22_BRD4182A/config" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/drivers" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/Device/SiliconLabs/EFR32MG22/Include" -O0 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"emlib/em_ldma.d" -MT"emlib/em_ldma.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

emlib/em_system.o: /Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/emlib/src/em_system.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DRETARGET_VCOM=1' '-DEFR32MG22C224F512IM40=1' -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files_inc" -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/emlib/inc" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/bsp" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/CMSIS/Include" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/EFR32MG22_BRD4182A/config" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/drivers" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/Device/SiliconLabs/EFR32MG22/Include" -O0 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"emlib/em_system.d" -MT"emlib/em_system.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

emlib/em_timer.o: /Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/emlib/src/em_timer.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DRETARGET_VCOM=1' '-DEFR32MG22C224F512IM40=1' -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files_inc" -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/emlib/inc" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/bsp" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/CMSIS/Include" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/EFR32MG22_BRD4182A/config" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/drivers" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/Device/SiliconLabs/EFR32MG22/Include" -O0 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"emlib/em_timer.d" -MT"emlib/em_timer.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


