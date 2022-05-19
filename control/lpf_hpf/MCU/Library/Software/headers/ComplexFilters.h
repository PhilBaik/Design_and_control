/*
 * ComplexFilters.h
 *
 *  Updated on: 25/04/2019
 *      by: Laborda
 *  Created on: 22 de sep. de 2017
 *      Author: guerr
 */

#ifndef COMPLEXFILTERS_H_
#define COMPLEXFILTERS_H_

#include <math.h>
#include "Library/Software/headers/Constants.h"
#include "Library/Software/headers/Filters.h"

// DQ struct definition
typedef struct {
    double    d;
    double    q;
} DQ;



/* ***********************************************************************************************************************
 * Function name: dq_Filter1
 * ***************************************************
 * Author: Laborda (extension from Filter1)
 * ***************************************************
 * Input parameters:
 *
 *      DQ* input: input vector (last 2 samples of the input signal (shifted))
 *      DQ* output: filtered output vector (last 2 samples of the output signal (shifted))
 *      DQ* num_coefs: vector with B0 and B1 parameters of the discrete filter
 *      DQ* den_coefs: vector with A0=1 and A1 parameter of the discrete filter
 *
 *.***************************************************
 * Output parameters:
 *
 *      none (void)
 *
 ******************************************************
 * Global variable dependences:
 *
 * N and N1 defined in "Constants.h"
 *
 ******************************************************
 *  Description: First order filter for DQ data G(z) = (b0+b1*z^-1)/(1+ a1*z^-1)
 *  Note 1: It is recommended to scale up the coefficient values if they are very small
 *          The output must be scaled down accordingly
 *  Note 2: The input and output vectors must be shifted before calling this function
 ****************************************************************************************************************************/
static inline void dq_Filter1(DQ input[], DQ output[], const double num_coefs[], const double den_coefs[])
{
    output[N].d = (num_coefs[N])*(input[N].d) + (num_coefs[N1])*(input[N1].d) - (den_coefs[N1])*(output[N1].d);
    output[N].q = (num_coefs[N])*(input[N].q) + (num_coefs[N1])*(input[N1].q) - (den_coefs[N1])*(output[N1].q);
}

/* ***********************************************************************************************************************
 * Function name: dq_Filter
 * ***************************************************
 * Author: Laborda (extension from Filter)
 * ***************************************************
 * Input parameters:
 *
 *      DQ* input: input vector (last 2 samples of the input signal (shifted))
 *      DQ* output: filtered output vector (last 2 samples of the output signal (shifted))
 *      DQ* num_coefs: vector with B0 and B1 parameters of the discrete filter
 *      DQ* den_coefs: vector with A0=1 and A1 parameter of the discrete filter
 *
 *.***************************************************
 * Output parameters:
 *
 *      none (void)
 *
 ******************************************************
 * Global variable dependences:
 *
 * N and N1 defined in "Constants.h"
 *
 ******************************************************
 *  Description: N order filter for DQ data (b0+b1*z^-1+...+bn*z^-n)/(1+ a1*z^-1+...+an*z^-n)
 *  Note 1: It is recommended to scale up the coefficient values if they are very small
 *          The output must be scaled down accordingly
 *  Note 2: The input and output vectors must be shifted before calling this function
 ****************************************************************************************************************************/
static inline void dq_Filter(DQ input[], DQ output[], const DQ num_coefs[], const DQ den_coefs[], const int order)
{
    register int index;

    // Filter calculation
    output[N].d = (num_coefs[N].d*input[N].d);
    output[N].q = (num_coefs[N].q*input[N].q);

    for(index = 1; index <= order; index++)
    {
        output[N].d+= num_coefs[index].d * input[index].d;
        output[N].q+= num_coefs[index].q * input[index].q;
    }

    for(index = 1; index <= order; index++)
    {
        output[N].d-= den_coefs[index].d * output[index].d;
        output[N].q-= den_coefs[index].q * output[index].q;
    }

}

/* ***********************************************************************************************************************
 * Function name: dq_PI_Reg
 * ***************************************************
 * Author: Cristina (extension from PI_Reg)
 * ***************************************************
 * Input parameters:
 *
 *      DQ* error: input error DQ vector (at least two positions: N, N1)
 *      DQ* control_action: output control action DQ vector (at least two positions: N, N1)
 *      DQ* num_coefs: vector with B0 and B1 parameters of the PI Controller (take a look to the guide about how to
 *                        calculate them from Kp and Ki)
 *
 *.***************************************************
 * Output parameters:
 *
 *      none (void)
 *
 ******************************************************
 * Global variable dependences:
 *
 * N and N1 defined in "Constants.h"
 *
 ******************************************************
 *  Description: PI regulator implementation for DQ struct data with asymmetries G(z) = (b0+b1*z^-1)/(1 - z^-1)
 *  Note 1: It is recommended to scale up the coefficient values if they are very small
 *          The output must be scaled down accordingly
 *  Note 2: The input and output vectors must be shifted before calling this function
 ****************************************************************************************************************************/
