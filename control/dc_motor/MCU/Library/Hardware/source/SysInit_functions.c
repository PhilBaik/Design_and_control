#include "DSP28x_Project.h"

//
// InitSysCtrl - This function initializes the System Control registers to a 
// known state.
// - Disables the watchdog
// - Set the PLLCR for proper SYSCLKOUT frequency
//

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
void InitSys_noWD(void)
{
    //
    // Disable the watchdog
    //
    DisableDog();

    //
    // Initialize the PLL control: PLLCR and DIVSEL
    // DSP28_PLLCR and DSP28_DIVSEL are defined in DSP2833x_Examples.h
    //
    InitPll(DSP28_PLLCR,DSP28_DIVSEL);
}
