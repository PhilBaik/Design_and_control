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
double I_a[2];
double theta_m[2];
double a[2],b[2],c[2],d[2];
double V_a, V_in;
double add[4];
double v;
double T_rated = (P_rated/I_rated);
double k_e, k_t, k_e_hat, k_ps, k_is, temp;



void init_software(void)
{
    I_a[1]=0;               I_a[0]=0;
    theta_m[1]=0;       theta_m[0]=0;
    a[0]=0;      a[1]=0;      b[0]=0;      b[1]=0;      
    c[0]=0;      c[1]=0;      d[0]=0;      d[1]=0;
    add[0]=0;      add[1]=0;      add[2]=0;      add[3]=0;  
    V_a=0;       V_in=0;
    v=0;
    k_e = T_rated/I_rated;
    k_t = k_e; 
    k_e_hat = k_e;
    k_ps = J/k_t*2*PI*f_cutoff_vel;
    k_is = k_ps/5*2*PI*f_cutoff_vel;
}



void microcontroller(const double * adc, double * dac)
{
    // Read inputs   (Replace in hardware)
    I_a[0] = (double) *(adc);
    theta_m[0] = (double) *(adc+1);
    V_in = (double) *(adc+2);

    // Velcocity calculator
    v =(theta_m[0]-theta_m[1])/TS;

    // Velocity Controller
    a[0] = k_is*(V_in - v);
    b[0] = b[1] + TS/2*(a[1]+a[0]);
    add[0] = k_ps*(V_in - v) + b[0];
    add[1] = add[0] - I_a[0];

    // Current Controller
    c[0] = k_i*add[1];
    d[0] = d[1] + TS/2*(c[0]+c[1]);
    add[2] = k_p*add[1]+d[0];
    add[3] = add[2] + k_e_hat*v;
 


    // Write output (Replace in hardware) 
    dac[0] = (double) add[3];
    
    // shifting states
    a[1] = a[0];
    b[1] = b[0];
    c[1] = c[0];
    d[1] = d[0];
    I_a[1] = I_a[0];
    theta_m[1] = theta_m[0];

}

