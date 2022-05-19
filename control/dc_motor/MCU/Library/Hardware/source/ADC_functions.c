/*
 * ADC_functions.c
 *
 *  Created on: 10 nov. 2018
 *      Author: lab
 */
#include "DSP28x_Project.h"

/* ***********************************************************************************************************************
 * Function name: ADC_Config_SOCA_4Conv
 * ***************************************************
 * Author: Carlo
 * ***************************************************
 * Input parameters:
 *
 *      none (void)
 *
 *.***************************************************
 * Output parameters:
 *
 *      none (void)
 *
 ******************************************************
 * Global variable dependences:
 *
 *      volatile struct ADC_REGS AdcRegs: Definition of the ADC Registers made in "DSP2833x_GlobalVariableDefs.c"
 *
 ******************************************************
 *  Description: Configure the ADC module for 4 conversions (A0,B0,A1,B1) triggered by the SOCA
 ****************************************************************************************************************************/
void ADC_Config_SOCA_4Conv(void)
{

        // Configure ADC

        EALLOW;
        SysCtrlRegs.HISPCP.all = 3;
        EDIS;

        AdcRegs.ADCTRL1.bit.SEQ_CASC = 1;   //Cascade sequencer

        AdcRegs.ADCTRL3.bit.SMODE_SEL = 0x1; // Setup simultaneous sampling mode

        //Select Sequencing mode, and number of conversions per sequence
        AdcRegs.ADCMAXCONV.all = 0x1;       // Setup 2 conv's on SEQ1

        //Select channels to convert(o meglio: select channels to measure)
        AdcRegs.ADCCHSELSEQ1.bit.CONV00 = 0x0; // Setup ADCINA0 as 1st SEQ1 conv. -> iL1
        AdcRegs.ADCCHSELSEQ1.bit.CONV01 = 0x8; // Setup ADCINB0 as 2nd SEQ1 conv. -> iL2
        //AdcRegs.ADCCHSELSEQ1.bit.CONV02 = 0x8; // Setup ADCINB0 as 3rd SEQ1 conv. -> ePWM3
        //AdcRegs.ADCCHSELSEQ1.bit.CONV03 = 0x9; // Setup ADCINB1 as 4th SEQ1 conv. -> ePWM4

        //Select the SOC type
        AdcRegs.ADCTRL2.bit.RST_SEQ1 = 1;// Reset ADC
        AdcRegs.ADCTRL2.bit.SOC_SEQ1 = 0;// Clear pending SOC trigger
        AdcRegs.ADCTRL2.bit.EPWM_SOCA_SEQ1=1; //Allows SEQ1/SEQ to be started by ePWMx SOCA trigger. The ePWMs can be programmed to start a conversion on various events.

        //Interrupt every END OF SEQUENCE
        AdcRegs.ADCTRL2.bit.INT_ENA_SEQ1 = 1;  //Enable SEQ1 interrupt (every EOS)-- noi la attiveremo per fare l'anelo di controllo

        // configure AD clocking--il convertitore lavora per comparazione- ha bisogno di tempo per fare ciascuna comparazione
        // @DOC SPRU716B, pp 28, 34, 38
        // AD prescaler
        // ADCCLKPS==0      ADCLK = HSPCLK/(CPS + 1)
        // ADCCLKPS(!=0)    ADCLK = HSPCLK/[2*ADCCLKPS*(CPS + 1)]
        AdcRegs.ADCTRL3.bit.ADCCLKPS=3;
        AdcRegs.ADCTRL1.bit.CPS=1;

        // Acquisition window size ((ACQ_PS+1)*ADCLKK --AD clock) -- il tempo che ci mette il condensatore a caricare
        AdcRegs.ADCTRL1.bit.ACQ_PS=0xF;

}




