/*
 * ePWM_functions.h
 *
 *  Created on: 10 nov. 2018
 *      Author: lab
 */

#ifndef LIBRARY_EPWM_FUNCTIONS_H_
#define LIBRARY_EPWM_FUNCTIONS_H_



/* ***********************************************************************************************************************
 * Function name: ModulationOFF
 * *******************************************************
 * Author: Laborda
 * ***************************************************
 * Input parameters:
 *
 *      none (void)
 *
 *********************************************************
 * Output parameters:
 *
 *      none (void)
 *
 *********************************************************
 * Global variable dependences:
 *
 *      volatile struct EPWM_REGS EPwmXRegs: Definition of the ePWM Registers made in "DSP2833x_GlobalVariableDefs.c"
 *
 **********************************************************
 *  Description: Turns off the modulation forcing a Trip-Zone event by Software
 ****************************************************************************************************************************/
static inline void ModulationOFF(void)
{   //Turns off the modulation
    EALLOW;
    EPwm1Regs.TZFRC.bit.OST=1;
    EPwm2Regs.TZFRC.bit.OST=1;
    EPwm3Regs.TZFRC.bit.OST=1;
    EPwm4Regs.TZFRC.bit.OST=1;
    EPwm5Regs.TZFRC.bit.OST=1;
    EPwm6Regs.TZFRC.bit.OST=1;
    EDIS;
}

/* ***********************************************************************************************************************
 * Function name: ModulationON
 * *******************************************************
 * Author: Laborda
 * ***************************************************
 * Input parameters:
 *
 *      none (void)
 *
 *********************************************************
 * Output parameters:
 *
 *      none (void)
 *
 *********************************************************
 * Global variable dependences:
 *
 *      volatile struct EPWM_REGS EPwmXRegs: Definition of the ePWM Registers made in "DSP2833x_GlobalVariableDefs.c"
 *
 **********************************************************
 *  Description: Turns ON the modulation Clearing the Trip-Zone Event. Use this once the problem has been fixed.
 ****************************************************************************************************************************/
static inline void ModulationON(void)
{   //Turns off the modulation
    EALLOW;
    EPwm1Regs.TZCLR.bit.OST=1;
    EPwm2Regs.TZCLR.bit.OST=1;
    EPwm3Regs.TZCLR.bit.OST=1;
    EPwm4Regs.TZCLR.bit.OST=1;
    EPwm5Regs.TZCLR.bit.OST=1;
    EPwm6Regs.TZCLR.bit.OST=1;
    EDIS;
}

/* ***********************************************************************************************************************
 * Function name: ePWM_Config
 * *******************************************************
 * Input parameters:
 *
 *      none (void)
 *
 *********************************************************
 * Output parameters:
 *
 *      none (void)
 *
 *********************************************************
 * Global variable dependences:
 *
 *      volatile struct SYS_CTRL_REGS SysCtrlRegs: Definition of the System Control Registers made in "DSP2833x_GlobalVariableDefs.c"
 *      volatile struct EPWM_REGS EPwmXRegs: Definition of the ePWM Registers made in "DSP2833x_GlobalVariableDefs.c"
 *
 **********************************************************
 *  Description: Configure the PWM module with 3 PWM outputs DO NOT USE IT (it is taken from an example)
 ****************************************************************************************************************************/
void ePWM_Config(void);


/* ***********************************************************************************************************************
 * Function name: ePWM_Config_3ph_param
 * **************************************************************
 * Author: Laborda
 * ***************************************************
 * Input parameters:
 *
 *      float uS_period: Desired PWM period in microseconds (16bit register). For 150 MHz devices: Range: [0.2 to 1747.6] us. Caution: as you decrease
 *                       the period, you will affect the duty cycle resolution: [3 to 16] bits for that range, respectively.
 *
 *      unsigned int count_mode: PWM counter mode. Possible values:
 *              #define TB_COUNT_UP     0x0
 *              #define TB_COUNT_DOWN   0x1
 *              #define TB_COUNT_UPDOWN 0x2
 *              #define TB_FREEZE       0x3
 *
 *      float uS_DB: Desired DeadBand time in microseconds (10 bits register). For 150 MHz devices: Range [0.013 to 13.6] us
 *
 *
 *      unsigned int SOCA: Especial Event Trigger Generation. This defines when to generate the SOCA. Possible values:
 *                      0: no SOCA
 *              #define ET_CTR_ZERO     0x1
 *              #define ET_CTR_PRD      0x2
 *              #define ET_CTRU_CMPA    0x4
 *              #define ET_CTRD_CMPA    0x5
 *              #define ET_CTRU_CMPB    0x6
 *              #define ET_CTRD_CMPB    0x7
 *
 *
 *                          **Those defines are placed in "DSP2833x_EPwm_defines.h"**
 ***************************************************************
 * Output parameters:
 *
 *      none (void)
 *
 ***************************************************************
 * Global variable dependences:
 *
 *      volatile struct SYS_CTRL_REGS SysCtrlRegs: Definition of the System Control Registers made in "DSP2833x_GlobalVariableDefs.c"
 *      volatile struct EPWM_REGS EPwmXRegs: Definition of the ePWM Registers made in "DSP2833x_GlobalVariableDefs.c"
 *
 ***************************************************************
 *  Description: Configure the PWM module for 3-phase systems, complementary mode, NO phase shift, Shadow Registers enabled.
 *               This function is implemented parametrically in order to change PWM period, count mode, deadband and Special event trigger generation
 ****************************************************************************************************************************/
