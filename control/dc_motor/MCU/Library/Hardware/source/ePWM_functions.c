/*
 * ePWM_functions.c
 *
 *  Created on: 10 nov. 2018
 *      Author: lab
 */
#include "DSP28x_Project.h"
#include "Library/Hardware/headers/ePWM_functions.h"

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
/*static inline void ModulationOFF(void)
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
*/

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
/*static inline void ModulationON(void)
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
*/



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
void ePWM_Config(void)
{
    /*************************
     * PWM1,2,3 clock enable *
     *************************/
    EALLOW;
    SysCtrlRegs.PCLKCR0.bit.TBCLKSYNC = 0;   // Disable TBCLK within the ePWM
    SysCtrlRegs.PCLKCR1.bit.EPWM1ENCLK = 1;  // ePWM1
    SysCtrlRegs.PCLKCR1.bit.EPWM2ENCLK = 1;  // ePWM2
    SysCtrlRegs.PCLKCR1.bit.EPWM3ENCLK = 1;  // ePWM3
    SysCtrlRegs.PCLKCR0.bit.TBCLKSYNC = 1;   // Enable TBCLK within the ePWM
    EDIS;
    /****************
     * EPwm1 Config *
     ***************/
    EPwm1Regs.TBPRD = 7500/2; // Period = 1600 TBCLK counts
    EPwm1Regs.TBPHS.half.TBPHS = 0; // Set Phase register to zero
    EPwm1Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN;   // Symmetrical mode
    EPwm1Regs.TBCTL.bit.PHSEN = TB_DISABLE;    // Master module
    EPwm1Regs.TBCTL.bit.PRDLD = TB_SHADOW;
    EPwm1Regs.TBCTL.bit.SYNCOSEL = TB_CTR_ZERO;    // Sync down-stream module
    EPwm1Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;
    EPwm1Regs.CMPCTL.bit.SHDWBMODE = CC_SHADOW;
    EPwm1Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm1Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm1Regs.AQCTLA.bit.CAU = AQ_SET;    // set actions for EPWM1A
    EPwm1Regs.AQCTLA.bit.CAD = AQ_CLEAR;
    EPwm1Regs.DBCTL.bit.IN_MODE = DBA_ALL;
    EPwm1Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE;    // enable Dead-band module
    EPwm1Regs.DBCTL.bit.POLSEL = DB_ACTV_HIC;    // Active Hi complementary
    EPwm1Regs.DBFED = 75;    // FED = 50 TBCLKs
    EPwm1Regs.DBRED = 75;    // RED = 50 TBCLKs

    EPwm1Regs.ETSEL.bit.SOCAEN = 1; // Enable SOCA trigger
    EPwm1Regs.ETSEL.bit.SOCASEL = ET_CTR_PRD;


    /* ***************
     * EPwm2 Config  *
     *****************/
    EPwm2Regs.TBPRD = 800;    // Period = 1600 TBCLK counts
    EPwm2Regs.TBPHS.half.TBPHS = 0;    // Set Phase register to zero
    EPwm2Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN;    // Symmetrical mode
    EPwm2Regs.TBCTL.bit.PHSEN = TB_ENABLE;    // Slave module
    EPwm2Regs.TBCTL.bit.PRDLD = TB_SHADOW;
    EPwm2Regs.TBCTL.bit.SYNCOSEL = TB_SYNC_IN;    // sync flow-through
    EPwm2Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;
    EPwm2Regs.CMPCTL.bit.SHDWBMODE = CC_SHADOW;
    EPwm2Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm2Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm2Regs.AQCTLA.bit.CAU = AQ_SET;    // set actions for EPWM2A
    EPwm2Regs.AQCTLA.bit.CAD = AQ_CLEAR;
    EPwm2Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE;    // enable Dead-band module
    EPwm2Regs.DBCTL.bit.POLSEL = DB_ACTV_HIC;    // Active Hi complementary
    EPwm2Regs.DBFED = 50;    // FED = 50 TBCLKs
    EPwm2Regs.DBRED = 50;    // RED = 50 TBCLKs


    /* ***************
     * EPwm3 Config  *
     *****************/
    EPwm3Regs.TBPRD = 800;    // Period = 1600 TBCLK counts
    EPwm3Regs.TBPHS.half.TBPHS = 0;    // Set Phase register to zero
    EPwm3Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN;    // Symmetrical mode
    EPwm3Regs.TBCTL.bit.PHSEN = TB_ENABLE;    // Slave module
    EPwm3Regs.TBCTL.bit.PRDLD = TB_SHADOW;
    EPwm3Regs.TBCTL.bit.SYNCOSEL = TB_SYNC_IN;    // sync flow-through
    EPwm3Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;
    EPwm3Regs.CMPCTL.bit.SHDWBMODE = CC_SHADOW;
    EPwm3Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm3Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm3Regs.AQCTLA.bit.CAU = AQ_SET;    // set actions for EPWM3A
    EPwm3Regs.AQCTLA.bit.CAD = AQ_CLEAR;
    EPwm3Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE;    // enable Dead-band module
    EPwm3Regs.DBCTL.bit.POLSEL = DB_ACTV_HIC;    // Active Hi complementary
    EPwm3Regs.DBFED = 50;    // FED = 50 TBCLKs
    EPwm3Regs.DBRED = 50;    // RED = 50 TBCLKs



    EPwm1Regs.CMPA.half.CMPA = 500;    // adjust duty for output EPWM1A
    EPwm2Regs.CMPA.half.CMPA = 600;    // adjust duty for output EPWM2A
    EPwm3Regs.CMPA.half.CMPA = 700;    // adjust duty for output EPWM3A
}

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
void ePWM_Config_3ph_param(float uS_period, unsigned int count_mode, float uS_DB, unsigned int SOCA)
{
    /*************************
     * PWM1,2,3 clock enable *
     *************************/
    EALLOW;
    SysCtrlRegs.PCLKCR0.bit.TBCLKSYNC = 0;   // Disable TBCLK within the ePWM
    SysCtrlRegs.PCLKCR1.bit.EPWM1ENCLK = 1;  // ePWM1
    SysCtrlRegs.PCLKCR1.bit.EPWM2ENCLK = 1;  // ePWM2
    SysCtrlRegs.PCLKCR1.bit.EPWM3ENCLK = 1;  // ePWM3
    SysCtrlRegs.PCLKCR0.bit.TBCLKSYNC = 1;   // Enable TBCLK within the ePWM
    EDIS;

    /* ***************
     * EPwm1 Config  *
     *****************/
    if(count_mode==TB_COUNT_UPDOWN) // if the mode is up-down, the value of TBPRD must be half of the period
        EPwm1Regs.TBPRD = (Uint16)(uS_period*1000/CPU_RATE/2/2);    // Load the Period register using the parametric period
                                                                    //and the CPU_Rate definition in DSP2833x_Examples.h
    else
        EPwm1Regs.TBPRD = (Uint16)(uS_period*1000/CPU_RATE/2);    // Load the Period register using the parametric period
                                                                    //and the CPU_Rate definition in DSP2833x_Examples.h

    EPwm1Regs.TBPHS.half.TBPHS = 0;    // Set Phase register to zero
    EPwm1Regs.TBCTL.bit.CTRMODE = count_mode;    // Load the parametric count mode
    EPwm1Regs.TBCTL.bit.PHSEN = TB_DISABLE;    // Master module
    EPwm1Regs.TBCTL.bit.PRDLD = TB_SHADOW;
    EPwm1Regs.TBCTL.bit.SYNCOSEL = TB_CTR_ZERO;    // Sync down-stream module
    EPwm1Regs.TBCTL.bit.FREE_SOFT = 2; //Free run at halt debug command (need for real time systems)
    EPwm1Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;
    EPwm1Regs.CMPCTL.bit.SHDWBMODE = CC_SHADOW;
    EPwm1Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm1Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm1Regs.AQCTLA.bit.CAU = AQ_SET;    // set actions for EPWM1A
    EPwm1Regs.AQCTLA.bit.CAD = AQ_CLEAR;
    EPwm1Regs.DBCTL.bit.IN_MODE = DBA_ALL;
    EPwm1Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE;    // enable Dead-band module
    EPwm1Regs.DBCTL.bit.POLSEL = DB_ACTV_HIC;    // Active Hi complementary
    EPwm1Regs.DBFED = (unsigned int) (uS_DB*1000/CPU_RATE/2);    // Falling deadband parametric
    EPwm1Regs.DBRED = (unsigned int) (uS_DB*1000/CPU_RATE/2);    // Rising deadband parametric
    EALLOW;
    EPwm1Regs.TZCTL.bit.TZA = TZ_FORCE_LO; //Set Low as Trip-Zone action in EPWMxA
    EPwm1Regs.TZCTL.bit.TZB = TZ_FORCE_LO; //Set Low as Trip-Zone action in EPWMxB
    //EPwm1Regs.TZSEL.bit.OSHT1 = TZ_ENABLE; // if there were any Trip zone input, we must select it here
    EDIS;

    if (SOCA!=0) // if it is specified in the function, use the SOCA trigger generator
    {
        EPwm1Regs.ETSEL.bit.SOCAEN = 1;        // Enable SOC on A group
        EPwm1Regs.ETSEL.bit.SOCASEL = 2;       // Select SOC from from CPMA on up count
        EPwm1Regs.ETPS.bit.SOCAPRD = 1;        // Generate pulse on 1st event
    }
    else
        EPwm1Regs.ETSEL.bit.SOCAEN = 0; // Disable SOCA trigger



    /* ***************
     * EPwm2 Config  *
     *****************/
    if(count_mode==TB_COUNT_UPDOWN) // if the mode is up-down, the value of TBPRD must be half of the period
        EPwm2Regs.TBPRD = (Uint16)(uS_period*1000/CPU_RATE/2/2);    // Load the Period register using the parametric period
                                                                    //and the CPU_Rate definition in DSP2833x_Examples.h
    else
        EPwm2Regs.TBPRD = (Uint16)(uS_period*1000/CPU_RATE/2);    // Load the Period register using the parametric period
                                                                    //and the CPU_Rate definition in DSP2833x_Examples.h

    EPwm2Regs.TBPHS.half.TBPHS = 0;    // Set Phase register to zero
    EPwm2Regs.TBCTL.bit.CTRMODE = count_mode;    // Load the parametric count mode
    EPwm2Regs.TBCTL.bit.PHSEN = TB_ENABLE;    // Slave module
    EPwm2Regs.TBCTL.bit.PRDLD = TB_SHADOW;
    EPwm2Regs.TBCTL.bit.SYNCOSEL = TB_SYNC_IN;    // sync flow-through
    EPwm2Regs.TBCTL.bit.FREE_SOFT = 2; //Free run at halt debug command (need for real time systems)
    EPwm2Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;
    EPwm2Regs.CMPCTL.bit.SHDWBMODE = CC_SHADOW;
    EPwm2Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm2Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm2Regs.AQCTLA.bit.CAU = AQ_SET;    // set actions for EPWM2A
    EPwm2Regs.AQCTLA.bit.CAD = AQ_CLEAR;
    EPwm2Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE;    // enable Dead-band module
    EPwm2Regs.DBCTL.bit.POLSEL = DB_ACTV_HIC;    // Active Hi complementary
    EPwm2Regs.DBFED = (unsigned int) (uS_DB*1000/CPU_RATE/2);    // Falling deadband parametric
    EPwm2Regs.DBRED = (unsigned int) (uS_DB*1000/CPU_RATE/2);    // Rising deadband parametric
    EALLOW;
    EPwm2Regs.TZCTL.bit.TZA = TZ_FORCE_LO; //Set Low as Trip-Zone action in EPWMxA
    EPwm2Regs.TZCTL.bit.TZB = TZ_FORCE_LO; //Set Low as Trip-Zone action in EPWMxB
    //EPwm2Regs.TZSEL.bit.OSHT1 = TZ_ENABLE; // if there were any Trip zone input, we must select it here
    EDIS;

    /* ***************
     * EPwm3 Config  *
     *****************/
    if(count_mode==TB_COUNT_UPDOWN) // if the mode is up-down, the value of TBPRD must be half of the period
        EPwm3Regs.TBPRD = (Uint16)(uS_period*1000/CPU_RATE/2/2);    // Load the Period register using the parametric period
                                                                    //and the CPU_Rate definition in DSP2833x_Examples.h
    else
        EPwm3Regs.TBPRD = (Uint16)(uS_period*1000/CPU_RATE/2);    // Load the Period register using the parametric period
                                                                    //and the CPU_Rate definition in DSP2833x_Examples.h

    EPwm3Regs.TBPHS.half.TBPHS = 0;    // Set Phase register to zero
    EPwm3Regs.TBCTL.bit.CTRMODE = count_mode;     // Load the parametric count mode
    EPwm3Regs.TBCTL.bit.PHSEN = TB_ENABLE;    // Slave module
    EPwm3Regs.TBCTL.bit.PRDLD = TB_SHADOW;
    EPwm3Regs.TBCTL.bit.SYNCOSEL = TB_SYNC_IN;    // sync flow-through
    EPwm3Regs.TBCTL.bit.FREE_SOFT = 2; //Free run at halt debug command (need for real time systems)
    EPwm3Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;
    EPwm3Regs.CMPCTL.bit.SHDWBMODE = CC_SHADOW;
    EPwm3Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm3Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm3Regs.AQCTLA.bit.CAU = AQ_SET;    // set actions for EPWM3A
    EPwm3Regs.AQCTLA.bit.CAD = AQ_CLEAR;
    EPwm3Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE;    // enable Dead-band module
    EPwm3Regs.DBCTL.bit.POLSEL = DB_ACTV_HIC;    // Active Hi complementary
    EPwm3Regs.DBFED = (unsigned int) (uS_DB*1000/CPU_RATE/2);    // Falling deadband parametric
    EPwm3Regs.DBRED = (unsigned int) (uS_DB*1000/CPU_RATE/2);   // Rising deadband parametric
    EALLOW;
    EPwm3Regs.TZCTL.bit.TZA = TZ_FORCE_LO; //Set Low as Trip-Zone action in EPWMxA
    EPwm3Regs.TZCTL.bit.TZB = TZ_FORCE_LO; //Set Low as Trip-Zone action in EPWMxB
    //EPwm3Regs.TZSEL.bit.OSHT1 = TZ_ENABLE; // if there were any Trip zone input, we must select it here
    EDIS;

    ModulationOFF();

    EPwm1Regs.CMPA.half.CMPA = (Uint16)(uS_period*1000/CPU_RATE/2/2*0.5);    // adjust duty for output EPWM1A
    EPwm2Regs.CMPA.half.CMPA = (Uint16)(uS_period*1000/CPU_RATE/2/2*0.5);    // adjust duty for output EPWM2A
    EPwm3Regs.CMPA.half.CMPA = (Uint16)(uS_period*1000/CPU_RATE/2/2*0.5);    // adjust duty for output EPWM3A
}

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
 *****************************************************************************************************************************/