void ADC_Config_SOCA_2Conv(void)
{
    // Configure ADC
    // Define ADCCLK clock frequency ( less than or equal to 25 MHz )
    // Assuming InitSysCtrl() has set SYSCLKOUT to 150 MHz
        EALLOW;
        SysCtrlRegs.HISPCP.all = 3;
        EDIS;

        AdcRegs.ADCTRL1.bit.SEQ_CASC =1;            // 1=cascaded sequencer
        AdcRegs.ADCTRL1.bit.CPS = 0;                // divide by 1
        AdcRegs.ADCTRL1.bit.CONT_RUN = 0;           // single run mode
        AdcRegs.ADCMAXCONV.all = 1;                 // Setup 3 conv's on SEQ1 //cambiado Ger

        //Select channels to convert(o meglio: select channels to measure)
        AdcRegs.ADCCHSELSEQ1.bit.CONV00 = 0x0; // Setup ADCINA0 as 1st SEQ1 conv. -> iL1
        AdcRegs.ADCCHSELSEQ1.bit.CONV01 = 0x8; // Setup ADCINB0 as 2nd SEQ1 conv. -> iL2

        //AdcRegs.ADCCHSELSEQ1.bit.CONV03 = 0;      // Setup ADCINA0 as 4th SEQ1 conv. (Vload) //No se usa en este programa
        //AdcRegs.ADCCHSELSEQ2.bit.CONV04 = 8;      // Setup ADCINB0 as 5th SEQ2 conv. (Vbus) //No se usa en este programa
        AdcRegs.ADCTRL2.bit.EPWM_SOCA_SEQ1 = 1;     // Enable SOCA from ePWM to start SEQ1
        AdcRegs.ADCTRL2.bit.INT_ENA_SEQ1 = 1;       // Enable SEQ1 interrupt (every EOS)

}


void ADC_Config_SOCA_3Conv(void)
{
    // Configure ADC

    EALLOW;
    SysCtrlRegs.HISPCP.all = 3;
    EDIS;

    AdcRegs.ADCTRL1.bit.SEQ_CASC = 1;   //Cascade sequencer

    AdcRegs.ADCTRL3.bit.SMODE_SEL = 0x1; // Setup simultaneous sampling mode

    //Select Sequencing mode, and number of conversions per sequence
    AdcRegs.ADCMAXCONV.all = 0x1;       // Setup 2 conv's on SEQ1

    //Select channels to convert(o meglio: select channels to measure)
    AdcRegs.ADCCHSELSEQ1.bit.CONV00 = 0x0; // Setup ADCINA0 as 1st SEQ1 conv. -> iL1
    AdcRegs.ADCCHSELSEQ1.bit.CONV01 = 0x1; // Setup ADCINB0 as 2nd SEQ1 conv. -> iL2
    //AdcRegs.ADCCHSELSEQ1.bit.CONV02 = 0x8; // Setup ADCINB0 as 3rd SEQ1 conv. -> ePWM3
    //AdcRegs.ADCCHSELSEQ1.bit.CONV03 = 0x9; // Setup ADCINB1 as 4th SEQ1 conv. -> ePWM4

    //Select the SOC type
    AdcRegs.ADCTRL2.bit.RST_SEQ1 = 1;// Reset ADC
    AdcRegs.ADCTRL2.bit.SOC_SEQ1 = 0;// Clear pending SOC trigger
    AdcRegs.ADCTRL2.bit.EPWM_SOCA_SEQ1=1; //Allows SEQ1/SEQ to be started by ePWMx SOCA trigger. The ePWMs can be programmed to start a conversion on various events.

    //Interrupt every END OF SEQUENCE
    AdcRegs.ADCTRL2.bit.INT_ENA_SEQ1 = 1;  //Enable SEQ1 interrupt (every EOS)-- noi la attiveremo per fare l'anelo di controllo

    // configure AD clocking--il convertitore lavora per comparazione- ha bisogno di tempo per fare ciascuna comparazione
    // @DOC SPRU716B, pp 28, 34, 38
    // AD prescaler
    // ADCCLKPS==0      ADCLK = HSPCLK/(CPS + 1)
    // ADCCLKPS(!=0)    ADCLK = HSPCLK/[2*ADCCLKPS*(CPS + 1)]
    AdcRegs.ADCTRL3.bit.ADCCLKPS=3;
    AdcRegs.ADCTRL1.bit.CPS=1;

    // Acquisition window size ((ACQ_PS+1)*ADCLKK --AD clock) -- il tempo che ci mette il condensatore a caricare
    AdcRegs.ADCTRL1.bit.ACQ_PS=0xF;

}
