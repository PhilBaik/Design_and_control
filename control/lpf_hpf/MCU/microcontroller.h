/*
 * microcontroller.h
 *
 *  Created on: 02/25 2022
 *  Modified by (list): Ye gu Kang 
 */

#ifndef MICROCONTROLLER_H_
#define MICROCONTROLLER_H_
/*
#include "Library/Software/headers/Constants.h"
#include "Library/Software/headers/ComplexFilters.h"
#include "Library/Software/headers/Filters.h"
#include "Library/Software/headers/Constants.h"
#include "Library/Software/Ohter/Other_Filters.h"
#include "Library/Software/headers/Constants.h"

*/
// Function prototypes
void microcontroller(const double * adc, double * dac);
void init_software(void);


// Constant definitions
#define TS (1e-5)
#define B1_ID_F    (TS*KI_ID_F/2.0-KP_ID_F)

#endif /* MICROCONTROLLER_H_ */
