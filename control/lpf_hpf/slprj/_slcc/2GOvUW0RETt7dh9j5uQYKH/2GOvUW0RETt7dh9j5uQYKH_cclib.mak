#------------------------ Tool Specifications & Options ----------------------

COMPILER  =  lcc

CC        =  "C:\Program Files\MATLAB\R2021b\sys\lcc64\lcc64\bin\lcc64.exe"
LD        =  "C:\Program Files\MATLAB\R2021b\sys\lcc64\lcc64\bin\lcclnk64.exe"
LIBCMD    =  "C:\Program Files\MATLAB\R2021b\sys\lcc64\lcc64\bin\lcclib64.exe"
CFLAGS    =  -dll -noregistrylookup  -c -Zp8 -DLCC_WIN64 -DMATLAB_MEX_FILE -nodeclspec
LDFLAGS   =  -s -dll -entry LibMain 2GOvUW0RETt7dh9j5uQYKH_cclib.def -L"C:\Program Files\MATLAB\R2021b\sys\lcc64\lcc64\lib64"

OBJECTS = \
	   microcontroller.obj \
	   slcc_interface_2GOvUW0RETt7dh9j5uQYKH.obj \
	   customcode_2GOvUW0RETt7dh9j5uQYKH.obj \
	   lccstub.obj \

STATICLIBS = \

#------------------------------ Include/Lib Path ------------------------------

INCLUDE_PATH = \
     -I"c:\program files\matlab\r2021b\extern\include" \
     -I"c:\program files\matlab\r2021b\simulink\include" \
     -I"c:\users\qorgud1209\documents\matlab\dcmotor\mcu_lpf_hpf\slprj\_slcc\2govuw0rett7dh9j5uqykh" \
     -I"c:\users\qorgud1209\documents\matlab\dcmotor\mcu_lpf_hpf\mcu" \
     -I"c:\users\qorgud1209\documents\matlab\dcmotor\mcu_lpf_hpf\mcu\library\software\headers" \
     -I"c:\users\qorgud1209\documents\matlab\dcmotor\mcu_dc_motor\mcu\library\software\headers" \
     -I"c:\users\qorgud1209\documents\matlab\dcmotor\mcu_lpf_hpf" \
     -I"c:\program files\matlab\r2021b\sys\lcc64\lcc64\include64" \
     -I"c:\program files\matlab\r2021b\sys\lcc64\lcc64\mex" \

#--------------------------------- Rules --------------------------------------

2GOvUW0RETt7dh9j5uQYKH_cclib.dll : $(MAKEFILE) $(OBJECTS)
	$(LD) $(LDFLAGS) /OUT:2GOvUW0RETt7dh9j5uQYKH_cclib.dll $(OBJECTS)  $(STATICLIBS) "C:\Program Files\MATLAB\R2021b\extern\lib\win64\microsoft\libmex.lib" "C:\Program Files\MATLAB\R2021b\extern\lib\win64\microsoft\libmx.lib"
microcontroller.obj :	c:\users\QORGUD~1\DOCUME~1\matlab\dcmotor\MCU_LP~1\mcu\MICROC~1.C
	$(CC) $(CFLAGS) $(INCLUDE_PATH) "c:\users\qorgud1209\documents\matlab\dcmotor\mcu_lpf_hpf\mcu\microcontroller.c"
slcc_interface_2GOvUW0RETt7dh9j5uQYKH.obj :	C:\Users\QORGUD~1\DOCUME~1\MATLAB\dcmotor\MCU_LP~1\slprj\_slcc\2GOVUW~1\SLCC_I~1.C
	$(CC) $(CFLAGS) $(INCLUDE_PATH) "C:\Users\qorgud1209\Documents\MATLAB\dcmotor\MCU_LPF_HPF\slprj\_slcc\2GOvUW0RETt7dh9j5uQYKH\slcc_interface_2GOvUW0RETt7dh9j5uQYKH.c"
customcode_2GOvUW0RETt7dh9j5uQYKH.obj :	C:\Users\QORGUD~1\DOCUME~1\MATLAB\dcmotor\MCU_LP~1\slprj\_slcc\2GOVUW~1\CUSTOM~1.C
	$(CC) $(CFLAGS) $(INCLUDE_PATH) "C:\Users\qorgud1209\Documents\MATLAB\dcmotor\MCU_LPF_HPF\slprj\_slcc\2GOvUW0RETt7dh9j5uQYKH\customcode_2GOvUW0RETt7dh9j5uQYKH.c"
lccstub.obj :	C:\PROGRA~1\MATLAB\R2021b\sys\lcc64\lcc64\mex\lccstub.c
	$(CC) $(CFLAGS) $(INCLUDE_PATH) "C:\Program Files\MATLAB\R2021b\sys\lcc64\lcc64\mex\lccstub.c"
