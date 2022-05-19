
//#define Integ_Tustin(input,output,gain,tsamp) output += ((gain*tsamp)/2.0)*(*input + *(input+1))
static inline void Integ_Tustin(MFLT input[], MFLT output[], MFLT gain, MFLT tsamp)
{
    output[0] += ((gain*tsamp)/2.0)*(input[0] + input[1]);
}
//Function: adaptive_APF
// All-pass adptive filter
// input: variable to be filtered
// output: pointer to variable to store the filtered value
// x1: pointer to variable to store first filter state
// dx1: 2 element vector (derivative of x1)
// y1: pointer to variable to store the first stage output
// x2: pointer to variable to store second filter state
// dx2: 2 element vector (derivative of x2)
// omega: adaptive speed term - cutoff frequency (rad/s)
// ts: sampling period of the filter
static inline void Adaptive_APF(MFLT input, MFLT * output, MFLT * x1, MFLT * dx1, MFLT * y1, MFLT * x2, MFLT * dx2, MFLT omega,  MFLT const ts)
{
    SHIFT1(dx1);
    *dx1  = omega*(*y1);
    Integ_Tustin(dx1, x1, 1.0, ts);
    *y1 = input - *x1;

    SHIFT1(dx2);
    *dx2 = omega*(input-*x2);
    Integ_Tustin(dx2, x2, 1.0, ts);

    *output = *y1 - *x2;
}


// Function: adaptive_2HPF
// Second order adaptive filter
// input: variable to be filtered
// output: pointer to variable to store the filtered value
// x1: pointer to variable to store first filter state
// dx1: 2 element vector (derivative of x1)
// x2: pointer to variable to store second filter state
// dx2: 2 element vector (derivative of x2)
// omega: adaptive speed term - cutoff frequency (rad/s)
// xi_by_2 : filter damping factor multiplied by 2
// ts: sampling period of the filter
static inline void Adaptive_2HPF(MFLT input, MFLT * output, MFLT * x1, MFLT * dx1, MFLT * x2, MFLT * dx2, MFLT omega,MFLT const xi_by_2, MFLT const ts)
{
    SHIFT1(dx1);
    *dx1 = *output*omega;
    Integ_Tustin(dx1, x1, 1.0, ts);
    SHIFT1(dx2);
    *dx2 = *x1*omega;
    Integ_Tustin(dx2, x2, 1.0, ts);
    *output = input -(*x2) - xi_by_2*(*x1);
}

// Function: adaptive_2LPF
// Second order adaptive filter
// input: variable to be filtered
// output: pointer to variable to store the filtered value
// x1: pointer to variable to store first filter state
// dx1: 2 element vector (derivative of x1)
// dx2: 2 element vector (derivative of x2)
// omega: adaptive speed term - cutoff frequency (rad/s)
// xi_by_2 : filter damping factor multiplied by 2
// ts: sampling period of the filter
static inline void Adaptive_2LPF(MFLT input, MFLT * output, MFLT * x1, MFLT * dx1, MFLT * dx2, MFLT omega,MFLT const xi_by_2, MFLT const ts)
{
    SHIFT1(dx1);
    *dx1 = (input -*output - xi_by_2*(*x1))*omega;
    Integ_Tustin(dx1, x1, 1.0, ts);
    SHIFT1(dx2);
    *dx2 = *x1*omega;
    Integ_Tustin(dx2, output, 1.0, ts);
}