void ePWM_Config_3ph_param(float uS_period, unsigned int count_mode, float uS_DB, unsigned int SOCA);

/* ***********************************************************************************************************************
 * Function name: ePWM_Config_3P4L_param
 * **************************************************************
 * Author: Carlo
 * ***************************************************
 * Input parameters:
 *
 *      float uS_period: Desired PWM period in microseconds (16bit register). For 150 MHz devices: Range: [0.2 to 1747.6] us. Caution: as you decrease
 *                       the period, you will affect the duty cycle resolution: [3 to 16] bits for that range, respectively.
 *
 *      unsigned int count_mode: PWM counter mode. Possible values:
 *              #define TB_COUNT_UP     0x0
 *              #define TB_COUNT_DOWN   0x1
 *              #define TB_COUNT_UPDOWN 0x2
 *              #define TB_FREEZE       0x3
 *
 *      float uS_DB: Desired DeadBand time in microseconds (10 bits register). For 150 MHz devices: Range [0.013 to 13.6] us
 *
 *
 *      unsigned int SOCA: Especial Event Trigger Generation. This defines when to generate the SOCA. Possible values:
 *                      0: no SOCA
 *              #define ET_CTR_ZERO     0x1
 *              #define ET_CTR_PRD      0x2
 *              #define ET_CTRU_CMPA    0x4
 *              #define ET_CTRD_CMPA    0x5
 *              #define ET_CTRU_CMPB    0x6
 *              #define ET_CTRD_CMPB    0x7
 *
 *
 *                          **Those defines are placed in "DSP2833x_EPwm_defines.h"**
 ***************************************************************
 * Output parameters:
 *
 *      none (void)
 *
 ***************************************************************
 * Global variable dependences:
 *
 *      volatile struct SYS_CTRL_REGS SysCtrlRegs: Definition of the System Control Registers made in "DSP2833x_GlobalVariableDefs.c"
 *      volatile struct EPWM_REGS EPwmXRegs: Definition of the ePWM Registers made in "DSP2833x_GlobalVariableDefs.c"
 *
 ***************************************************************
 *  Description: Configure the PWM module for 3-Phase 4-Legs systems, complementary mode, NO phase shift, Shadow Registers enabled.
 *               This function is implemented parametrically in order to change PWM period, count mode, deadband and Special event trigger generation
 ****************************************************************************************************************************/
void ePWM_Config_3P4L_param(float uS_period, unsigned int count_mode, float uS_DB, unsigned int SOCA);

/* ***********************************************************************************************************************
 * Function name: UpdatePWM_3ph
 * **************************************************************
 * Author: Laborda
 * ***************************************************
 * Input parameters:
 *
 *      float du/dv/dw: Input duty variable to be loaded in the desired phase (U,V or W). Range: [0 to 1] pu.
 *
 ***************************************************************
 * Output parameters:
 *
 *      none (void)
 *
 ***************************************************************
 * Global variable dependences:
 *
 *      volatile struct EPWM_REGS EPwmXRegs: Definition of the ePWM Registers made in "DSP2833x_GlobalVariableDefs.c"
 *
 ***************************************************************
 *  Description: Updates the duty values loading it into PWM1, PWM2 and PWM3 registers. It reads the PWM period register,
 *  and therefore, it is valid for any PWM period. Implemented for 3-phase systems.
 ****************************************************************************************************************************/
//#pragma CODE_SECTION(UpdatePWM_3ph, "ramfuncs");
static inline void UpdatePWM_3ph(float du, float dv, float dw)
{
    EPwm1Regs.CMPA.half.CMPA = (Uint16) (EPwm1Regs.TBPRD*du);
    EPwm2Regs.CMPA.half.CMPA = (Uint16) (EPwm2Regs.TBPRD*dv);
    EPwm3Regs.CMPA.half.CMPA = (Uint16) (EPwm3Regs.TBPRD*dw);
}

#endif /* LIBRARY_EPWM_FUNCTIONS_H_ */
