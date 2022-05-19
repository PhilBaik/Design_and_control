/*
 * SysInit_functions.h
 *
 *  Created on: 11 nov. 2018
 *      Author: lab
 */

#ifndef LIBRARY_HEADERS_SYSINIT_FUNCTIONS_H_
#define LIBRARY_HEADERS_SYSINIT_FUNCTIONS_H_

/* ***********************************************************************************************************************
 * Function name: InitSys_noWD
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
 *      DSP28_PLLCR and DSP28_DIVSEL definitions made in "DSP2833x_Examples.h"
 *      void DisableDog(void) function defined in "DSP2833x_SysCtrl.c"
 *      void InitPll(Uint16 val, Uint16 divsel) function defined in "DSP2833x_SysCtrl.c"
 *
 ***************************************************************
 *  Description:  Initialize the System clock and disables the WatchDog
 ****************************************************************************************************************************/
void InitSys_noWD(void);



#endif /* LIBRARY_HEADERS_SYSINIT_FUNCTIONS_H_ */
