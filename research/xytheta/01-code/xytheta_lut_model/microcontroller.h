/*
 * microcontroller.h
 *
 *  Created on: 02/25 2022
 *  Modified by (list): Ye gu Kang 
 */

#ifndef MICROCONTROLLER_H_
#define MICROCONTROLLER_H_

#include "Library/Software/headers/Constants.h"


// Function prototypes
void microcontroller(const double *adc1,const double *adc2,const double *adc3,const double *adc4,const double *adc5,
                     const double *adc6,const double *adc7, const double *adc8,const double *adc9,const double *adc10, 
                     const double *adc11, const double *adc12, double *dac1, double *dac2, double *dac3);

//void init_software(void);
void init_software(void);

// Constant definitions
#define TS (1e-5)
#define PI (3.141592653589793)
#define TWOPI (6.283185307179586)
#define TWOPIDIV3 (2.094395102393195)
#define PIDIV2 (1.570796326794897)
#define PIDIV3 (1.047197551196598)
#define SQRT2 (1.414213562373095)
#define SQRT3DIV2 (0.866025403784439)
#define SQRT3DIV3 (0.577350269189626)
#define TWOSQRT3DIV3 (1.154700538379251)

#define N    0
#define N1   1
#define N2	 2
#define p    2.0
#define kg   3000
#define f_cutoff 1.5

#define DTDIV2  100e-6  // TS/2
#endif /* MICROCONTROLLER_H_ */
