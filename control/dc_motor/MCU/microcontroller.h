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
#include "Library/Software/Ohter/Other_Filters.h"

*/
// Function prototypes
void microcontroller(const double * adc, double * dac);
void init_software(void);


// Constant definitions
#define TS (1e-5)
#define B1_ID_F    (TS*KI_ID_F/2.0-KP_ID_F)
#define P_rated (15)
#define V_rated (12)
#define I_rated (4)
#define omega_rated (300*2*PI/60)
#define R_a (0.26)
#define L_a (1.7e-3)
#define J (0.00252)
#define B (0.0001)

#define f_cutoff_c (100)
#define k_p (L_a*2*PI*f_cutoff_c)
#define k_i (R_a*2*PI*f_cutoff_c)

#define f_cutoff_vel (10)


#endif /* MICROCONTROLLER_H_ */
