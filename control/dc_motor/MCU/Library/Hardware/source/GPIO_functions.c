/*
 * GPIO_functions.c
 *
 *  Created on: 23 nov. 2018
 *      Author: lab
 */

#include "DSP28x_Project.h"

/* ***********************************************************************************************************************
 * Function name: InitGpio_3ph
 * **************************************************************
 * Author: Laborda
 * ***************************************************
 * Input parameters:
 *
 *      none (void)
 *
 ***************************************************************
 * Output parameters:
 *
 *      none (void)
 *
 ***************************************************************
 * Global variable dependences:
 *
 *      volatile struct GPIO_CTRL_REGS GpioCtrlRegs: Definition of the GPIO Control Registers made in "DSP2833x_GlobalVariableDefs.c"
 *      volatile struct GPIO_DATA_REGS GpioDataRegs: Definition of the GPIO Data Registers made in "DSP2833x_GlobalVariableDefs.c"
 *
 ***************************************************************
 *  Description:  Initialize GPIOs for Control PCB and 3ph PWM
 ****************************************************************************************************************************/
void InitGpio_3ph(void)
{
    EALLOW;

    //
    // Each GPIO pin can be:
    // a) a GPIO input/output
    // b) peripheral function 1
    // c) peripheral function 2
    // d) peripheral function 3
    // By default, all are GPIO Inputs
    //
    GpioCtrlRegs.GPAMUX1.all = 0x0000;     // First: GPIO functionality GPIO0-GPIO15
    GpioCtrlRegs.GPAMUX1.bit.GPIO0=1;  //EPWM1A TOPU1
    GpioCtrlRegs.GPAMUX1.bit.GPIO1=1;  //EPWM1B BOTU1
    GpioCtrlRegs.GPAMUX1.bit.GPIO2=1;  //EPWM2A TOPV1
    GpioCtrlRegs.GPAMUX1.bit.GPIO3=1;  //EPWM2B BOTV1
    GpioCtrlRegs.GPAMUX1.bit.GPIO4=1;  //EPWM3A TOPW1
    GpioCtrlRegs.GPAMUX1.bit.GPIO5=1;  //EPWM3B BOTW1



    GpioCtrlRegs.GPAMUX2.all = 0x0000;     // GPIO functionality GPIO16-GPIO31
    GpioCtrlRegs.GPBMUX1.all = 0x0000;     // GPIO functionality GPIO32-GPIO39
    GpioCtrlRegs.GPBMUX2.all = 0x0000;     // GPIO functionality GPIO48-GPIO63
    GpioCtrlRegs.GPCMUX1.all = 0x0000;     // GPIO functionality GPIO64-GPIO79
    GpioCtrlRegs.GPCMUX2.all = 0x0000;     // GPIO functionality GPIO80-GPIO95

    GpioCtrlRegs.GPADIR.all = 0x0000;      // GPIO0-GPIO31 are inputs
    GpioCtrlRegs.GPBDIR.all = 0x0000;      // GPIO32-GPIO63 are inputs
    GpioCtrlRegs.GPCDIR.all = 0x0000;      // GPI064-GPIO95 are inputs


    GpioCtrlRegs.GPAPUD.bit.GPIO6 = 0;   // Enable pullup on GPIO6
    GpioDataRegs.GPACLEAR.bit.GPIO6 = 1;   // Load output latch
    GpioCtrlRegs.GPAMUX1.bit.GPIO6 = 0;  // General purpouse output
    GpioCtrlRegs.GPADIR.bit.GPIO6=1;      // GPIO6 = output

    GpioCtrlRegs.GPAPUD.bit.GPIO18 = 0;   // Enable pullup on GPIO18
    GpioDataRegs.GPASET.bit.GPIO18 = 1;   // Load output latch
    GpioCtrlRegs.GPAMUX2.bit.GPIO18 = 0;  // General purpouse output
    GpioCtrlRegs.GPADIR.bit.GPIO18 = 1;   // GPIO18 = output

    GpioCtrlRegs.GPBPUD.bit.GPIO59 = 0;   // Enable pullup on GPIO59
    GpioDataRegs.GPBCLEAR.bit.GPIO59 = 1;   // Load output latch
    GpioCtrlRegs.GPBMUX2.bit.GPIO59 = 0;  // General purpouse output
    GpioCtrlRegs.GPBDIR.bit.GPIO59 = 1;   // GPIO59 = output

    GpioCtrlRegs.GPBPUD.bit.GPIO61 = 0;   // Enable pullup on GPIO59
	GpioDataRegs.GPBCLEAR.bit.GPIO61 = 1;   // Load output latch
	GpioCtrlRegs.GPBMUX2.bit.GPIO61 = 0;  // General purpouse output
	GpioCtrlRegs.GPBDIR.bit.GPIO61 = 1;   // GPIO59 = output

	GpioCtrlRegs.GPBPUD.bit.GPIO63 = 0;   // Enable pullup on GPIO59
	GpioDataRegs.GPBCLEAR.bit.GPIO63 = 1;   // Load output latch
	GpioCtrlRegs.GPBMUX2.bit.GPIO63 = 0;  // General purpouse output
	GpioCtrlRegs.GPBDIR.bit.GPIO63 = 1;   // GPIO59 = output

    GpioCtrlRegs.GPBPUD.bit.GPIO58 = 0;   // Enable pullup on GPIO58
    GpioDataRegs.GPBSET.bit.GPIO58 = 1;   // Load output latch
    GpioCtrlRegs.GPBMUX2.bit.GPIO58 = 0;  // General purpouse output
    GpioCtrlRegs.GPBDIR.bit.GPIO58 = 1;   // GPIO58 = output

    //Encoder Inputs
    GpioCtrlRegs.GPAMUX2.bit.GPIO20 = 1; // eQEP1A active
    GpioCtrlRegs.GPAMUX2.bit.GPIO21 = 1; // eQEP1B active
    GpioCtrlRegs.GPAMUX2.bit.GPIO23 = 1; // eQEP1I active



    //
    // Each input can have different qualification
    // a) input synchronized to SYSCLKOUT
    // b) input qualified by a sampling window
    // c) input sent asynchronously (valid for peripheral inputs only)
    //
    GpioCtrlRegs.GPAQSEL1.all = 0x0000;    // GPIO0-GPIO15 Synch to SYSCLKOUT
    GpioCtrlRegs.GPAQSEL2.all = 0x0000;    // GPIO16-GPIO31 Synch to SYSCLKOUT
    GpioCtrlRegs.GPBQSEL1.all = 0x0000;    // GPIO32-GPIO39 Synch to SYSCLKOUT
    GpioCtrlRegs.GPBQSEL2.all = 0x0000;    // GPIO48-GPIO63 Synch to SYSCLKOUT

    //
    // Pull-ups can be enabled or disabled
    //
    GpioCtrlRegs.GPAPUD.all = 0x0000;      // Pullup's enabled GPIO0-GPIO31
    GpioCtrlRegs.GPBPUD.all = 0x0000;      // Pullup's enabled GPIO32-GPIO63
    GpioCtrlRegs.GPCPUD.all = 0x0000;      // Pullup's enabled GPIO64-GPIO79
    //GpioCtrlRegs.GPAPUD.all = 0xFFFF;    // Pullup's disabled GPIO0-GPIO31
    //GpioCtrlRegs.GPBPUD.all = 0xFFFF;    // Pullup's disabled GPIO32-GPIO34
    //GpioCtrlRegs.GPCPUD.all = 0xFFFF;    // Pullup's disabled GPIO64-GPIO79

    EDIS;
}
