/*
 * GPIO_functions.h
 *
 *  Created on: 23 nov. 2018
 *      Author: lab
 */

#ifndef LIBRARY_HEADERS_GPIO_FUNCTIONS_H_
#define LIBRARY_HEADERS_GPIO_FUNCTIONS_H_

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
void InitGpio_3ph(void);



#endif /* LIBRARY_HEADERS_GPIO_FUNCTIONS_H_ */
