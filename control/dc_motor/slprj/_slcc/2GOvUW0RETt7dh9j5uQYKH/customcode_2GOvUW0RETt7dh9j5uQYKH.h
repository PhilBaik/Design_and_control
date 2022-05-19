#ifndef __customcode_2GOvUW0RETt7dh9j5uQYKH_h__
#define __customcode_2GOvUW0RETt7dh9j5uQYKH_h__

/* Include files */
#include "mex.h"
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include "tmwtypes.h"


/* Helper definitions for DLL support */
#if defined _WIN32 
  #define DLL_EXPORT_CC    
#else
  #if __GNUC__ >= 4
    #define DLL_EXPORT_CC __attribute__ ((visibility ("default")))
  #else
    #define DLL_EXPORT_CC
  #endif
#endif
/* Custom Code from Simulation Target dialog */
#include "microcontroller.h"
#include "Library/Software/headers/Filters.h"
#include "Library/Software/headers/ComplexFilters.h"
#include "Constants.h"


/* Function Declarations */
#ifdef __cplusplus
extern "C" {
#endif
DLL_EXPORT_CC void customcode_2GOvUW0RETt7dh9j5uQYKH_initializer(void);

#define customcode_2GOvUW0RETt7dh9j5uQYKH_terminator()
#ifdef __cplusplus
}
#endif

#endif

