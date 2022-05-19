/* FIlter effect example
* Date: 02/25/2022
* Modified by (list):
* Ye gu Kang
*/

#include <math.h>
#include "microcontroller.h"
#include "Library/Software/headers/Filters.h"
#include "Library/Software/headers/ComplexFilters.h"
#include "Library/Software/headers/Constants.h"
//#include "Library/Software/Other/Other_Filters.h"


// Global variables
double f_cutoff;
double Sig_input[2];
double Sig_In[2];
double Sig_out_HPF[2];
double Sig_out_LPF[2];
double LPF_num_coefs[2];
double LPF_den_coefs[2];
double HPF_num_coefs[2];
double HPF_den_coefs[2];

void init_software(void)
{
    f_cutoff=100;
    Sig_input[0]=0;     Sig_input[1]=0;
    Sig_input[0]=0;     Sig_input[1]=0;


    Sig_In[0]=0;
    Sig_In[1]=0;
    Sig_out_HPF[0]=0;       Sig_out_HPF[0]=0;

    Sig_out_HPF[1]=0;       Sig_out_HPF[1]=0;

    Sig_out_LPF[0]=0;       Sig_out_LPF[0]=0;

    Sig_out_LPF[1]=0;       Sig_out_LPF[1]=0;


    HPF_num_coefs[0] = 2/(2+2*PI*f_cutoff*TS);
    HPF_num_coefs[1] = -2/(2+2*PI*f_cutoff*TS);
    HPF_den_coefs[0] = 1.0;
    HPF_den_coefs[1] = -(2*PI*f_cutoff*TS-2)/(2+2*PI*f_cutoff*TS);

    LPF_num_coefs[0]=  2*PI*f_cutoff*TS/(2+2*PI*f_cutoff*TS);
    LPF_num_coefs[1]=  2*PI*f_cutoff*TS/(2+2*PI*f_cutoff*TS);
    LPF_den_coefs[0] = 1.0;
    LPF_den_coefs[1] = -(2*PI*f_cutoff*TS-2)/(2+2*PI*f_cutoff*TS);

}



void microcontroller(const double * adc, double * dac)
{
    // State shift
    Sig_input[1] = Sig_input[0];
    Sig_out_LPF[1] = Sig_out_LPF[0];
    Sig_out_HPF[1] = Sig_out_HPF[0];
    

    // Read inputs   (Replace in hardware)
    Sig_input[0] = (double) *(adc);
    Sig_out_LPF[0] = (LPF_num_coefs[0])*(Sig_input[0]) + (LPF_num_coefs[1])*(Sig_input[1]) + (LPF_den_coefs[1])*(Sig_out_LPF[1]);
    Sig_out_HPF[0] = (HPF_num_coefs[0])*(Sig_input[0]) + (HPF_num_coefs[1])*(Sig_input[1]) + (HPF_den_coefs[1])*(Sig_out_HPF[1]);
    
   
    // Write output
    
    dac[0] = (double) Sig_out_HPF[0];
    dac[1] = (double) Sig_out_LPF[0];
    dac[2] = (double) Sig_input[0];
}

