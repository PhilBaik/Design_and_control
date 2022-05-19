/*
 * ADC_functions.h
 *
 *  Created on: 10 nov. 2018
 *      Author: lab
 */

#ifndef LIBRARY_ADC_FUNCTIONS_H_
#define LIBRARY_ADC_FUNCTIONS_H_

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
void ADC_Config_SOCA_4Conv(void);
void ADC_Config_SOCA_2Conv(void);
void ADC_Config_SOCA_3Conv(void);

#endif /* LIBRARY_ADC_FUNCTIONS_H_ */