void ePWM_Config_3P4L_param(float uS_period, unsigned int count_mode, float uS_DB, unsigned int SOCA)
{
    /*************************
     * PWM1,2,3,4 clock enable *
     *************************/
    EALLOW;
    SysCtrlRegs.PCLKCR0.bit.TBCLKSYNC = 0;   // Disable TBCLK within the ePWM
    SysCtrlRegs.PCLKCR1.bit.EPWM1ENCLK = 1;  // ePWM1
    SysCtrlRegs.PCLKCR1.bit.EPWM2ENCLK = 1;  // ePWM2
    SysCtrlRegs.PCLKCR1.bit.EPWM3ENCLK = 1;  // ePWM3
    SysCtrlRegs.PCLKCR1.bit.EPWM4ENCLK = 1;  // ePWM3
    SysCtrlRegs.PCLKCR0.bit.TBCLKSYNC = 1;   // Enable TBCLK within the ePWM
    EDIS;

    /* ***************
     * EPwm1 Config  *
     *****************/
    if(count_mode==TB_COUNT_UPDOWN) // if the mode is up-down, the value of TBPRD must be half of the period
        EPwm1Regs.TBPRD = (Uint16)(uS_period*1000/CPU_RATE/2/2);    // Load the Period register using the parametric period
                                                                    //and the CPU_Rate definition in DSP2833x_Examples.h
    else
        EPwm1Regs.TBPRD = (Uint16)(uS_period*1000/CPU_RATE/2);    // Load the Period register using the parametric period
                                                                    //and the CPU_Rate definition in DSP2833x_Examples.h

    EPwm1Regs.TBPHS.half.TBPHS = 0;    // Set Phase register to zero
    EPwm1Regs.TBCTL.bit.CTRMODE = count_mode;    // Load the parametric count mode
    EPwm1Regs.TBCTL.bit.PHSEN = TB_DISABLE;    // Master module
    EPwm1Regs.TBCTL.bit.PRDLD = TB_SHADOW;
    EPwm1Regs.TBCTL.bit.SYNCOSEL = TB_CTR_ZERO;    // Sync down-stream module
    EPwm1Regs.TBCTL.bit.FREE_SOFT = 2; //Free run at halt debug command (need for real time systems)
    EPwm1Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;
    EPwm1Regs.CMPCTL.bit.SHDWBMODE = CC_SHADOW;
    EPwm1Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm1Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm1Regs.AQCTLA.bit.CAU = AQ_SET;    // set actions for EPWM1A
    EPwm1Regs.AQCTLA.bit.CAD = AQ_CLEAR;
    EPwm1Regs.DBCTL.bit.IN_MODE = DBA_ALL;
    EPwm1Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE;    // enable Dead-band module
    EPwm1Regs.DBCTL.bit.POLSEL = DB_ACTV_HIC;    // Active Hi complementary
    EPwm1Regs.DBFED = (unsigned int) (uS_DB*1000/CPU_RATE/2);    // Falling deadband parametric
    EPwm1Regs.DBRED = (unsigned int) (uS_DB*1000/CPU_RATE/2);    // Rising deadband parametric
    EALLOW;
    EPwm1Regs.TZCTL.bit.TZA = TZ_FORCE_LO; //Set Low as Trip-Zone action in EPWMxA
    EPwm1Regs.TZCTL.bit.TZB = TZ_FORCE_LO; //Set Low as Trip-Zone action in EPWMxB
    //EPwm1Regs.TZSEL.bit.OSHT1 = TZ_ENABLE; // if there were any Trip zone input, we must select it here
    EDIS;

    if (SOCA!=0) // if it is specified in the function, use the SOCA trigger generator
    {
        EPwm1Regs.ETSEL.bit.SOCAEN = 1; // Enable SOCA trigger
        EPwm1Regs.ETSEL.bit.SOCASEL = SOCA;
    }
    else
        EPwm1Regs.ETSEL.bit.SOCAEN = 0; // Disable SOCA trigger

    /* ***************
     * EPwm2 Config  *
     *****************/
    if(count_mode==TB_COUNT_UPDOWN) // if the mode is up-down, the value of TBPRD must be half of the period
        EPwm2Regs.TBPRD = (Uint16)(uS_period*1000/CPU_RATE/2/2);    // Load the Period register using the parametric period
                                                                    //and the CPU_Rate definition in DSP2833x_Examples.h
    else
        EPwm2Regs.TBPRD = (Uint16)(uS_period*1000/CPU_RATE/2);    // Load the Period register using the parametric period
                                                                    //and the CPU_Rate definition in DSP2833x_Examples.h

    EPwm2Regs.TBPHS.half.TBPHS = 0;    // Set Phase register to zero
    EPwm2Regs.TBCTL.bit.CTRMODE = count_mode;    // Load the parametric count mode
    EPwm2Regs.TBCTL.bit.PHSEN = TB_ENABLE;    // Slave module
    EPwm2Regs.TBCTL.bit.PRDLD = TB_SHADOW;
    EPwm2Regs.TBCTL.bit.SYNCOSEL = TB_SYNC_IN;    // sync flow-through
    EPwm2Regs.TBCTL.bit.FREE_SOFT = 2; //Free run at halt debug command (need for real time systems)
    EPwm2Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;
    EPwm2Regs.CMPCTL.bit.SHDWBMODE = CC_SHADOW;
    EPwm2Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm2Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm2Regs.AQCTLA.bit.CAU = AQ_SET;    // set actions for EPWM2A
    EPwm2Regs.AQCTLA.bit.CAD = AQ_CLEAR;
    EPwm2Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE;    // enable Dead-band module
    EPwm2Regs.DBCTL.bit.POLSEL = DB_ACTV_HIC;    // Active Hi complementary
    EPwm2Regs.DBFED = (unsigned int) (uS_DB*1000/CPU_RATE/2);    // Falling deadband parametric
    EPwm2Regs.DBRED = (unsigned int) (uS_DB*1000/CPU_RATE/2);    // Rising deadband parametric
    EALLOW;
    EPwm2Regs.TZCTL.bit.TZA = TZ_FORCE_LO; //Set Low as Trip-Zone action in EPWMxA
    EPwm2Regs.TZCTL.bit.TZB = TZ_FORCE_LO; //Set Low as Trip-Zone action in EPWMxB
    //EPwm2Regs.TZSEL.bit.OSHT1 = TZ_ENABLE; // if there were any Trip zone input, we must select it here
    EDIS;

    /* ***************
     * EPwm3 Config  *
     *****************/
    if(count_mode==TB_COUNT_UPDOWN) // if the mode is up-down, the value of TBPRD must be half of the period
        EPwm3Regs.TBPRD = (Uint16)(uS_period*1000/CPU_RATE/2/2);    // Load the Period register using the parametric period
                                                                    //and the CPU_Rate definition in DSP2833x_Examples.h
    else
        EPwm3Regs.TBPRD = (Uint16)(uS_period*1000/CPU_RATE/2);    // Load the Period register using the parametric period
                                                                    //and the CPU_Rate definition in DSP2833x_Examples.h

    EPwm3Regs.TBPHS.half.TBPHS = 0;    // Set Phase register to zero
    EPwm3Regs.TBCTL.bit.CTRMODE = count_mode;     // Load the parametric count mode
    EPwm3Regs.TBCTL.bit.PHSEN = TB_ENABLE;    // Slave module
    EPwm3Regs.TBCTL.bit.PRDLD = TB_SHADOW;
    EPwm3Regs.TBCTL.bit.SYNCOSEL = TB_SYNC_IN;    // sync flow-through
    EPwm3Regs.TBCTL.bit.FREE_SOFT = 2; //Free run at halt debug command (need for real time systems)
    EPwm3Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;
    EPwm3Regs.CMPCTL.bit.SHDWBMODE = CC_SHADOW;
    EPwm3Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm3Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm3Regs.AQCTLA.bit.CAU = AQ_SET;    // set actions for EPWM3A
    EPwm3Regs.AQCTLA.bit.CAD = AQ_CLEAR;
    EPwm3Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE;    // enable Dead-band module
    EPwm3Regs.DBCTL.bit.POLSEL = DB_ACTV_HIC;    // Active Hi complementary
    EPwm3Regs.DBFED = (unsigned int) (uS_DB*1000/CPU_RATE/2);    // Falling deadband parametric
    EPwm3Regs.DBRED = (unsigned int) (uS_DB*1000/CPU_RATE/2);   // Rising deadband parametric
    EALLOW;
    EPwm3Regs.TZCTL.bit.TZA = TZ_FORCE_LO; //Set Low as Trip-Zone action in EPWMxA
    EPwm3Regs.TZCTL.bit.TZB = TZ_FORCE_LO; //Set Low as Trip-Zone action in EPWMxB
    //EPwm3Regs.TZSEL.bit.OSHT1 = TZ_ENABLE; // if there were any Trip zone input, we must select it here
    EDIS;

    /* ***************
     * EPwm4 Config  *
     *****************/
    if(count_mode==TB_COUNT_UPDOWN) // if the mode is up-down, the value of TBPRD must be half of the period
        EPwm4Regs.TBPRD = (Uint16)(uS_period*1000/CPU_RATE/2/2);    // Load the Period register using the parametric period
                                                                    //and the CPU_Rate definition in DSP2833x_Examples.h
    else
        EPwm4Regs.TBPRD = (Uint16)(uS_period*1000/CPU_RATE/2);    // Load the Period register using the parametric period
                                                                    //and the CPU_Rate definition in DSP2833x_Examples.h

    EPwm4Regs.TBPHS.half.TBPHS = 0;    // Set Phase register to zero
    EPwm4Regs.TBCTL.bit.CTRMODE = count_mode;     // Load the parametric count mode
    EPwm4Regs.TBCTL.bit.PHSEN = TB_ENABLE;    // Slave module
    EPwm4Regs.TBCTL.bit.PRDLD = TB_SHADOW;
    EPwm4Regs.TBCTL.bit.SYNCOSEL = TB_SYNC_IN;    // sync flow-through
    EPwm4Regs.TBCTL.bit.FREE_SOFT = 2; //Free run at halt debug command (need for real time systems)
    EPwm4Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;
    EPwm4Regs.CMPCTL.bit.SHDWBMODE = CC_SHADOW;
    EPwm4Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm4Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO;    // load on CTR=Zero
    EPwm4Regs.AQCTLA.bit.CAU = AQ_SET;    // set actions for EPWM3A
    EPwm4Regs.AQCTLA.bit.CAD = AQ_CLEAR;
    EPwm4Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE;    // enable Dead-band module
    EPwm4Regs.DBCTL.bit.POLSEL = DB_ACTV_HIC;    // Active Hi complementary
    EPwm4Regs.DBFED = (unsigned int) (uS_DB*1000/CPU_RATE/2);    // Falling deadband parametric
    EPwm4Regs.DBRED = (unsigned int) (uS_DB*1000/CPU_RATE/2);   // Rising deadband parametric
    EALLOW;
    EPwm4Regs.TZCTL.bit.TZA = TZ_FORCE_LO; //Set Low as Trip-Zone action in EPWMxA
    EPwm4Regs.TZCTL.bit.TZB = TZ_FORCE_LO; //Set Low as Trip-Zone action in EPWMxB
    //EPwm4Regs.TZSEL.bit.OSHT1 = TZ_ENABLE; // if there were any Trip zone input, we must select it here
    EDIS;

    ModulationOFF();


    EPwm1Regs.CMPA.half.CMPA = (Uint16)(uS_period*1000/CPU_RATE/2/2*0.5);    // adjust duty for output EPWM1A
    EPwm2Regs.CMPA.half.CMPA = (Uint16)(uS_period*1000/CPU_RATE/2/2*0.5);    // adjust duty for output EPWM2A
    EPwm3Regs.CMPA.half.CMPA = (Uint16)(uS_period*1000/CPU_RATE/2/2*0.5);    // adjust duty for output EPWM3A
    EPwm4Regs.CMPA.half.CMPA = (Uint16)(uS_period*1000/CPU_RATE/2/2*0.5);    // adjust duty for output EPWM4A
}


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
/*static inline void UpdatePWM_3ph(float du, float dv, float dw)
{
    EPwm1Regs.CMPA.half.CMPA = (Uint16) (EPwm1Regs.TBPRD*du);
    EPwm2Regs.CMPA.half.CMPA = (Uint16) (EPwm2Regs.TBPRD*dv);
    EPwm3Regs.CMPA.half.CMPA = (Uint16) (EPwm3Regs.TBPRD*dw);
}
*/
