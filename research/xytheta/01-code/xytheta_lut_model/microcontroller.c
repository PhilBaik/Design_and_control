/* microcontroller
 * Date: 04/17/2022
 * Modified by (list):
 * Hyeong meen Baik
 */

#include <stdio.h>
//#define _USE_MATH_DEFINES
//#include <math.h>
#include "microcontroller.h"

double abc1[3][1];
double abc2[3][1];
double abc3[3][1];

double a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4;
double theta_hat[2]; 
double x_hat[2]; 
double y_hat[2];
double theta_hat_lpf[2]; 
double x_hat_lpf[2]; 
double y_hat_lpf[2];
double LPF_num_coefs[2];
double LPF_den_coefs[2];
int lpf_enable;

void init_software(void)
{
    x_hat[0]=0;         x_hat[1]=0;
    y_hat[0]=0;         y_hat[1]=0;
    theta_hat[0]=0;     theta_hat[1]=0;
    x_hat_lpf[0]=0;     x_hat_lpf[1]=0;
    y_hat_lpf[0]=0;     y_hat_lpf[1]=0;
    theta_hat_lpf[0]=0; theta_hat_lpf[1]=0;

    LPF_num_coefs[0]=  2*PI*f_cutoff*TS/(2+2*PI*f_cutoff*TS);
    LPF_num_coefs[1]=  2*PI*f_cutoff*TS/(2+2*PI*f_cutoff*TS);
    LPF_den_coefs[0] = 1.0;
    LPF_den_coefs[1] = -(2*PI*f_cutoff*TS-2)/(2+2*PI*f_cutoff*TS);

}

void microcontroller(const double *adc1,const double *adc2,const double *adc3,const double *adc4,const double *adc5,
                     const double *adc6,const double *adc7, const double *adc8,const double *adc9,const double *adc10, 
                     const double *adc11, const double *adc12, double *dac1, double *dac2, double *dac3)
{
    LPF_num_coefs[0]=  2*PI*f_cutoff*TS/(2+2*PI*f_cutoff*TS);
    LPF_num_coefs[1]=  2*PI*f_cutoff*TS/(2+2*PI*f_cutoff*TS);
    LPF_den_coefs[0] = 1.0;
    LPF_den_coefs[1] = -(2*PI*f_cutoff*TS-2)/(2+2*PI*f_cutoff*TS);
    
    lpf_enable = 0;

    int i,j;
    double multi[8];
    double add[4];
    double atan2_out[2];
    double rotation_out[2];
        


    double dq_tf[3][3] = {
    {(double)2/3,(double)-1/3,(double)-1/3},
    {0,sqrt(3)/3,-sqrt(3)/3},
    {(double)1/3,(double)1/3,(double)1/3}
    }; //output
    
    //read input
    a1 = (double) *(adc1);
    b1 = (double) *(adc2);
    c1 = (double) *(adc3);
    a2 = (double) *(adc4);
    b2 = (double) *(adc5);
    c2 = (double) *(adc6);
    a3 = (double) *(adc7);
    b3 = (double) *(adc8);
    c3 = (double) *(adc9);
    a4 = (double) *(adc10);
    b4 = (double) *(adc11);
    c4 = (double) *(adc12);


    //dq transform
    double dq[12]={0,};
    for(i=0;i<3;i++){
        dq[i]=dq_tf[i][0]*(a1)+dq_tf[i][1]*(b1)+dq_tf[i][2]*(c1);
        dq[i+3]=dq_tf[i][0]*(a2)+dq_tf[i][1]*(b2)+dq_tf[i][2]*(c2);
        dq[i+6]=dq_tf[i][0]*(a3)+dq_tf[i][1]*(b3)+dq_tf[i][2]*(c3);
        dq[i+9]=dq_tf[i][0]*(a4)+dq_tf[i][1]*(b4)+dq_tf[i][2]*(c4);
    }

    //multiplication
    for(i=0;i<4;i++){
        multi[2*i]=dq[3*i]*dq[3*i+2];
        multi[2*i+1]=dq[3*i+1]*dq[3*i+2];
    }
    
    //atan2
    atan2_out[0] = atan2(dq[4],dq[0]);
    atan2_out[1] = atan2(dq[1],dq[3]);
    
    //adder
    add[0]=multi[0]-multi[2];
    add[1]=multi[1]-multi[3];
    add[2]=multi[4]-multi[6];
    add[3]=multi[5]-multi[7];
    
    //rotation
    rotation_out[0]=sqrt(3)*add[2]/2+add[3]/2;
    rotation_out[1]= -add[2]/2+sqrt(3)*add[3]/2;

    //output(theta, x, y)
    theta_hat[0] = (atan2_out[0]+atan2_out[1])*0.5*180/PI/p;
    x_hat[0] = kg*(add[0]+rotation_out[0]);
    y_hat[0] = kg*(-add[1]-rotation_out[1]);

    if(lpf_enable ==1){
    //LPF implementation
        theta_hat_lpf[0] = (LPF_num_coefs[0])*(theta_hat[0]) + (LPF_num_coefs[1])*(theta_hat[1]) + (LPF_den_coefs[1])*(theta_hat_lpf[1]);
        x_hat_lpf[0] = (LPF_num_coefs[0])*(x_hat[0]) + (LPF_num_coefs[1])*(x_hat[1]) + (LPF_den_coefs[1])*(x_hat_lpf[1]);
        y_hat_lpf[0] = (LPF_num_coefs[0])*(y_hat[0]) + (LPF_num_coefs[1])*(y_hat[1]) + (LPF_den_coefs[1])*(y_hat_lpf[1]);
    //output(connection)
        *dac1 = (double) theta_hat[0];
        *dac2 = (double) x_hat_lpf[0];
        *dac3 = (double) y_hat_lpf[0];
    }
    else {
        *dac1 = (double) theta_hat[0];
        *dac2 = (double) x_hat[0];
        *dac3 = (double) y_hat[0];
    }

    //shift states
    theta_hat[1] = theta_hat[0];
    x_hat[1] = x_hat[0];
    y_hat[1] = y_hat[0];
    theta_hat_lpf[1] = theta_hat_lpf[0];
    x_hat_lpf[1] = x_hat_lpf[0];
    y_hat_lpf[1] = y_hat_lpf[0];
}
