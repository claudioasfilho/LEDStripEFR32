################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/Device/SiliconLabs/EFR32MG22/Source/system_efr32mg22.c 

S_UPPER_SRCS += \
/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/Device/SiliconLabs/EFR32MG22/Source/GCC/startup_efr32mg22.S 

OBJS += \
./CMSIS/EFR32MG22/startup_efr32mg22.o \
./CMSIS/EFR32MG22/system_efr32mg22.o 

C_DEPS += \
./CMSIS/EFR32MG22/system_efr32mg22.d 


# Each subdirectory must supply rules for building sources it contributes
CMSIS/EFR32MG22/startup_efr32mg22.o: /Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/Device/SiliconLabs/EFR32MG22/Source/GCC/startup_efr32mg22.S
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Assembler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m33 -mthumb -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files" -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files_inc" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/emlib/inc" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/bsp" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/CMSIS/Include" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/EFR32MG22_BRD4182A/config" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/drivers" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/Device/SiliconLabs/EFR32MG22/Include" '-DRETARGET_VCOM=1' '-DEFR32MG22C224F512IM40=1' -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -x assembler-with-cpp -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

CMSIS/EFR32MG22/system_efr32mg22.o: /Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2/platform/Device/SiliconLabs/EFR32MG22/Source/system_efr32mg22.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DRETARGET_VCOM=1' '-DEFR32MG22C224F512IM40=1' -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files" -I"/Users/clfilho/SimplicityStudio/May_21/BRD4182A_EFR32xG22_timer_pwm_dma/external_copied_files_inc" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/emlib/inc" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/bsp" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/CMSIS/Include" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/EFR32MG22_BRD4182A/config" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//hardware/kit/common/drivers" -I"/Applications/SimplicityStudio5.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.2//platform/Device/SiliconLabs/EFR32MG22/Include" -O0 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"CMSIS/EFR32MG22/system_efr32mg22.d" -MT"CMSIS/EFR32MG22/system_efr32mg22.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