static inline void dq_PI_Reg(DQ error[], DQ control_action[], const DQ num_coefs[])
{
    control_action[N].d += num_coefs[N].d*error[N].d + num_coefs[N1].d*error[N1].d;
    control_action[N].q += num_coefs[N].q*error[N].q + num_coefs[N1].q*error[N1].q;
}

/* ***********************************************************************************************************************
 * Function name: DQ_BackwardPI_Reg
 * ***************************************************
 * Author: Cristina
 * ***************************************************
 * Input parameters:
 *
 *      DQ* error: input error DQ vector (at least two positions: N, N1)
 *      DQ* control_action: output control action DQ vector (at least two positions: N, N1)
 *      DQ* num_coefs: vector with B0 and B1 parameters of the PI Controller (take a look to the guide about how to
 *                        calculate them from Kp and Ki)
 *
 *.***************************************************
 * Output parameters:
 *
 *      none (void)
 *
 ******************************************************
 * Global variable dependences:
 *
 * N and N1 defined in "Constants.h"
 *
 ******************************************************
 *  Description: Backward PI regulator used in order to avoid windup of   *  errors (realizable references method)
 *  after saturating the control action
 *  Note 1: It is recommended to scale up the coefficient values if they are very small
 *          The output must be scaled down accordingly
 *  Note 2: The input and output vectors must be shifted before calling this function
  ****************************************************************************************************************************/
static inline void dq_BackwardPI_Reg(DQ error[], DQ control_action[], const DQ num_coefs[])
{
    error[N].d = (control_action[N].d - control_action[N1].d - num_coefs[N1].d*error[N1].d)/(num_coefs[N].d);
    error[N].q = (control_action[N].q - control_action[N1].q - num_coefs[N1].q*error[N1].q)/(num_coefs[N].q);
}

/* ***********************************************************************************************************************
 * Function name: subdq
 * ***************************************************
 * Author: Laborda copied from subqd (JuanMA)
 * ***************************************************
 * Input parameters:
 *
 *      DQ minuend: minuend of the subtraction
 *      DQ subtrahend: subtrahend of the subtraction
 *.***************************************************
 * Output parameters:
 *
 *      DQ difference: result of the subtraction.
 *
 ******************************************************
 * Global variable dependences:
 *      none
 ******************************************************
 *  Description: subtraction of DQ data
 ****************************************************************************************************************************/
static inline DQ subdq(DQ minuend, DQ subtrahend)
{
    DQ difference;

    difference.q = minuend.q - subtrahend.q;
    difference.d = minuend.d - subtrahend.d;

    return difference;
}

/* ***********************************************************************************************************************
 * Function name: ab2dq
 * ***************************************************
 * Author: Laborda
 * ***************************************************
 * Input parameters:
 *
 *     float fa: phase a signal
 *     float fb: phase b signal
 *     float fdq: output complex vector (QD)
 *
 *.***************************************************
 * Output parameters:
 *
 *      none (void)
 *
 ******************************************************
 * Global variable dependences:
 *      SQRT3DIV3 and TWOSQRT3DIV3 defined in "Constants.h"
 ******************************************************
 *  Description: three phase to dq stationary
 ****************************************************************************************************************************/
static inline void ab2dq(float fa, float fb, DQ * fdq)
{
     fdq->d = fa;
     fdq->q = SQRT3DIV3*fa + TWOSQRT3DIV3*fb;
}

/* ***********************************************************************************************************************
 * Function name: dq2abc
 * ***************************************************
 * Author: Laborda copied from qd2abc (Cristina)
 * ***************************************************
 * Input parameters:
 *
 *     float fa: phase a signal
 *     float fb: phase b signal
 *     float fc: phase c signal
 *     float fdq: output complex vector (DQ)
 *
 *.***************************************************
 * Output parameters:
 *
 *      none (void)
 *
 ******************************************************
 * Global variable dependences:
 *      SQRT3DIV2: defined in "Constants.h"
 ******************************************************
 *  Description: dq stationary to abc
 ****************************************************************************************************************************/
static inline void dq2abc(DQ fdq, float * fa, float * fb, float * fc)
{
     *fa = fdq.d;
     *fb = -0.5*fdq.d + SQRT3DIV2*fdq.q;
     *fc = -*fa-*fb;
}

/* ***********************************************************************************************************************
 * Function name: exp_jtheta
 * ***************************************************
 * Author: Laborda (adapted from QD reference frame (JuanMA))
 * ***************************************************
 * Input parameters:
 *
 *      input: DQ complex vector to rotate (d + jq)
 *      output: address of DQ complex vector output (d + jq)
 *      float cosine: cos(theta)
 *      float sine: sin(theta)
 *
 *.***************************************************
 * Output parameters:
 *
 *      none (void)
 *
 ******************************************************
 * Global variable dependences:
 *      none
 ******************************************************
 *  Description: Rotation of an arbitrary angle to a DQ variable. Used to go from one reference frame to another.
 ****************************************************************************************************************************/
static inline void exp_jtheta(DQ input, DQ *output, float cosine, float sine)
{
    output->d =  input.d*cosine  - input.q*sine;
    output->q =  input.d*sine    + input.q*cosine;
}


#endif /* MOTORCONTROL_H_ */
