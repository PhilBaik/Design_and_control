# 1 "/var/folders/nb/bbv1g1h14wxc097q5m7tc9f40000gn/T/cxxfe_108249494742917.in"
# 15 "/Applications/MATLAB_R2022a.app/extern/include/mex.h"
#ifndef mex_h
#define mex_h
# 61 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/stdio.h" 3
#ifndef _STDIO_H_
#define _STDIO_H_
# 65 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/_stdio.h" 3
#ifndef __STDIO_H_
#define __STDIO_H_
# 67 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/cdefs.h" 3
#ifndef _CDEFS_H_
#define _CDEFS_H_
# 235
#ifndef __dead
#define __dead

#endif /* __dead */
# 323
#ifndef __abortlike
#define __abortlike __dead2 __cold __not_tail_called
#endif /* __abortlike */
# 408
#ifndef __COPYRIGHT
#define __COPYRIGHT(s) __IDSTRING(copyright,s)
#endif /* __COPYRIGHT */

#ifndef __RCSID
#define __RCSID(s) __IDSTRING(rcsid,s)
#endif /* __RCSID */

#ifndef __SCCSID
#define __SCCSID(s) __IDSTRING(sccsid,s)
#endif /* __SCCSID */

#ifndef __PROJECT_VERSION
#define __PROJECT_VERSION(s) __IDSTRING(project_version,s)
#endif /* __PROJECT_VERSION */


#ifndef __FBSDID
#define __FBSDID(s) 
#endif /* __FBSDID */

#ifndef __DECONST
#define __DECONST(type,var) __CAST_AWAY_QUALIFIER(var, const, type)
#endif /* __DECONST */

#ifndef __DEVOLATILE
#define __DEVOLATILE(type,var) __CAST_AWAY_QUALIFIER(var, volatile, type)
#endif /* __DEVOLATILE */

#ifndef __DEQUALIFY
#define __DEQUALIFY(type,var) __CAST_AWAY_QUALIFIER(var, const volatile, type)
#endif /* __DEQUALIFY */
# 589
#ifndef __DARWIN_NON_CANCELABLE
#define __DARWIN_NON_CANCELABLE 0
#endif /* __DARWIN_NON_CANCELABLE */
# 818
#ifndef __CAST_AWAY_QUALIFIER
#define __CAST_AWAY_QUALIFIER(variable,qualifier,type) (type) (long)(variable)
#endif /* __CAST_AWAY_QUALIFIER */





#ifndef __XNU_PRIVATE_EXTERN
#define __XNU_PRIVATE_EXTERN __attribute__((visibility("hidden")))
#endif /* __XNU_PRIVATE_EXTERN */
# 937
#endif /* _CDEFS_H_ */
# 24 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/Availability.h" 3
#ifndef __AVAILABILITY__
#define __AVAILABILITY__
# 131
#ifndef __API_TO_BE_DEPRECATED
#define __API_TO_BE_DEPRECATED 100000
#endif /* __API_TO_BE_DEPRECATED */
# 24 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/AvailabilityVersions.h" 3
#ifndef __AVAILABILITY_VERSIONS__
#define __AVAILABILITY_VERSIONS__
# 247
#endif /* __AVAILABILITY_VERSIONS__ */
# 30 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/AvailabilityInternal.h" 3
#ifndef __AVAILABILITY_INTERNAL__
#define __AVAILABILITY_INTERNAL__
# 92
#ifndef __MAC_OS_X_VERSION_MAX_ALLOWED
#define __MAC_OS_X_VERSION_MAX_ALLOWED __MAC_12_3
#endif /* __MAC_OS_X_VERSION_MAX_ALLOWED */
# 4426
#ifndef __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION
#define __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION __attribute__((availability(ios,unavailable)))


#endif /* __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION */
# 4453
#ifndef __API_AVAILABLE_PLATFORM_uikitformac
#define __API_AVAILABLE_PLATFORM_uikitformac(x) uikitformac,introduced=x
#endif /* __API_AVAILABLE_PLATFORM_uikitformac */
# 4501
#ifndef __API_DEPRECATED_PLATFORM_uikitformac
#define __API_DEPRECATED_PLATFORM_uikitformac(x) uikitformac,introduced=x,deprecated=y
#endif /* __API_DEPRECATED_PLATFORM_uikitformac */
# 4582
#ifndef __API_UNAVAILABLE_PLATFORM_uikitformac
#define __API_UNAVAILABLE_PLATFORM_uikitformac(x) uikitformac,unavailable
#endif /* __API_UNAVAILABLE_PLATFORM_uikitformac */
# 4671
#ifndef __SPI_AVAILABLE
#define __SPI_AVAILABLE(__VA_ARGS__...) 
#endif /* __SPI_AVAILABLE */

#endif /* __AVAILABILITY_INTERNAL__ */
# 290 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/Availability.h" 3
#ifndef __TVOS_UNAVAILABLE
#define __TVOS_UNAVAILABLE
#endif /* __TVOS_UNAVAILABLE */

#ifndef __TVOS_PROHIBITED
#define __TVOS_PROHIBITED
#endif /* __TVOS_PROHIBITED */

#ifndef __TVOS_AVAILABLE
#define __TVOS_AVAILABLE(_vers) 
#endif /* __TVOS_AVAILABLE */

#ifndef __TVOS_DEPRECATED
#define __TVOS_DEPRECATED(_start,_dep,_msg) 
#endif /* __TVOS_DEPRECATED */
# 317
#ifndef __WATCHOS_UNAVAILABLE
#define __WATCHOS_UNAVAILABLE
#endif /* __WATCHOS_UNAVAILABLE */

#ifndef __WATCHOS_PROHIBITED
#define __WATCHOS_PROHIBITED
#endif /* __WATCHOS_PROHIBITED */

#ifndef __WATCHOS_AVAILABLE
#define __WATCHOS_AVAILABLE(_vers) 
#endif /* __WATCHOS_AVAILABLE */

#ifndef __WATCHOS_DEPRECATED
#define __WATCHOS_DEPRECATED(_start,_dep,_msg) 
#endif /* __WATCHOS_DEPRECATED */
# 342
#ifndef __SWIFT_UNAVAILABLE
#define __SWIFT_UNAVAILABLE
#endif /* __SWIFT_UNAVAILABLE */

#ifndef __SWIFT_UNAVAILABLE_MSG
#define __SWIFT_UNAVAILABLE_MSG(_msg) 
#endif /* __SWIFT_UNAVAILABLE_MSG */
# 474
#ifndef __SPI_DEPRECATED
#define __SPI_DEPRECATED(__VA_ARGS__...) 
#endif /* __SPI_DEPRECATED */

#ifndef __SPI_DEPRECATED_WITH_REPLACEMENT
#define __SPI_DEPRECATED_WITH_REPLACEMENT(__VA_ARGS__...) 
#endif /* __SPI_DEPRECATED_WITH_REPLACEMENT */

#endif /* __AVAILABILITY__ */
# 24 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/_types.h" 3
#ifndef __TYPES_H_
#define __TYPES_H_
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types.h" 3
#ifndef _SYS__TYPES_H_
#define _SYS__TYPES_H_
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/machine/_types.h" 3
#ifndef _BSD_MACHINE__TYPES_H_
#define _BSD_MACHINE__TYPES_H_
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/i386/_types.h" 3
#ifndef _BSD_I386__TYPES_H_
#define _BSD_I386__TYPES_H_
# 39
typedef signed char __int8_t; 



typedef unsigned char __uint8_t; 
typedef short __int16_t; 
typedef unsigned short __uint16_t; 
typedef int __int32_t; 
typedef unsigned __uint32_t; 
typedef long long __int64_t; 
typedef unsigned long long __uint64_t; 

typedef long __darwin_intptr_t; 
typedef unsigned __darwin_natural_t; 
# 72
typedef int __darwin_ct_rune_t; 
# 81
typedef 
# 78
union  { 
char __mbstate8[128]; 
long long _mbstateL; 
} __mbstate_t; 

typedef __mbstate_t __darwin_mbstate_t; 


typedef long __darwin_ptrdiff_t; 
# 94
typedef unsigned long __darwin_size_t; 
# 100
typedef __builtin_va_list __darwin_va_list; 
# 106
typedef int __darwin_wchar_t; 




typedef __darwin_wchar_t __darwin_rune_t; 


typedef unsigned __darwin_wint_t; 




typedef unsigned long __darwin_clock_t; 
typedef __uint32_t __darwin_socklen_t; 
typedef long __darwin_ssize_t; 
typedef long __darwin_time_t; 



#endif /* _BSD_I386__TYPES_H_ */
# 39 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/machine/_types.h" 3
#endif /* _BSD_MACHINE__TYPES_H_ */
# 55 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types.h" 3
typedef __int64_t __darwin_blkcnt_t; 
typedef __int32_t __darwin_blksize_t; 
typedef __int32_t __darwin_dev_t; 
typedef unsigned __darwin_fsblkcnt_t; 
typedef unsigned __darwin_fsfilcnt_t; 
typedef __uint32_t __darwin_gid_t; 
typedef __uint32_t __darwin_id_t; 
typedef __uint64_t __darwin_ino64_t; 

typedef __darwin_ino64_t __darwin_ino_t; 



typedef __darwin_natural_t __darwin_mach_port_name_t; 
typedef __darwin_mach_port_name_t __darwin_mach_port_t; 
typedef __uint16_t __darwin_mode_t; 
typedef __int64_t __darwin_off_t; 
typedef __int32_t __darwin_pid_t; 
typedef __uint32_t __darwin_sigset_t; 
typedef __int32_t __darwin_suseconds_t; 
typedef __uint32_t __darwin_uid_t; 
typedef __uint32_t __darwin_useconds_t; 
typedef unsigned char __darwin_uuid_t[16]; 
typedef char __darwin_uuid_string_t[37]; 
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_pthread/_pthread_types.h" 3
#ifndef _SYS__PTHREAD_TYPES_H_
#define _SYS__PTHREAD_TYPES_H_
# 57
struct __darwin_pthread_handler_rec { 
void (*__routine)(void *); 
void *__arg; 
struct __darwin_pthread_handler_rec *__next; 
}; 

struct _opaque_pthread_attr_t { 
long __sig; 
char __opaque[56]; 
}; 

struct _opaque_pthread_cond_t { 
long __sig; 
char __opaque[40]; 
}; 

struct _opaque_pthread_condattr_t { 
long __sig; 
char __opaque[8]; 
}; 

struct _opaque_pthread_mutex_t { 
long __sig; 
char __opaque[56]; 
}; 

struct _opaque_pthread_mutexattr_t { 
long __sig; 
char __opaque[8]; 
}; 

struct _opaque_pthread_once_t { 
long __sig; 
char __opaque[8]; 
}; 

struct _opaque_pthread_rwlock_t { 
long __sig; 
char __opaque[192]; 
}; 

struct _opaque_pthread_rwlockattr_t { 
long __sig; 
char __opaque[16]; 
}; 

struct _opaque_pthread_t { 
long __sig; 
struct __darwin_pthread_handler_rec *__cleanup_stack; 
char __opaque[8176]; 
}; 

typedef struct _opaque_pthread_attr_t __darwin_pthread_attr_t; 
typedef struct _opaque_pthread_cond_t __darwin_pthread_cond_t; 
typedef struct _opaque_pthread_condattr_t __darwin_pthread_condattr_t; 
typedef unsigned long __darwin_pthread_key_t; 
typedef struct _opaque_pthread_mutex_t __darwin_pthread_mutex_t; 
typedef struct _opaque_pthread_mutexattr_t __darwin_pthread_mutexattr_t; 
typedef struct _opaque_pthread_once_t __darwin_pthread_once_t; 
typedef struct _opaque_pthread_rwlock_t __darwin_pthread_rwlock_t; 
typedef struct _opaque_pthread_rwlockattr_t __darwin_pthread_rwlockattr_t; 
typedef struct _opaque_pthread_t *__darwin_pthread_t; 

#endif /* _SYS__PTHREAD_TYPES_H_ */
# 89 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types.h" 3
#endif /* _SYS__TYPES_H_ */
# 40 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/_types.h" 3
typedef int __darwin_nl_item; 
typedef int __darwin_wctrans_t; 

typedef __uint32_t __darwin_wctype_t; 
# 69
#endif /* __TYPES_H_ */
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_va_list.h" 3
#ifndef _VA_LIST_T
#define _VA_LIST_T
# 31 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/machine/types.h" 3
#ifndef _BSD_MACHINE_TYPES_H_
#define _BSD_MACHINE_TYPES_H_
# 66 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/i386/types.h" 3
#ifndef _I386_MACHTYPES_H_
#define _I386_MACHTYPES_H_
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_int8_t.h" 3
#ifndef _INT8_T
#define _INT8_T
typedef signed char int8_t; 
#endif /* _INT8_T */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_int16_t.h" 3
#ifndef _INT16_T
#define _INT16_T
typedef short int16_t; 
#endif /* _INT16_T */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_int32_t.h" 3
#ifndef _INT32_T
#define _INT32_T
typedef int int32_t; 
#endif /* _INT32_T */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_int64_t.h" 3
#ifndef _INT64_T
#define _INT64_T
typedef long long int64_t; 
#endif /* _INT64_T */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_u_int8_t.h" 3
#ifndef _U_INT8_T
#define _U_INT8_T
typedef unsigned char u_int8_t; 
#endif /* _U_INT8_T */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_u_int16_t.h" 3
#ifndef _U_INT16_T
#define _U_INT16_T
typedef unsigned short u_int16_t; 
#endif /* _U_INT16_T */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_u_int32_t.h" 3
#ifndef _U_INT32_T
#define _U_INT32_T
typedef unsigned u_int32_t; 
#endif /* _U_INT32_T */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_u_int64_t.h" 3
#ifndef _U_INT64_T
#define _U_INT64_T
typedef unsigned long long u_int64_t; 
#endif /* _U_INT64_T */
# 90 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/i386/types.h" 3
typedef int64_t register_t; 
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_intptr_t.h" 3
#ifndef _INTPTR_T
#define _INTPTR_T


typedef __darwin_intptr_t intptr_t; 
#endif /* _INTPTR_T */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_uintptr_t.h" 3
#ifndef _UINTPTR_T
#define _UINTPTR_T




typedef unsigned long uintptr_t; 


#endif /* _UINTPTR_T */
# 100 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/i386/types.h" 3
typedef u_int64_t user_addr_t; 
typedef u_int64_t user_size_t; 
typedef int64_t user_ssize_t; 
typedef int64_t user_long_t; 
typedef u_int64_t user_ulong_t; 
typedef int64_t user_time_t; 
typedef int64_t user_off_t; 
# 114
typedef u_int64_t syscall_arg_t; 



#endif /* _I386_MACHTYPES_H_ */
# 42 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/machine/types.h" 3
#endif /* _BSD_MACHINE_TYPES_H_ */
# 32 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_va_list.h" 3
typedef __darwin_va_list va_list; 
#endif /* _VA_LIST_T */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_size_t.h" 3
#ifndef _SIZE_T
#define _SIZE_T

typedef __darwin_size_t size_t; 
#endif /* _SIZE_T */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_null.h" 3
#ifndef NULL
#define NULL __DARWIN_NULL

#endif /* NULL */
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/stdio.h" 3
#ifndef _SYS_STDIO_H_
#define _SYS_STDIO_H_
# 47
int renameat(int, const char *, int, const char *) __attribute((availability(macosx,introduced=10.10))); 



int renamex_np(const char *, const char *, unsigned); 
int renameatx_np(int, const char *, int, const char *, unsigned); 
# 60
#endif /* _SYS_STDIO_H_ */
# 81 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/_stdio.h" 3
typedef __darwin_off_t fpos_t; 
# 92
struct __sbuf { 
unsigned char *_base; 
int _size; 
}; 


struct __sFILEX; 
# 157
typedef 
# 126
struct __sFILE { 
unsigned char *_p; 
int _r; 
int _w; 
short _flags; 
short _file; 
struct __sbuf _bf; 
int _lbfsize; 


void *_cookie; 
int (*_Nullable _close)(void *); 
int (*_Nullable _read)(void *, char *, int); 
fpos_t (*_Nullable _seek)(void *, fpos_t, int); 
int (*_Nullable _write)(void *, const char *, int); 


struct __sbuf _ub; 
struct __sFILEX *_extra; 
int _ur; 


unsigned char _ubuf[3]; 
unsigned char _nbuf[1]; 


struct __sbuf _lb; 


int _blksize; 
fpos_t _offset; 
} FILE; 

#endif /* __STDIO_H_ */
# 67 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/stdio.h" 3
extern FILE *__stdinp; 
extern FILE *__stdoutp; 
extern FILE *__stderrp; 
# 117
#ifndef SEEK_SET
#define SEEK_SET 0
#endif /* SEEK_SET */
#ifndef SEEK_CUR
#define SEEK_CUR 1
#endif /* SEEK_CUR */
#ifndef SEEK_END
#define SEEK_END 2
#endif /* SEEK_END */
# 142
void clearerr(FILE *); 
int fclose(FILE *); 
int feof(FILE *); 
int ferror(FILE *); 
int fflush(FILE *); 
int fgetc(FILE *); 
int fgetpos(FILE *, fpos_t *); 
char *fgets(char *, int, FILE *); 



FILE *fopen(const char * __filename, const char * __mode) __asm__("_fopen"); 

int fprintf(FILE *, const char *, ...) __attribute((__format__(__printf__, 2, 3))); 
int fputc(int, FILE *); 
int fputs(const char *, FILE *) __asm__("_fputs"); 
size_t fread(void * __ptr, size_t __size, size_t __nitems, FILE * __stream); 
FILE *freopen(const char *, const char *, FILE *) __asm__("_freopen"); 

int fscanf(FILE *, const char *, ...) __attribute((__format__(__scanf__, 2, 3))); 
int fseek(FILE *, long, int); 
int fsetpos(FILE *, const fpos_t *); 
long ftell(FILE *); 
size_t fwrite(const void * __ptr, size_t __size, size_t __nitems, FILE * __stream) __asm__("_fwrite"); 
int getc(FILE *); 
int getchar(void); 
char *gets(char *); 
void perror(const char *) __attribute((__cold__)); 
int printf(const char *, ...) __attribute((__format__(__printf__, 1, 2))); 
int putc(int, FILE *); 
int putchar(int); 
int puts(const char *); 
int remove(const char *); 
int rename(const char * __old, const char * __new); 
void rewind(FILE *); 
int scanf(const char *, ...) __attribute((__format__(__scanf__, 1, 2))); 
void setbuf(FILE *, char *); 
int setvbuf(FILE *, char *, int, size_t); 
int sprintf(char *, const char *, ...) __attribute((__format__(__printf__, 2, 3))); 
int sscanf(const char *, const char *, ...) __attribute((__format__(__scanf__, 2, 3))); 
FILE *tmpfile(void); 



__attribute((__deprecated__("This function is provided for compatibility reasons only.  Due to security concerns inherent in the design of tmpnam(3), it is h" "ighly recommended that you use mkstemp(3) instead."))) char *

tmpnam(char *); 
int ungetc(int, FILE *); 
int vfprintf(FILE *, const char *, va_list) __attribute((__format__(__printf__, 2, 0))); 
int vprintf(const char *, va_list) __attribute((__format__(__printf__, 1, 0))); 
int vsprintf(char *, const char *, va_list) __attribute((__format__(__printf__, 2, 0))); 
# 24 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/_ctermid.h" 3
#ifndef _CTERMID_H_
#define _CTERMID_H_





char *ctermid(char *); 



#endif /* _CTERMID_H_ */
# 210 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/stdio.h" 3
FILE *fdopen(int, const char *) __asm__("_fdopen"); 

int fileno(FILE *); 
# 223
int pclose(FILE *); 



FILE *popen(const char *, const char *) __asm__("_popen"); 
# 242
int __srget(FILE *); 
int __svfscanf(FILE *, const char *, va_list) __attribute((__format__(__scanf__, 2, 0))); 
int __swbuf(int, FILE *); 
# 253
__attribute((__always_inline__)) __inline__ int __sputc(int _c, FILE *_p) { { 
if ((--_p->_w >= 0) || ((_p->_w >= _p->_lbfsize) && ((char)_c != 10))) { 
return (*((_p->_p)++) = _c); } else { 

return __swbuf(_c, _p); }  } 
} 
# 279
void flockfile(FILE *); 
int ftrylockfile(FILE *); 
void funlockfile(FILE *); 
int getc_unlocked(FILE *); 
int getchar_unlocked(void); 
int putc_unlocked(int, FILE *); 
int putchar_unlocked(int); 



int getw(FILE *); 
int putw(int, FILE *); 




__attribute((__deprecated__("This function is provided for compatibility reasons only.  Due to security concerns inherent in the design of tempnam(3), it is " "highly recommended that you use mkstemp(3) instead."))) char *

tempnam(const char * __dir, const char * __prefix) __asm__("_tempnam"); 
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_off_t.h" 3
#ifndef _OFF_T
#define _OFF_T

typedef __darwin_off_t off_t; 
#endif /* _OFF_T */
# 320 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/stdio.h" 3
int fseeko(FILE * __stream, off_t __offset, int __whence); 
off_t ftello(FILE * __stream); 
# 327
int snprintf(char * __str, size_t __size, const char * __format, ...) __attribute((__format__(__printf__, 3, 4))); 
int vfscanf(FILE * __stream, const char * __format, va_list) __attribute((__format__(__scanf__, 2, 0))); 
int vscanf(const char * __format, va_list) __attribute((__format__(__scanf__, 1, 0))); 
int vsnprintf(char * __str, size_t __size, const char * __format, va_list) __attribute((__format__(__printf__, 3, 0))); 
int vsscanf(const char * __str, const char * __format, va_list) __attribute((__format__(__scanf__, 2, 0))); 
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_ssize_t.h" 3
#ifndef _SSIZE_T
#define _SSIZE_T

typedef __darwin_ssize_t ssize_t; 
#endif /* _SSIZE_T */
# 345 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/stdio.h" 3
int dprintf(int, const char *, ...) __attribute((__format__(__printf__, 2, 3))) __attribute((availability(macosx,introduced=10.7))); 
int vdprintf(int, const char *, va_list) __attribute((__format__(__printf__, 2, 0))) __attribute((availability(macosx,introduced=10.7))); 
ssize_t getdelim(char ** __linep, size_t * __linecapp, int __delimiter, FILE * __stream) __attribute((availability(macosx,introduced=10.7))); 
ssize_t getline(char ** __linep, size_t * __linecapp, FILE * __stream) __attribute((availability(macosx,introduced=10.7))); 
FILE *fmemopen(void * __buf, size_t __size, const char * __mode) __attribute((availability(macos,introduced=10.13))) __attribute((availability(ios,introduced=11.0))) __attribute((availability(tvos,introduced=11.0))) __attribute((availability(watchos,introduced=4.0))); 
FILE *open_memstream(char ** __bufp, size_t * __sizep) __attribute((availability(macos,introduced=10.13))) __attribute((availability(ios,introduced=11.0))) __attribute((availability(tvos,introduced=11.0))) __attribute((availability(watchos,introduced=4.0))); 
# 360
extern const int sys_nerr; 
extern const char *const sys_errlist[]; 

int asprintf(char **, const char *, ...) __attribute((__format__(__printf__, 2, 3))); 
char *ctermid_r(char *); 
char *fgetln(FILE *, size_t *); 
const char *fmtcheck(const char *, const char *); 
int fpurge(FILE *); 
void setbuffer(FILE *, char *, int); 
int setlinebuf(FILE *); 
int vasprintf(char **, const char *, va_list) __attribute((__format__(__printf__, 2, 0))); 
# 376
FILE *funopen(const void *, int (*_Nullable)(void *, char *, int), int (*_Nullable)(void *, const char *, int), fpos_t (*_Nullable)(void *, fpos_t, int), int (*_Nullable)(void *)); 
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/secure/_stdio.h" 3
#ifndef _SECURE__STDIO_H_
#define _SECURE__STDIO_H_
# 24 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/secure/_common.h" 3
#ifndef _SECURE__COMMON_H_
#define _SECURE__COMMON_H_
# 41
#endif /* _SECURE__COMMON_H_ */
# 42 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/secure/_stdio.h" 3
extern int __sprintf_chk(char *, int, size_t, const char *, ...); 
# 52
extern int __snprintf_chk(char *, size_t, int, size_t, const char *, ...); 
# 61
extern int __vsprintf_chk(char *, int, size_t, const char *, va_list); 
# 70
extern int __vsnprintf_chk(char *, size_t, int, size_t, const char *, va_list); 
# 86
#endif /* _SECURE__STDIO_H_ */
# 402 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/stdio.h" 3
#endif /* _STDIO_H_ */
# 41 "/Applications/MATLAB_R2022a.app/extern/include/mex.h"
typedef struct impl_info_tag *MEX_impl_info; 
# 19 "/Applications/MATLAB_R2022a.app/extern/include/matrix.h"
#ifndef matrix_h
#define matrix_h
# 58 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/stdlib.h" 3
#ifndef _STDLIB_H_
#define _STDLIB_H_
# 64 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/wait.h" 3
#ifndef _SYS_WAIT_H_
#define _SYS_WAIT_H_
# 83
typedef 
# 79
enum { 
P_ALL, 
P_PID, 
P_PGID
} idtype_t; 
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_pid_t.h" 3
#ifndef _PID_T
#define _PID_T

typedef __darwin_pid_t pid_t; 
#endif /* _PID_T */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_id_t.h" 3
#ifndef _ID_T
#define _ID_T

typedef __darwin_id_t id_t; 
#endif /* _ID_T */
# 69 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/signal.h" 3
#ifndef _SYS_SIGNAL_H_
#define _SYS_SIGNAL_H_
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/appleapiopts.h" 3
#ifndef __SYS_APPLEAPIOPTS_H__
#define __SYS_APPLEAPIOPTS_H__


#ifndef __APPLE_API_STANDARD
#define __APPLE_API_STANDARD
#endif /* __APPLE_API_STANDARD */

#ifndef __APPLE_API_STABLE
#define __APPLE_API_STABLE
#endif /* __APPLE_API_STABLE */



#ifndef __APPLE_API_EVOLVING
#define __APPLE_API_EVOLVING
#endif /* __APPLE_API_EVOLVING */

#ifndef __APPLE_API_UNSTABLE
#define __APPLE_API_UNSTABLE
#endif /* __APPLE_API_UNSTABLE */

#ifndef __APPLE_API_PRIVATE
#define __APPLE_API_PRIVATE
#endif /* __APPLE_API_PRIVATE */

#ifndef __APPLE_API_OBSOLETE
#define __APPLE_API_OBSOLETE
#endif /* __APPLE_API_OBSOLETE */



#endif /* __SYS_APPLEAPIOPTS_H__ */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/machine/signal.h" 3
#ifndef _BSD_MACHINE_SIGNAL_H_
#define _BSD_MACHINE_SIGNAL_H_
# 33 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/i386/signal.h" 3
#ifndef _I386_SIGNAL_H_
#define _I386_SIGNAL_H_ 1
# 41
typedef int sig_atomic_t; 





#endif /* _I386_SIGNAL_H_ */
# 39 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/machine/signal.h" 3
#endif /* _BSD_MACHINE_SIGNAL_H_ */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/machine/_mcontext.h" 3
#ifndef _BSD_MACHINE__MCONTEXT_H_
#define _BSD_MACHINE__MCONTEXT_H_
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/i386/_mcontext.h" 3
#ifndef __I386_MCONTEXT_H_
#define __I386_MCONTEXT_H_
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/mach/machine/_structs.h" 3
#ifndef _MACH_MACHINE__STRUCTS_H_
#define _MACH_MACHINE__STRUCTS_H_
# 32 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/mach/i386/_structs.h" 3
#ifndef _MACH_I386__STRUCTS_H_
#define _MACH_I386__STRUCTS_H_
# 48
struct __darwin_i386_thread_state { 

unsigned __eax; 
unsigned __ebx; 
unsigned __ecx; 
unsigned __edx; 
unsigned __edi; 
unsigned __esi; 
unsigned __ebp; 
unsigned __esp; 
unsigned __ss; 
unsigned __eflags; 
unsigned __eip; 
unsigned __cs; 
unsigned __ds; 
unsigned __es; 
unsigned __fs; 
unsigned __gs; 
}; 
# 94
struct __darwin_fp_control { 

unsigned short __invalid:1, 
__denorm:1, 
__zdiv:1, 
__ovrfl:1, 
__undfl:1, 
__precis:1; 
unsigned short:2, 
__pc:2, 
# 109
__rc:2; 
# 116
unsigned short:1; 
unsigned short:3; 
}; 
typedef struct __darwin_fp_control __darwin_fp_control_t; 
# 152
struct __darwin_fp_status { 

unsigned short __invalid:1, 
__denorm:1, 
__zdiv:1, 
__ovrfl:1, 
__undfl:1, 
__precis:1, 
__stkflt:1, 
__errsumm:1, 
__c0:1, 
__c1:1, 
__c2:1, 
__tos:3, 
__c3:1, 
__busy:1; 
}; 
typedef struct __darwin_fp_status __darwin_fp_status_t; 
# 196
struct __darwin_mmst_reg { 

char __mmst_reg[10]; 
char __mmst_rsrv[6]; 
}; 
# 215
struct __darwin_xmm_reg { 

char __xmm_reg[16]; 
}; 
# 231
struct __darwin_ymm_reg { 

char __ymm_reg[32]; 
}; 
# 247
struct __darwin_zmm_reg { 

char __zmm_reg[64]; 
}; 
# 261
struct __darwin_opmask_reg { 

char __opmask_reg[8]; 
}; 
# 283
struct __darwin_i386_float_state { 

int __fpu_reserved[2]; 
struct __darwin_fp_control __fpu_fcw; 
struct __darwin_fp_status __fpu_fsw; 
__uint8_t __fpu_ftw; 
__uint8_t __fpu_rsrv1; 
__uint16_t __fpu_fop; 
__uint32_t __fpu_ip; 
__uint16_t __fpu_cs; 
__uint16_t __fpu_rsrv2; 
__uint32_t __fpu_dp; 
__uint16_t __fpu_ds; 
__uint16_t __fpu_rsrv3; 
__uint32_t __fpu_mxcsr; 
__uint32_t __fpu_mxcsrmask; 
struct __darwin_mmst_reg __fpu_stmm0; 
struct __darwin_mmst_reg __fpu_stmm1; 
struct __darwin_mmst_reg __fpu_stmm2; 
struct __darwin_mmst_reg __fpu_stmm3; 
struct __darwin_mmst_reg __fpu_stmm4; 
struct __darwin_mmst_reg __fpu_stmm5; 
struct __darwin_mmst_reg __fpu_stmm6; 
struct __darwin_mmst_reg __fpu_stmm7; 
struct __darwin_xmm_reg __fpu_xmm0; 
struct __darwin_xmm_reg __fpu_xmm1; 
struct __darwin_xmm_reg __fpu_xmm2; 
struct __darwin_xmm_reg __fpu_xmm3; 
struct __darwin_xmm_reg __fpu_xmm4; 
struct __darwin_xmm_reg __fpu_xmm5; 
struct __darwin_xmm_reg __fpu_xmm6; 
struct __darwin_xmm_reg __fpu_xmm7; 
char __fpu_rsrv4[14 * 16]; 
int __fpu_reserved1; 
}; 


struct __darwin_i386_avx_state { 

int __fpu_reserved[2]; 
struct __darwin_fp_control __fpu_fcw; 
struct __darwin_fp_status __fpu_fsw; 
__uint8_t __fpu_ftw; 
__uint8_t __fpu_rsrv1; 
__uint16_t __fpu_fop; 
__uint32_t __fpu_ip; 
__uint16_t __fpu_cs; 
__uint16_t __fpu_rsrv2; 
__uint32_t __fpu_dp; 
__uint16_t __fpu_ds; 
__uint16_t __fpu_rsrv3; 
__uint32_t __fpu_mxcsr; 
__uint32_t __fpu_mxcsrmask; 
struct __darwin_mmst_reg __fpu_stmm0; 
struct __darwin_mmst_reg __fpu_stmm1; 
struct __darwin_mmst_reg __fpu_stmm2; 
struct __darwin_mmst_reg __fpu_stmm3; 
struct __darwin_mmst_reg __fpu_stmm4; 
struct __darwin_mmst_reg __fpu_stmm5; 
struct __darwin_mmst_reg __fpu_stmm6; 
struct __darwin_mmst_reg __fpu_stmm7; 
struct __darwin_xmm_reg __fpu_xmm0; 
struct __darwin_xmm_reg __fpu_xmm1; 
struct __darwin_xmm_reg __fpu_xmm2; 
struct __darwin_xmm_reg __fpu_xmm3; 
struct __darwin_xmm_reg __fpu_xmm4; 
struct __darwin_xmm_reg __fpu_xmm5; 
struct __darwin_xmm_reg __fpu_xmm6; 
struct __darwin_xmm_reg __fpu_xmm7; 
char __fpu_rsrv4[14 * 16]; 
int __fpu_reserved1; 
char __avx_reserved1[64]; 
struct __darwin_xmm_reg __fpu_ymmh0; 
struct __darwin_xmm_reg __fpu_ymmh1; 
struct __darwin_xmm_reg __fpu_ymmh2; 
struct __darwin_xmm_reg __fpu_ymmh3; 
struct __darwin_xmm_reg __fpu_ymmh4; 
struct __darwin_xmm_reg __fpu_ymmh5; 
struct __darwin_xmm_reg __fpu_ymmh6; 
struct __darwin_xmm_reg __fpu_ymmh7; 
}; 


struct __darwin_i386_avx512_state { 

int __fpu_reserved[2]; 
struct __darwin_fp_control __fpu_fcw; 
struct __darwin_fp_status __fpu_fsw; 
__uint8_t __fpu_ftw; 
__uint8_t __fpu_rsrv1; 
__uint16_t __fpu_fop; 
__uint32_t __fpu_ip; 
__uint16_t __fpu_cs; 
__uint16_t __fpu_rsrv2; 
__uint32_t __fpu_dp; 
__uint16_t __fpu_ds; 
__uint16_t __fpu_rsrv3; 
__uint32_t __fpu_mxcsr; 
__uint32_t __fpu_mxcsrmask; 
struct __darwin_mmst_reg __fpu_stmm0; 
struct __darwin_mmst_reg __fpu_stmm1; 
struct __darwin_mmst_reg __fpu_stmm2; 
struct __darwin_mmst_reg __fpu_stmm3; 
struct __darwin_mmst_reg __fpu_stmm4; 
struct __darwin_mmst_reg __fpu_stmm5; 
struct __darwin_mmst_reg __fpu_stmm6; 
struct __darwin_mmst_reg __fpu_stmm7; 
struct __darwin_xmm_reg __fpu_xmm0; 
struct __darwin_xmm_reg __fpu_xmm1; 
struct __darwin_xmm_reg __fpu_xmm2; 
struct __darwin_xmm_reg __fpu_xmm3; 
struct __darwin_xmm_reg __fpu_xmm4; 
struct __darwin_xmm_reg __fpu_xmm5; 
struct __darwin_xmm_reg __fpu_xmm6; 
struct __darwin_xmm_reg __fpu_xmm7; 
char __fpu_rsrv4[14 * 16]; 
int __fpu_reserved1; 
char __avx_reserved1[64]; 
struct __darwin_xmm_reg __fpu_ymmh0; 
struct __darwin_xmm_reg __fpu_ymmh1; 
struct __darwin_xmm_reg __fpu_ymmh2; 
struct __darwin_xmm_reg __fpu_ymmh3; 
struct __darwin_xmm_reg __fpu_ymmh4; 
struct __darwin_xmm_reg __fpu_ymmh5; 
struct __darwin_xmm_reg __fpu_ymmh6; 
struct __darwin_xmm_reg __fpu_ymmh7; 
struct __darwin_opmask_reg __fpu_k0; 
struct __darwin_opmask_reg __fpu_k1; 
struct __darwin_opmask_reg __fpu_k2; 
struct __darwin_opmask_reg __fpu_k3; 
struct __darwin_opmask_reg __fpu_k4; 
struct __darwin_opmask_reg __fpu_k5; 
struct __darwin_opmask_reg __fpu_k6; 
struct __darwin_opmask_reg __fpu_k7; 
struct __darwin_ymm_reg __fpu_zmmh0; 
struct __darwin_ymm_reg __fpu_zmmh1; 
struct __darwin_ymm_reg __fpu_zmmh2; 
struct __darwin_ymm_reg __fpu_zmmh3; 
struct __darwin_ymm_reg __fpu_zmmh4; 
struct __darwin_ymm_reg __fpu_zmmh5; 
struct __darwin_ymm_reg __fpu_zmmh6; 
struct __darwin_ymm_reg __fpu_zmmh7; 
}; 
# 577
struct __darwin_i386_exception_state { 

__uint16_t __trapno; 
__uint16_t __cpu; 
__uint32_t __err; 
__uint32_t __faultvaddr; 
}; 
# 597
struct __darwin_x86_debug_state32 { 

unsigned __dr0; 
unsigned __dr1; 
unsigned __dr2; 
unsigned __dr3; 
unsigned __dr4; 
unsigned __dr5; 
unsigned __dr6; 
unsigned __dr7; 
}; 


struct __x86_instruction_state { 

int __insn_stream_valid_bytes; 
int __insn_offset; 
int __out_of_synch; 
# 620
__uint8_t __insn_bytes[(2448 - 64) - 4]; 

__uint8_t __insn_cacheline[64]; 
}; 


struct __last_branch_record { 

__uint64_t __from_ip; 
__uint64_t __to_ip; 
__uint32_t __mispredict:1, 
__tsx_abort:1, 
__in_tsx:1, 
__cycle_count:16, 
__reserved:13; 
}; 


struct __last_branch_state { 

int __lbr_count; 
__uint32_t __lbr_supported_tsx:1, 
__lbr_supported_cycle_count:1, 
__reserved:30; 

struct __last_branch_record __lbrs[32]; 
}; 
# 704
struct __x86_pagein_state { 

int __pagein_error; 
}; 
# 715
struct __darwin_x86_thread_state64 { 

__uint64_t __rax; 
__uint64_t __rbx; 
__uint64_t __rcx; 
__uint64_t __rdx; 
__uint64_t __rdi; 
__uint64_t __rsi; 
__uint64_t __rbp; 
__uint64_t __rsp; 
__uint64_t __r8; 
__uint64_t __r9; 
__uint64_t __r10; 
__uint64_t __r11; 
__uint64_t __r12; 
__uint64_t __r13; 
__uint64_t __r14; 
__uint64_t __r15; 
__uint64_t __rip; 
__uint64_t __rflags; 
__uint64_t __cs; 
__uint64_t __fs; 
__uint64_t __gs; 
}; 
# 773
struct __darwin_x86_thread_full_state64 { 

struct __darwin_x86_thread_state64 __ss64; 
__uint64_t __ds; 
__uint64_t __es; 
__uint64_t __ss; 
__uint64_t __gsbase; 
}; 
# 796
struct __darwin_x86_float_state64 { 

int __fpu_reserved[2]; 
struct __darwin_fp_control __fpu_fcw; 
struct __darwin_fp_status __fpu_fsw; 
__uint8_t __fpu_ftw; 
__uint8_t __fpu_rsrv1; 
__uint16_t __fpu_fop; 


__uint32_t __fpu_ip; 
__uint16_t __fpu_cs; 

__uint16_t __fpu_rsrv2; 


__uint32_t __fpu_dp; 
__uint16_t __fpu_ds; 

__uint16_t __fpu_rsrv3; 
__uint32_t __fpu_mxcsr; 
__uint32_t __fpu_mxcsrmask; 
struct __darwin_mmst_reg __fpu_stmm0; 
struct __darwin_mmst_reg __fpu_stmm1; 
struct __darwin_mmst_reg __fpu_stmm2; 
struct __darwin_mmst_reg __fpu_stmm3; 
struct __darwin_mmst_reg __fpu_stmm4; 
struct __darwin_mmst_reg __fpu_stmm5; 
struct __darwin_mmst_reg __fpu_stmm6; 
struct __darwin_mmst_reg __fpu_stmm7; 
struct __darwin_xmm_reg __fpu_xmm0; 
struct __darwin_xmm_reg __fpu_xmm1; 
struct __darwin_xmm_reg __fpu_xmm2; 
struct __darwin_xmm_reg __fpu_xmm3; 
struct __darwin_xmm_reg __fpu_xmm4; 
struct __darwin_xmm_reg __fpu_xmm5; 
struct __darwin_xmm_reg __fpu_xmm6; 
struct __darwin_xmm_reg __fpu_xmm7; 
struct __darwin_xmm_reg __fpu_xmm8; 
struct __darwin_xmm_reg __fpu_xmm9; 
struct __darwin_xmm_reg __fpu_xmm10; 
struct __darwin_xmm_reg __fpu_xmm11; 
struct __darwin_xmm_reg __fpu_xmm12; 
struct __darwin_xmm_reg __fpu_xmm13; 
struct __darwin_xmm_reg __fpu_xmm14; 
struct __darwin_xmm_reg __fpu_xmm15; 
char __fpu_rsrv4[6 * 16]; 
int __fpu_reserved1; 
}; 


struct __darwin_x86_avx_state64 { 

int __fpu_reserved[2]; 
struct __darwin_fp_control __fpu_fcw; 
struct __darwin_fp_status __fpu_fsw; 
__uint8_t __fpu_ftw; 
__uint8_t __fpu_rsrv1; 
__uint16_t __fpu_fop; 


__uint32_t __fpu_ip; 
__uint16_t __fpu_cs; 

__uint16_t __fpu_rsrv2; 


__uint32_t __fpu_dp; 
__uint16_t __fpu_ds; 

__uint16_t __fpu_rsrv3; 
__uint32_t __fpu_mxcsr; 
__uint32_t __fpu_mxcsrmask; 
struct __darwin_mmst_reg __fpu_stmm0; 
struct __darwin_mmst_reg __fpu_stmm1; 
struct __darwin_mmst_reg __fpu_stmm2; 
struct __darwin_mmst_reg __fpu_stmm3; 
struct __darwin_mmst_reg __fpu_stmm4; 
struct __darwin_mmst_reg __fpu_stmm5; 
struct __darwin_mmst_reg __fpu_stmm6; 
struct __darwin_mmst_reg __fpu_stmm7; 
struct __darwin_xmm_reg __fpu_xmm0; 
struct __darwin_xmm_reg __fpu_xmm1; 
struct __darwin_xmm_reg __fpu_xmm2; 
struct __darwin_xmm_reg __fpu_xmm3; 
struct __darwin_xmm_reg __fpu_xmm4; 
struct __darwin_xmm_reg __fpu_xmm5; 
struct __darwin_xmm_reg __fpu_xmm6; 
struct __darwin_xmm_reg __fpu_xmm7; 
struct __darwin_xmm_reg __fpu_xmm8; 
struct __darwin_xmm_reg __fpu_xmm9; 
struct __darwin_xmm_reg __fpu_xmm10; 
struct __darwin_xmm_reg __fpu_xmm11; 
struct __darwin_xmm_reg __fpu_xmm12; 
struct __darwin_xmm_reg __fpu_xmm13; 
struct __darwin_xmm_reg __fpu_xmm14; 
struct __darwin_xmm_reg __fpu_xmm15; 
char __fpu_rsrv4[6 * 16]; 
int __fpu_reserved1; 
char __avx_reserved1[64]; 
struct __darwin_xmm_reg __fpu_ymmh0; 
struct __darwin_xmm_reg __fpu_ymmh1; 
struct __darwin_xmm_reg __fpu_ymmh2; 
struct __darwin_xmm_reg __fpu_ymmh3; 
struct __darwin_xmm_reg __fpu_ymmh4; 
struct __darwin_xmm_reg __fpu_ymmh5; 
struct __darwin_xmm_reg __fpu_ymmh6; 
struct __darwin_xmm_reg __fpu_ymmh7; 
struct __darwin_xmm_reg __fpu_ymmh8; 
struct __darwin_xmm_reg __fpu_ymmh9; 
struct __darwin_xmm_reg __fpu_ymmh10; 
struct __darwin_xmm_reg __fpu_ymmh11; 
struct __darwin_xmm_reg __fpu_ymmh12; 
struct __darwin_xmm_reg __fpu_ymmh13; 
struct __darwin_xmm_reg __fpu_ymmh14; 
struct __darwin_xmm_reg __fpu_ymmh15; 
}; 


struct __darwin_x86_avx512_state64 { 

int __fpu_reserved[2]; 
struct __darwin_fp_control __fpu_fcw; 
struct __darwin_fp_status __fpu_fsw; 
__uint8_t __fpu_ftw; 
__uint8_t __fpu_rsrv1; 
__uint16_t __fpu_fop; 


__uint32_t __fpu_ip; 
__uint16_t __fpu_cs; 

__uint16_t __fpu_rsrv2; 


__uint32_t __fpu_dp; 
__uint16_t __fpu_ds; 

__uint16_t __fpu_rsrv3; 
__uint32_t __fpu_mxcsr; 
__uint32_t __fpu_mxcsrmask; 
struct __darwin_mmst_reg __fpu_stmm0; 
struct __darwin_mmst_reg __fpu_stmm1; 
struct __darwin_mmst_reg __fpu_stmm2; 
struct __darwin_mmst_reg __fpu_stmm3; 
struct __darwin_mmst_reg __fpu_stmm4; 
struct __darwin_mmst_reg __fpu_stmm5; 
struct __darwin_mmst_reg __fpu_stmm6; 
struct __darwin_mmst_reg __fpu_stmm7; 
struct __darwin_xmm_reg __fpu_xmm0; 
struct __darwin_xmm_reg __fpu_xmm1; 
struct __darwin_xmm_reg __fpu_xmm2; 
struct __darwin_xmm_reg __fpu_xmm3; 
struct __darwin_xmm_reg __fpu_xmm4; 
struct __darwin_xmm_reg __fpu_xmm5; 
struct __darwin_xmm_reg __fpu_xmm6; 
struct __darwin_xmm_reg __fpu_xmm7; 
struct __darwin_xmm_reg __fpu_xmm8; 
struct __darwin_xmm_reg __fpu_xmm9; 
struct __darwin_xmm_reg __fpu_xmm10; 
struct __darwin_xmm_reg __fpu_xmm11; 
struct __darwin_xmm_reg __fpu_xmm12; 
struct __darwin_xmm_reg __fpu_xmm13; 
struct __darwin_xmm_reg __fpu_xmm14; 
struct __darwin_xmm_reg __fpu_xmm15; 
char __fpu_rsrv4[6 * 16]; 
int __fpu_reserved1; 
char __avx_reserved1[64]; 
struct __darwin_xmm_reg __fpu_ymmh0; 
struct __darwin_xmm_reg __fpu_ymmh1; 
struct __darwin_xmm_reg __fpu_ymmh2; 
struct __darwin_xmm_reg __fpu_ymmh3; 
struct __darwin_xmm_reg __fpu_ymmh4; 
struct __darwin_xmm_reg __fpu_ymmh5; 
struct __darwin_xmm_reg __fpu_ymmh6; 
struct __darwin_xmm_reg __fpu_ymmh7; 
struct __darwin_xmm_reg __fpu_ymmh8; 
struct __darwin_xmm_reg __fpu_ymmh9; 
struct __darwin_xmm_reg __fpu_ymmh10; 
struct __darwin_xmm_reg __fpu_ymmh11; 
struct __darwin_xmm_reg __fpu_ymmh12; 
struct __darwin_xmm_reg __fpu_ymmh13; 
struct __darwin_xmm_reg __fpu_ymmh14; 
struct __darwin_xmm_reg __fpu_ymmh15; 
struct __darwin_opmask_reg __fpu_k0; 
struct __darwin_opmask_reg __fpu_k1; 
struct __darwin_opmask_reg __fpu_k2; 
struct __darwin_opmask_reg __fpu_k3; 
struct __darwin_opmask_reg __fpu_k4; 
struct __darwin_opmask_reg __fpu_k5; 
struct __darwin_opmask_reg __fpu_k6; 
struct __darwin_opmask_reg __fpu_k7; 
struct __darwin_ymm_reg __fpu_zmmh0; 
struct __darwin_ymm_reg __fpu_zmmh1; 
struct __darwin_ymm_reg __fpu_zmmh2; 
struct __darwin_ymm_reg __fpu_zmmh3; 
struct __darwin_ymm_reg __fpu_zmmh4; 
struct __darwin_ymm_reg __fpu_zmmh5; 
struct __darwin_ymm_reg __fpu_zmmh6; 
struct __darwin_ymm_reg __fpu_zmmh7; 
struct __darwin_ymm_reg __fpu_zmmh8; 
struct __darwin_ymm_reg __fpu_zmmh9; 
struct __darwin_ymm_reg __fpu_zmmh10; 
struct __darwin_ymm_reg __fpu_zmmh11; 
struct __darwin_ymm_reg __fpu_zmmh12; 
struct __darwin_ymm_reg __fpu_zmmh13; 
struct __darwin_ymm_reg __fpu_zmmh14; 
struct __darwin_ymm_reg __fpu_zmmh15; 
struct __darwin_zmm_reg __fpu_zmm16; 
struct __darwin_zmm_reg __fpu_zmm17; 
struct __darwin_zmm_reg __fpu_zmm18; 
struct __darwin_zmm_reg __fpu_zmm19; 
struct __darwin_zmm_reg __fpu_zmm20; 
struct __darwin_zmm_reg __fpu_zmm21; 
struct __darwin_zmm_reg __fpu_zmm22; 
struct __darwin_zmm_reg __fpu_zmm23; 
struct __darwin_zmm_reg __fpu_zmm24; 
struct __darwin_zmm_reg __fpu_zmm25; 
struct __darwin_zmm_reg __fpu_zmm26; 
struct __darwin_zmm_reg __fpu_zmm27; 
struct __darwin_zmm_reg __fpu_zmm28; 
struct __darwin_zmm_reg __fpu_zmm29; 
struct __darwin_zmm_reg __fpu_zmm30; 
struct __darwin_zmm_reg __fpu_zmm31; 
}; 
# 1254
struct __darwin_x86_exception_state64 { 

__uint16_t __trapno; 
__uint16_t __cpu; 
__uint32_t __err; 
__uint64_t __faultvaddr; 
}; 
# 1274
struct __darwin_x86_debug_state64 { 

__uint64_t __dr0; 
__uint64_t __dr1; 
__uint64_t __dr2; 
__uint64_t __dr3; 
__uint64_t __dr4; 
__uint64_t __dr5; 
__uint64_t __dr6; 
__uint64_t __dr7; 
}; 
# 1302
struct __darwin_x86_cpmu_state64 { 

__uint64_t __ctrs[16]; 
}; 
# 1316
#endif /* _MACH_I386__STRUCTS_H_ */
# 40 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/mach/machine/_structs.h" 3
#endif /* _MACH_MACHINE__STRUCTS_H_ */
# 41 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/i386/_mcontext.h" 3
struct __darwin_mcontext32 { 

struct __darwin_i386_exception_state __es; 
struct __darwin_i386_thread_state __ss; 
struct __darwin_i386_float_state __fs; 
}; 


struct __darwin_mcontext_avx32 { 

struct __darwin_i386_exception_state __es; 
struct __darwin_i386_thread_state __ss; 
struct __darwin_i386_avx_state __fs; 
}; 



struct __darwin_mcontext_avx512_32 { 

struct __darwin_i386_exception_state __es; 
struct __darwin_i386_thread_state __ss; 
struct __darwin_i386_avx512_state __fs; 
}; 
# 99
struct __darwin_mcontext64 { 

struct __darwin_x86_exception_state64 __es; 
struct __darwin_x86_thread_state64 __ss; 
struct __darwin_x86_float_state64 __fs; 
}; 


struct __darwin_mcontext64_full { 

struct __darwin_x86_exception_state64 __es; 
struct __darwin_x86_thread_full_state64 __ss; 
struct __darwin_x86_float_state64 __fs; 
}; 


struct __darwin_mcontext_avx64 { 

struct __darwin_x86_exception_state64 __es; 
struct __darwin_x86_thread_state64 __ss; 
struct __darwin_x86_avx_state64 __fs; 
}; 


struct __darwin_mcontext_avx64_full { 

struct __darwin_x86_exception_state64 __es; 
struct __darwin_x86_thread_full_state64 __ss; 
struct __darwin_x86_avx_state64 __fs; 
}; 



struct __darwin_mcontext_avx512_64 { 

struct __darwin_x86_exception_state64 __es; 
struct __darwin_x86_thread_state64 __ss; 
struct __darwin_x86_avx512_state64 __fs; 
}; 


struct __darwin_mcontext_avx512_64_full { 

struct __darwin_x86_exception_state64 __es; 
struct __darwin_x86_thread_full_state64 __ss; 
struct __darwin_x86_avx512_state64 __fs; 
}; 
# 203
#ifndef _MCONTEXT_T
#define _MCONTEXT_T

typedef struct __darwin_mcontext64 *mcontext_t; 





#endif /* _MCONTEXT_T */



#endif /* __I386_MCONTEXT_H_ */
# 39 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/machine/_mcontext.h" 3
#endif /* _BSD_MACHINE__MCONTEXT_H_ */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_pthread/_pthread_attr_t.h" 3
#ifndef _PTHREAD_ATTR_T
#define _PTHREAD_ATTR_T

typedef __darwin_pthread_attr_t pthread_attr_t; 
#endif /* _PTHREAD_ATTR_T */
# 42 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_sigaltstack.h" 3
struct __darwin_sigaltstack { 

void *ss_sp; 
__darwin_size_t ss_size; 
int ss_flags; 
}; 
typedef struct __darwin_sigaltstack stack_t; 
# 43 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_ucontext.h" 3
struct __darwin_ucontext { 

int uc_onstack; 
__darwin_sigset_t uc_sigmask; 
struct __darwin_sigaltstack uc_stack; 
struct __darwin_ucontext *uc_link; 
__darwin_size_t uc_mcsize; 
struct __darwin_mcontext64 *uc_mcontext; 



}; 


typedef struct __darwin_ucontext ucontext_t; 
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_sigset_t.h" 3
#ifndef _SIGSET_T
#define _SIGSET_T

typedef __darwin_sigset_t sigset_t; 
#endif /* _SIGSET_T */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_uid_t.h" 3
#ifndef _UID_T
#define _UID_T

typedef __darwin_uid_t uid_t; 
#endif /* _UID_T */
# 158 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/signal.h" 3
union sigval { 

int sival_int; 
void *sival_ptr; 
}; 
# 168
struct sigevent { 
int sigev_notify; 
int sigev_signo; 
union sigval sigev_value; 
void (*sigev_notify_function)(union sigval); 
pthread_attr_t *sigev_notify_attributes; 
}; 
# 188
typedef 
# 177
struct __siginfo { 
int si_signo; 
int si_errno; 
int si_code; 
pid_t si_pid; 
uid_t si_uid; 
int si_status; 
void *si_addr; 
union sigval si_value; 
long si_band; 
unsigned long __pad[7]; 
} siginfo_t; 
# 269
union __sigaction_u { 
void (*__sa_handler)(int); 
void (*__sa_sigaction)(int, struct __siginfo *, void *); 

}; 


struct __sigaction { 
union __sigaction_u __sigaction_u; 
void (*sa_tramp)(void *, int, int, siginfo_t *, void *); 
sigset_t sa_mask; 
int sa_flags; 
}; 




struct sigaction { 
union __sigaction_u __sigaction_u; 
sigset_t sa_mask; 
int sa_flags; 
}; 
# 331
typedef void (*sig_t)(int); 
# 348
struct sigvec { 
void (*sv_handler)(int); 
int sv_mask; 
int sv_flags; 
}; 
# 367
struct sigstack { 
char *ss_sp; 
int ss_onstack; 
}; 
# 390
void (*signal(int, void (*)(int)))(int); 

#endif /* _SYS_SIGNAL_H_ */
# 64 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/resource.h" 3
#ifndef _SYS_RESOURCE_H_
#define _SYS_RESOURCE_H_
# 6 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/stdint.h" 3
#ifndef _STDINT_H_
#define _STDINT_H_
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/_types/_uint8_t.h" 3
#ifndef _UINT8_T
#define _UINT8_T
typedef unsigned char uint8_t; 
#endif /* _UINT8_T */
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/_types/_uint16_t.h" 3
#ifndef _UINT16_T
#define _UINT16_T
typedef unsigned short uint16_t; 
#endif /* _UINT16_T */
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/_types/_uint32_t.h" 3
#ifndef _UINT32_T
#define _UINT32_T
typedef unsigned uint32_t; 
#endif /* _UINT32_T */
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/_types/_uint64_t.h" 3
#ifndef _UINT64_T
#define _UINT64_T
typedef unsigned long long uint64_t; 
#endif /* _UINT64_T */
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/stdint.h" 3
typedef int8_t int_least8_t; 
typedef int16_t int_least16_t; 
typedef int32_t int_least32_t; 
typedef int64_t int_least64_t; 
typedef uint8_t uint_least8_t; 
typedef uint16_t uint_least16_t; 
typedef uint32_t uint_least32_t; 
typedef uint64_t uint_least64_t; 



typedef int8_t int_fast8_t; 
typedef int16_t int_fast16_t; 
typedef int32_t int_fast32_t; 
typedef int64_t int_fast64_t; 
typedef uint8_t uint_fast8_t; 
typedef uint16_t uint_fast16_t; 
typedef uint32_t uint_fast32_t; 
typedef uint64_t uint_fast64_t; 
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/_types/_intmax_t.h" 3
#ifndef _INTMAX_T
#define _INTMAX_T

typedef long intmax_t; 
# 40
#endif /* _INTMAX_T */
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/_types/_uintmax_t.h" 3
#ifndef _UINTMAX_T
#define _UINTMAX_T

typedef unsigned long uintmax_t; 
# 40
#endif /* _UINTMAX_T */
# 205 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/stdint.h" 3
#endif /* _STDINT_H_ */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_timeval.h" 3
#ifndef _STRUCT_TIMEVAL
#define _STRUCT_TIMEVAL struct timeval




struct timeval { 

__darwin_time_t tv_sec; 
__darwin_suseconds_t tv_usec; 
}; 
#endif /* _STRUCT_TIMEVAL */
# 89 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/resource.h" 3
typedef __uint64_t rlim_t; 
# 152
struct rusage { 
struct timeval ru_utime; 
struct timeval ru_stime; 
# 163
long ru_maxrss; 

long ru_ixrss; 
long ru_idrss; 
long ru_isrss; 
long ru_minflt; 
long ru_majflt; 
long ru_nswap; 
long ru_inblock; 
long ru_oublock; 
long ru_msgsnd; 
long ru_msgrcv; 
long ru_nsignals; 
long ru_nvcsw; 
long ru_nivcsw; 


}; 
# 199
typedef void *rusage_info_t; 

struct rusage_info_v0 { 
uint8_t ri_uuid[16]; 
uint64_t ri_user_time; 
uint64_t ri_system_time; 
uint64_t ri_pkg_idle_wkups; 
uint64_t ri_interrupt_wkups; 
uint64_t ri_pageins; 
uint64_t ri_wired_size; 
uint64_t ri_resident_size; 
uint64_t ri_phys_footprint; 
uint64_t ri_proc_start_abstime; 
uint64_t ri_proc_exit_abstime; 
}; 

struct rusage_info_v1 { 
uint8_t ri_uuid[16]; 
uint64_t ri_user_time; 
uint64_t ri_system_time; 
uint64_t ri_pkg_idle_wkups; 
uint64_t ri_interrupt_wkups; 
uint64_t ri_pageins; 
uint64_t ri_wired_size; 
uint64_t ri_resident_size; 
uint64_t ri_phys_footprint; 
uint64_t ri_proc_start_abstime; 
uint64_t ri_proc_exit_abstime; 
uint64_t ri_child_user_time; 
uint64_t ri_child_system_time; 
uint64_t ri_child_pkg_idle_wkups; 
uint64_t ri_child_interrupt_wkups; 
uint64_t ri_child_pageins; 
uint64_t ri_child_elapsed_abstime; 
}; 

struct rusage_info_v2 { 
uint8_t ri_uuid[16]; 
uint64_t ri_user_time; 
uint64_t ri_system_time; 
uint64_t ri_pkg_idle_wkups; 
uint64_t ri_interrupt_wkups; 
uint64_t ri_pageins; 
uint64_t ri_wired_size; 
uint64_t ri_resident_size; 
uint64_t ri_phys_footprint; 
uint64_t ri_proc_start_abstime; 
uint64_t ri_proc_exit_abstime; 
uint64_t ri_child_user_time; 
uint64_t ri_child_system_time; 
uint64_t ri_child_pkg_idle_wkups; 
uint64_t ri_child_interrupt_wkups; 
uint64_t ri_child_pageins; 
uint64_t ri_child_elapsed_abstime; 
uint64_t ri_diskio_bytesread; 
uint64_t ri_diskio_byteswritten; 
}; 

struct rusage_info_v3 { 
uint8_t ri_uuid[16]; 
uint64_t ri_user_time; 
uint64_t ri_system_time; 
uint64_t ri_pkg_idle_wkups; 
uint64_t ri_interrupt_wkups; 
uint64_t ri_pageins; 
uint64_t ri_wired_size; 
uint64_t ri_resident_size; 
uint64_t ri_phys_footprint; 
uint64_t ri_proc_start_abstime; 
uint64_t ri_proc_exit_abstime; 
uint64_t ri_child_user_time; 
uint64_t ri_child_system_time; 
uint64_t ri_child_pkg_idle_wkups; 
uint64_t ri_child_interrupt_wkups; 
uint64_t ri_child_pageins; 
uint64_t ri_child_elapsed_abstime; 
uint64_t ri_diskio_bytesread; 
uint64_t ri_diskio_byteswritten; 
uint64_t ri_cpu_time_qos_default; 
uint64_t ri_cpu_time_qos_maintenance; 
uint64_t ri_cpu_time_qos_background; 
uint64_t ri_cpu_time_qos_utility; 
uint64_t ri_cpu_time_qos_legacy; 
uint64_t ri_cpu_time_qos_user_initiated; 
uint64_t ri_cpu_time_qos_user_interactive; 
uint64_t ri_billed_system_time; 
uint64_t ri_serviced_system_time; 
}; 

struct rusage_info_v4 { 
uint8_t ri_uuid[16]; 
uint64_t ri_user_time; 
uint64_t ri_system_time; 
uint64_t ri_pkg_idle_wkups; 
uint64_t ri_interrupt_wkups; 
uint64_t ri_pageins; 
uint64_t ri_wired_size; 
uint64_t ri_resident_size; 
uint64_t ri_phys_footprint; 
uint64_t ri_proc_start_abstime; 
uint64_t ri_proc_exit_abstime; 
uint64_t ri_child_user_time; 
uint64_t ri_child_system_time; 
uint64_t ri_child_pkg_idle_wkups; 
uint64_t ri_child_interrupt_wkups; 
uint64_t ri_child_pageins; 
uint64_t ri_child_elapsed_abstime; 
uint64_t ri_diskio_bytesread; 
uint64_t ri_diskio_byteswritten; 
uint64_t ri_cpu_time_qos_default; 
uint64_t ri_cpu_time_qos_maintenance; 
uint64_t ri_cpu_time_qos_background; 
uint64_t ri_cpu_time_qos_utility; 
uint64_t ri_cpu_time_qos_legacy; 
uint64_t ri_cpu_time_qos_user_initiated; 
uint64_t ri_cpu_time_qos_user_interactive; 
uint64_t ri_billed_system_time; 
uint64_t ri_serviced_system_time; 
uint64_t ri_logical_writes; 
uint64_t ri_lifetime_max_phys_footprint; 
uint64_t ri_instructions; 
uint64_t ri_cycles; 
uint64_t ri_billed_energy; 
uint64_t ri_serviced_energy; 
uint64_t ri_interval_max_phys_footprint; 
uint64_t ri_runnable_time; 
}; 

struct rusage_info_v5 { 
uint8_t ri_uuid[16]; 
uint64_t ri_user_time; 
uint64_t ri_system_time; 
uint64_t ri_pkg_idle_wkups; 
uint64_t ri_interrupt_wkups; 
uint64_t ri_pageins; 
uint64_t ri_wired_size; 
uint64_t ri_resident_size; 
uint64_t ri_phys_footprint; 
uint64_t ri_proc_start_abstime; 
uint64_t ri_proc_exit_abstime; 
uint64_t ri_child_user_time; 
uint64_t ri_child_system_time; 
uint64_t ri_child_pkg_idle_wkups; 
uint64_t ri_child_interrupt_wkups; 
uint64_t ri_child_pageins; 
uint64_t ri_child_elapsed_abstime; 
uint64_t ri_diskio_bytesread; 
uint64_t ri_diskio_byteswritten; 
uint64_t ri_cpu_time_qos_default; 
uint64_t ri_cpu_time_qos_maintenance; 
uint64_t ri_cpu_time_qos_background; 
uint64_t ri_cpu_time_qos_utility; 
uint64_t ri_cpu_time_qos_legacy; 
uint64_t ri_cpu_time_qos_user_initiated; 
uint64_t ri_cpu_time_qos_user_interactive; 
uint64_t ri_billed_system_time; 
uint64_t ri_serviced_system_time; 
uint64_t ri_logical_writes; 
uint64_t ri_lifetime_max_phys_footprint; 
uint64_t ri_instructions; 
uint64_t ri_cycles; 
uint64_t ri_billed_energy; 
uint64_t ri_serviced_energy; 
uint64_t ri_interval_max_phys_footprint; 
uint64_t ri_runnable_time; 
uint64_t ri_flags; 
}; 

typedef struct rusage_info_v5 rusage_info_current; 
# 411
struct rlimit { 
rlim_t rlim_cur; 
rlim_t rlim_max; 
}; 
# 446
struct proc_rlimit_control_wakeupmon { 
uint32_t wm_flags; 
int32_t wm_rate; 
}; 
# 511
int getpriority(int, id_t); 

int getiopolicy_np(int, int) __attribute((availability(macosx,introduced=10.5))); 

int getrlimit(int, struct rlimit *) __asm__("_getrlimit"); 
int getrusage(int, struct rusage *); 
int setpriority(int, id_t, int); 

int setiopolicy_np(int, int, int) __attribute((availability(macosx,introduced=10.5))); 

int setrlimit(int, const struct rlimit *) __asm__("_setrlimit"); 


#endif /* _SYS_RESOURCE_H_ */
# 31 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/machine/endian.h" 3
#ifndef _BSD_MACHINE_ENDIAN_H_
#define _BSD_MACHINE_ENDIAN_H_
# 66 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/i386/endian.h" 3
#ifndef _I386__ENDIAN_H_
#define _I386__ENDIAN_H_
# 90 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_endian.h" 3
#ifndef _SYS__ENDIAN_H_
#define _SYS__ENDIAN_H_
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/libkern/_OSByteOrder.h" 3
#ifndef _OS__OSBYTEORDER_H
#define _OS__OSBYTEORDER_H
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/libkern/i386/_OSByteOrder.h" 3
#ifndef _OS__OSBYTEORDERI386_H
#define _OS__OSBYTEORDERI386_H
# 46
static __inline__ __uint16_t _OSSwapInt16(__uint16_t 
_data) 

{ 
return (__uint16_t)((_data << 8) | (_data >> 8)); 
} 



static __inline__ __uint32_t _OSSwapInt32(__uint32_t 
_data) 

{ 

return __builtin_bswap32(_data); 




} 




static __inline__ __uint64_t _OSSwapInt64(__uint64_t 
_data) 

{ 
return __builtin_bswap64(_data); 
} 
# 104
#endif /* _OS__OSBYTEORDERI386_H */
# 133 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/libkern/_OSByteOrder.h" 3
#endif /* _OS__OSBYTEORDER_H */
# 151 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_endian.h" 3
#endif /* _SYS__ENDIAN_H_ */
# 105 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/i386/endian.h" 3
#endif /* _I386__ENDIAN_H_ */
# 42 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/machine/endian.h" 3
#endif /* _BSD_MACHINE_ENDIAN_H_ */
# 194 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/wait.h" 3
union wait { 
int w_status; 



struct  { 

unsigned w_Termsig:7, 
w_Coredump:1, 
w_Retcode:8, 
w_Filler:16; 
# 212
} w_T; 
# 218
struct  { 

unsigned w_Stopval:8, 
w_Stopsig:8, 
w_Filler:16; 
# 229
} w_S; 
}; 
# 248
pid_t wait(int *) __asm__("_wait"); 
pid_t waitpid(pid_t, int *, int) __asm__("_waitpid"); 

int waitid(idtype_t, id_t, siginfo_t *, int) __asm__("_waitid"); 


pid_t wait3(int *, int, struct rusage *); 
pid_t wait4(pid_t, int *, int, struct rusage *); 


#endif /* _SYS_WAIT_H_ */
# 24 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/alloca.h" 3
#ifndef _ALLOCA_H_
#define _ALLOCA_H_
# 32
void *alloca(size_t); 
# 43
#endif /* _ALLOCA_H_ */
# 29 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_ct_rune_t.h" 3
#ifndef _CT_RUNE_T
#define _CT_RUNE_T

typedef __darwin_ct_rune_t ct_rune_t; 
#endif /* _CT_RUNE_T */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_rune_t.h" 3
#ifndef _RUNE_T
#define _RUNE_T

typedef __darwin_rune_t rune_t; 
#endif /* _RUNE_T */
# 31 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_wchar_t.h" 3
#ifndef _WCHAR_T
#define _WCHAR_T

typedef __darwin_wchar_t wchar_t; 
#endif /* _WCHAR_T */
# 86 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/stdlib.h" 3
typedef 
# 83
struct  { 
int quot; 
int rem; 
} div_t; 




typedef 
# 88
struct  { 
long quot; 
long rem; 
} ldiv_t; 
# 97
typedef 
# 94
struct  { 
long long quot; 
long long rem; 
} lldiv_t; 
# 118
extern int __mb_cur_max; 
# 24 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/malloc/_malloc.h" 3
#ifndef _MALLOC_UNDERSCORE_MALLOC_H_
#define _MALLOC_UNDERSCORE_MALLOC_H_
# 40
void *malloc(size_t __size) __attribute((__warn_unused_result__)) __attribute((alloc_size(1))); 
void *calloc(size_t __count, size_t __size) __attribute((__warn_unused_result__)) __attribute((alloc_size(1, 2))); 
void free(void *); 
void *realloc(void * __ptr, size_t __size) __attribute((__warn_unused_result__)) __attribute((alloc_size(2))); 

void *valloc(size_t) __attribute((alloc_size(1))); 




void *aligned_alloc(size_t __alignment, size_t __size) __attribute((__warn_unused_result__)) __attribute((alloc_size(2))); 

int posix_memalign(void ** __memptr, size_t __alignment, size_t __size) __attribute((availability(macosx,introduced=10.6))); 



#endif /* _MALLOC_UNDERSCORE_MALLOC_H_ */
# 131 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/stdlib.h" 3
void abort(void) __attribute((__cold__)) __attribute((__noreturn__)); 
int abs(int) __attribute((const)); 
int atexit(void (*_Nonnull)(void)); 
double atof(const char *); 
int atoi(const char *); 
long atol(const char *); 


long long atoll(const char *); 

void *bsearch(const void * __key, const void * __base, size_t __nel, size_t __width, int (*_Nonnull __compar)(const void *, const void *)); 


div_t div(int, int) __attribute((const)); 
void exit(int) __attribute((__noreturn__)); 

char *getenv(const char *); 
long labs(long) __attribute((const)); 
ldiv_t ldiv(long, long) __attribute((const)); 


long long llabs(long long); 
lldiv_t lldiv(long long, long long); 


int mblen(const char * __s, size_t __n); 
size_t mbstowcs(wchar_t *, const char *, size_t); 
int mbtowc(wchar_t *, const char *, size_t); 

void qsort(void * __base, size_t __nel, size_t __width, int (*_Nonnull __compar)(const void *, const void *)); 

int rand(void); 

void srand(unsigned); 
double strtod(const char *, char **) __asm__("_strtod"); 
float strtof(const char *, char **) __asm__("_strtof"); 
long strtol(const char * __str, char ** __endptr, int __base); 

long double strtold(const char *, char **); 


long long strtoll(const char * __str, char ** __endptr, int __base); 


unsigned long strtoul(const char * __str, char ** __endptr, int __base); 


unsigned long long strtoull(const char * __str, char ** __endptr, int __base); 



__attribute((availability(macos,introduced=10.0))) int 

system(const char *) __asm__("_system"); 


size_t wcstombs(char *, const wchar_t *, size_t); 
int wctomb(char *, wchar_t); 


void _Exit(int) __attribute((__noreturn__)); 
long a64l(const char *); 
double drand48(void); 
char *ecvt(double, int, int *, int *); 
double erand48(unsigned short [3]); 
char *fcvt(double, int, int *, int *); 
char *gcvt(double, int, char *); 
int getsubopt(char **, char *const *, char **); 
int grantpt(int); 

char *initstate(unsigned, char *, size_t); 



long jrand48(unsigned short [3]); 
char *l64a(long); 
void lcong48(unsigned short [7]); 
long lrand48(void); 
char *mktemp(char *); 
int mkstemp(char *); 
long mrand48(void); 
long nrand48(unsigned short [3]); 
int posix_openpt(int); 
char *ptsname(int); 


int ptsname_r(int fildes, char * buffer, size_t buflen) __attribute((availability(macos,introduced=10.13.4))) __attribute((availability(ios,introduced=11.3))) __attribute((availability(tvos,introduced=11.3))) __attribute((availability(watchos,introduced=4.3))); 


int putenv(char *) __asm__("_putenv"); 
long random(void); 
int rand_r(unsigned *); 

char *realpath(const char *, char *) __asm__("_realpath$DARWIN_EXTSN"); 




unsigned short *seed48(unsigned short [3]); 
int setenv(const char * __name, const char * __value, int __overwrite) __asm__("_setenv"); 

void setkey(const char *) __asm__("_setkey"); 



char *setstate(const char *); 
void srand48(long); 

void srandom(unsigned); 



int unlockpt(int); 

int unsetenv(const char *) __asm__("_unsetenv"); 
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_dev_t.h" 3
#ifndef _DEV_T
#define _DEV_T

typedef __darwin_dev_t dev_t; 
#endif /* _DEV_T */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_mode_t.h" 3
#ifndef _MODE_T
#define _MODE_T

typedef __darwin_mode_t mode_t; 
#endif /* _MODE_T */
# 257 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/stdlib.h" 3
uint32_t arc4random(void); 
void arc4random_addrandom(unsigned char *, int); 




void arc4random_buf(void * __buf, size_t __nbytes) __attribute((availability(macosx,introduced=10.7))); 
void arc4random_stir(void); 

uint32_t arc4random_uniform(uint32_t __upper_bound) __attribute((availability(macosx,introduced=10.7))); 
# 283
char *cgetcap(char *, const char *, int); 
int cgetclose(void); 
int cgetent(char **, char **, const char *); 
int cgetfirst(char **, char **); 
int cgetmatch(const char *, const char *); 
int cgetnext(char **, char **); 
int cgetnum(char *, const char *, long *); 
int cgetset(const char *); 
int cgetstr(char *, const char *, char **); 
int cgetustr(char *, const char *, char **); 

int daemon(int, int) __asm__("_daemon$1050") __attribute((availability(macosx,introduced=10.0,deprecated=10.5))); 
char *devname(dev_t, mode_t); 
char *devname_r(dev_t, mode_t, char * buf, int len); 
char *getbsize(int *, long *); 
int getloadavg(double [], int); 

const char *getprogname(void); 
void setprogname(const char *); 
# 311
int heapsort(void * __base, size_t __nel, size_t __width, int (*_Nonnull __compar)(const void *, const void *)); 
# 318
int mergesort(void * __base, size_t __nel, size_t __width, int (*_Nonnull __compar)(const void *, const void *)); 
# 325
void psort(void * __base, size_t __nel, size_t __width, int (*_Nonnull __compar)(const void *, const void *))

 __attribute((availability(macosx,introduced=10.6))); 
# 333
void psort_r(void * __base, size_t __nel, size_t __width, void *, int (*_Nonnull __compar)(void *, const void *, const void *))

 __attribute((availability(macosx,introduced=10.6))); 
# 341
void qsort_r(void * __base, size_t __nel, size_t __width, void *, int (*_Nonnull __compar)(void *, const void *, const void *)); 

int radixsort(const unsigned char ** __base, int __nel, const unsigned char * __table, unsigned __endbyte); 

int rpmatch(const char *)
 __attribute((availability(macos,introduced=10.15))) __attribute((availability(ios,introduced=13.0))) __attribute((availability(tvos,introduced=13.0))) __attribute((availability(watchos,introduced=6.0))); 
int sradixsort(const unsigned char ** __base, int __nel, const unsigned char * __table, unsigned __endbyte); 

void sranddev(void); 
void srandomdev(void); 
void *reallocf(void * __ptr, size_t __size) __attribute((alloc_size(2))); 

long long strtonum(const char * __numstr, long long __minval, long long __maxval, const char ** __errstrp)
 __attribute((availability(macos,introduced=11.0))) __attribute((availability(ios,introduced=14.0))) __attribute((availability(tvos,introduced=14.0))) __attribute((availability(watchos,introduced=7.0))); 


long long strtoq(const char * __str, char ** __endptr, int __base); 

unsigned long long strtouq(const char * __str, char ** __endptr, int __base); 

extern char *suboptarg; 
# 375
#endif /* _STDLIB_H_ */
# 29 "/Library/Developer/CommandLineTools/usr/lib/clang/13.1.6/include/stddef.h" 3
#ifdef __need_ptrdiff_t
#undef __need_ptrdiff_t
#endif /* __need_ptrdiff_t */



typedef long ptrdiff_t; 




#ifdef __need_size_t
#undef __need_size_t
#endif /* __need_size_t */
# 60
typedef unsigned long rsize_t; 



#ifdef __need_wchar_t
#undef __need_wchar_t
#endif /* __need_wchar_t */
# 10 "/Library/Developer/CommandLineTools/usr/lib/clang/13.1.6/include/__stddef_max_align_t.h" 3
#ifndef __CLANG_MAX_ALIGN_T_DEFINED
#define __CLANG_MAX_ALIGN_T_DEFINED




typedef long double max_align_t; 
# 27
#endif /* __CLANG_MAX_ALIGN_T_DEFINED */
# 12 "/Applications/MATLAB_R2022a.app/extern/include/tmwtypes.h"
#ifndef tmwtypes_h
#define tmwtypes_h

#ifndef __TMWTYPES__
#define __TMWTYPES__
# 9 "/Library/Developer/CommandLineTools/usr/lib/clang/13.1.6/include/limits.h" 3
#ifndef __CLANG_LIMITS_H
#define __CLANG_LIMITS_H
# 60 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/limits.h" 3
#ifndef _LIMITS_H_
#define _LIMITS_H_
# 5 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/machine/limits.h" 3
#ifndef _BSD_MACHINE_LIMITS_H_
#define _BSD_MACHINE_LIMITS_H_
# 36 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/i386/limits.h" 3
#ifndef _I386_LIMITS_H_
#define _I386_LIMITS_H_
# 22 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/i386/_limits.h" 3
#ifndef _I386__LIMITS_H_
#define _I386__LIMITS_H_
# 31
#endif /* _I386__LIMITS_H_ */
# 111 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/i386/limits.h" 3
#endif /* _I386_LIMITS_H_ */
# 16 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/machine/limits.h" 3
#endif /* _BSD_MACHINE_LIMITS_H_ */
# 65 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/syslimits.h" 3
#ifndef _SYS_SYSLIMITS_H_
#define _SYS_SYSLIMITS_H_
# 125
#endif /* _SYS_SYSLIMITS_H_ */
# 167 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/limits.h" 3
#endif /* _LIMITS_H_ */
# 102 "/Library/Developer/CommandLineTools/usr/lib/clang/13.1.6/include/limits.h" 3
#endif /* __CLANG_LIMITS_H */
# 10 "/Library/Developer/CommandLineTools/usr/lib/clang/13.1.6/include/stdbool.h" 3
#ifndef __STDBOOL_H
#define __STDBOOL_H
# 31
#endif /* __STDBOOL_H */
# 10 "/Library/Developer/CommandLineTools/usr/lib/clang/13.1.6/include/float.h" 3
#ifndef __CLANG_FLOAT_H
#define __CLANG_FLOAT_H
# 22 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/float.h" 3
#ifndef __FLOAT_H
#define __FLOAT_H
# 140
#endif /* __FLOAT_H */
# 152 "/Library/Developer/CommandLineTools/usr/lib/clang/13.1.6/include/float.h" 3
#endif /* __CLANG_FLOAT_H */
# 89 "/Applications/MATLAB_R2022a.app/extern/include/tmwtypes.h"
typedef unsigned char uchar_T; 
typedef unsigned short ushort_T; 
typedef unsigned long ulong_T; 
# 97
typedef unsigned long long ulonglong_T; 
# 222
typedef signed char int8_T; 
# 239
typedef unsigned char uint8_T; 
# 257
typedef short int16_T; 
# 275
typedef unsigned short uint16_T; 
# 293
typedef int int32_T; 
# 311
typedef unsigned uint32_T; 
# 372
typedef float real32_T; 
# 386
typedef double real64_T; 
# 409
#ifndef INT64_T
#define INT64_T long long
#endif /* INT64_T */
#ifndef UINT64_T
#define UINT64_T unsigned long long
#endif /* UINT64_T */
#ifndef FMT64
#define FMT64 "ll"
#endif /* FMT64 */
# 465
__extension__ typedef long long int64_T; 
# 479
__extension__ typedef unsigned long long uint64_T; 
# 535
typedef real64_T real_T; 
# 544
typedef real_T time_T; 
# 556
typedef unsigned char boolean_T; 


#ifndef CHARACTER_T
#define CHARACTER_T char
#endif /* CHARACTER_T */
typedef char char_T; 


#ifndef INTEGER_T
#define INTEGER_T int
#endif /* INTEGER_T */
typedef int int_T; 


#ifndef UINTEGER_T
#define UINTEGER_T unsigned
#endif /* UINTEGER_T */
typedef unsigned uint_T; 


#ifndef BYTE_T
#define BYTE_T unsigned char
#endif /* BYTE_T */
typedef unsigned char byte_T; 
# 592
typedef 
# 590
struct  { 
real32_T re, im; 
} creal32_T; 
# 601
typedef 
# 599
struct  { 
real64_T re, im; 
} creal64_T; 
# 610
typedef 
# 608
struct  { 
real_T re, im; 
} creal_T; 
# 621
typedef 
# 619
struct  { 
int8_T re, im; 
} cint8_T; 
# 630
typedef 
# 628
struct  { 
uint8_T re, im; 
} cuint8_T; 
# 639
typedef 
# 637
struct  { 
int16_T re, im; 
} cint16_T; 
# 648
typedef 
# 646
struct  { 
uint16_T re, im; 
} cuint16_T; 
# 657
typedef 
# 655
struct  { 
int32_T re, im; 
} cint32_T; 
# 666
typedef 
# 664
struct  { 
uint32_T re, im; 
} cuint32_T; 
# 675
typedef 
# 673
struct  { 
int64_T re, im; 
} cint64_T; 
# 684
typedef 
# 682
struct  { 
uint64_T re, im; 
} cuint64_T; 
# 834
typedef size_t mwSize; 
typedef size_t mwIndex; 
typedef ptrdiff_t mwSignedIndex; 





#ifndef SLSIZE_SLINDEX
#define SLSIZE_SLINDEX

typedef int64_T SLIndex; 
typedef int64_T SLSize; 




#endif /* SLSIZE_SLINDEX */
# 883
typedef unsigned short CHAR16_T; 


#endif /* __TMWTYPES__ */

#endif /* tmwtypes_h */
# 160 "/Applications/MATLAB_R2022a.app/extern/include/matrix.h"
typedef struct mxArray_tag mxArray; 




typedef void (*mxFunctionPtr)(int nlhs, mxArray * plhs[], int nrhs, mxArray * prhs[]); 
# 175
typedef _Bool mxLogical; 




typedef CHAR16_T mxChar; 
# 210
typedef 
# 185
enum { 
mxUNKNOWN_CLASS, 
mxCELL_CLASS, 
mxSTRUCT_CLASS, 
mxLOGICAL_CLASS, 
mxCHAR_CLASS, 
mxVOID_CLASS, 
mxDOUBLE_CLASS, 
mxSINGLE_CLASS, 
mxINT8_CLASS, 
mxUINT8_CLASS, 
mxINT16_CLASS, 
mxUINT16_CLASS, 
mxINT32_CLASS, 
mxUINT32_CLASS, 
mxINT64_CLASS, 
mxUINT64_CLASS, 
mxFUNCTION_CLASS, 
mxOPAQUE_CLASS, 
mxOBJECT_CLASS, 

mxINDEX_CLASS = mxUINT64_CLASS



} mxClassID; 




typedef enum { mxREAL, mxCOMPLEX} mxComplexity; 




typedef double mxDouble; 
typedef float mxSingle; 
typedef int8_T mxInt8; 
typedef uint8_T mxUint8; 
typedef int16_T mxInt16; 
typedef uint16_T mxUint16; 
typedef int32_T mxInt32; 
typedef uint32_T mxUint32; 
typedef int64_T mxInt64; 
typedef uint64_T mxUint64; 
# 235
typedef struct  { mxDouble real, imag; } mxComplexDouble; 
typedef struct  { mxSingle real, imag; } mxComplexSingle; 
typedef struct  { mxInt8 real, imag; } mxComplexInt8; 
typedef struct  { mxUint8 real, imag; } mxComplexUint8; 
typedef struct  { mxInt16 real, imag; } mxComplexInt16; 
typedef struct  { mxUint16 real, imag; } mxComplexUint16; 
typedef struct  { mxInt32 real, imag; } mxComplexInt32; 
typedef struct  { mxUint32 real, imag; } mxComplexUint32; 
typedef struct  { mxInt64 real, imag; } mxComplexInt64; 
typedef struct  { mxUint64 real, imag; } mxComplexUint64; 
# 516
extern void *mxMalloc_800(size_t n); 
# 522
extern void *mxCalloc_800(size_t n, size_t size); 
# 529
extern void mxFree_800(void * ptr); 




extern void *mxRealloc_800(void * ptr, size_t size); 




extern mwSize mxGetNumberOfDimensions_800(const mxArray * pa); 




extern const mwSize *mxGetDimensions_800(const mxArray * pa); 




extern size_t mxGetM_800(const mxArray * pa); 




extern mwIndex *mxGetIr_800(const mxArray * pa); 




extern mwIndex *mxGetJc_800(const mxArray * pa); 




extern mwSize mxGetNzmax_800(const mxArray * pa); 




extern void mxSetNzmax_800(mxArray * pa, mwSize nzmax); 




extern const char *mxGetFieldNameByNumber_800(const mxArray * pa, int n); 
# 582
extern mxArray *mxGetFieldByNumber_800(const mxArray * pa, mwIndex i, int fieldnum); 




extern mxArray *mxGetCell_800(const mxArray * pa, mwIndex i); 




extern mxClassID mxGetClassID_800(const mxArray * pa); 




extern void *mxGetData_800(const mxArray * pa); 
# 603
extern void mxSetData_800(mxArray * pa, void * newdata); 
# 611
extern _Bool mxIsNumeric_800(const mxArray * pa); 




extern _Bool mxIsCell_800(const mxArray * pa); 




extern _Bool mxIsLogical_800(const mxArray * pa); 




extern _Bool mxIsScalar_800(const mxArray * pa); 




extern _Bool mxIsChar_800(const mxArray * pa); 




extern _Bool mxIsStruct_800(const mxArray * pa); 




extern _Bool mxIsOpaque_800(const mxArray * pa); 




extern _Bool mxIsFunctionHandle_800(const mxArray * pa); 
# 653
extern _Bool mxIsObject_800(const mxArray * pa); 
# 674
extern _Bool mxIsComplex_800(const mxArray * pa); 




extern _Bool mxIsSparse_800(const mxArray * pa); 
# 685
extern _Bool mxIsDouble_800(const mxArray * pa); 
# 691
extern _Bool mxIsSingle_800(const mxArray * pa); 
# 697
extern _Bool mxIsInt8_800(const mxArray * pa); 
# 703
extern _Bool mxIsUint8_800(const mxArray * pa); 
# 709
extern _Bool mxIsInt16_800(const mxArray * pa); 
# 715
extern _Bool mxIsUint16_800(const mxArray * pa); 
# 721
extern _Bool mxIsInt32_800(const mxArray * pa); 
# 727
extern _Bool mxIsUint32_800(const mxArray * pa); 
# 733
extern _Bool mxIsInt64_800(const mxArray * pa); 
# 739
extern _Bool mxIsUint64_800(const mxArray * pa); 




extern size_t mxGetNumberOfElements_800(const mxArray * pa); 
# 766
extern mxChar *mxGetChars_800(const mxArray * pa); 
# 774
extern int mxGetUserBits_800(const mxArray * pa); 
# 782
extern void mxSetUserBits_800(mxArray * pa, int value); 
# 788
extern double mxGetScalar_800(const mxArray * pa); 
# 801
extern _Bool mxIsFromGlobalWS_800(const mxArray * pa); 




extern void mxSetFromGlobalWS_800(mxArray * pa, _Bool global); 




extern void mxSetM_800(mxArray * pa, mwSize m); 




extern size_t mxGetN_800(const mxArray * pa); 




extern _Bool mxIsEmpty_800(const mxArray * pa); 




extern int mxGetFieldNumber_800(const mxArray * pa, const char * name); 




extern void mxSetIr_800(mxArray * pa, mwIndex * newir); 




extern void mxSetJc_800(mxArray * pa, mwIndex * newjc); 

extern double *mxGetPr_800(const mxArray * pa); 
extern void mxSetPr_800(mxArray * pa, double * newdata); 
extern size_t mxGetElementSize_800(const mxArray * pa); 
# 846
extern mwIndex mxCalcSingleSubscript_800(const mxArray * pa, mwSize nsubs, const mwIndex * subs); 
# 854
extern int mxGetNumberOfFields_800(const mxArray * pa); 
# 860
extern void mxSetCell_800(mxArray * pa, mwIndex i, mxArray * value); 
# 866
extern void mxSetFieldByNumber_800(mxArray * pa, mwIndex i, int fieldnum, mxArray * value); 
# 874
extern mxArray *mxGetField_800(const mxArray * pa, mwIndex i, const char * fieldname); 
# 881
extern void mxSetField_800(mxArray * pa, mwIndex i, const char * fieldname, mxArray * value); 
# 891
extern mxArray *mxGetProperty_800(const mxArray * pa, const mwIndex i, const char * propname); 
# 899
extern void mxSetProperty_800(mxArray * pa, mwIndex i, const char * propname, const mxArray * value); 




extern const char *mxGetClassName_800(const mxArray * pa); 




extern _Bool mxIsClass_800(const mxArray * pa, const char * name); 
# 916
extern mxArray *mxCreateNumericMatrix_800(mwSize m, mwSize n, mxClassID classid, mxComplexity flag); 
# 923
extern mxArray *mxCreateUninitNumericMatrix_800(size_t m, size_t n, mxClassID classid, mxComplexity flag); 
# 930
extern mxArray *mxCreateUninitNumericArray_800(size_t ndim, size_t * dims, mxClassID classid, mxComplexity flag); 




extern void mxSetN_800(mxArray * pa, mwSize n); 
# 942
extern int mxSetDimensions_800(mxArray * pa, const mwSize * pdims, mwSize ndims); 




extern void mxDestroyArray_800(mxArray * pa); 
# 956
extern mxArray *mxCreateNumericArray_800(mwSize ndim, const mwSize * dims, mxClassID classid, mxComplexity flag); 
# 962
extern mxArray *mxCreateCharArray_800(mwSize ndim, const mwSize * dims); 
# 969
extern mxArray *mxCreateDoubleMatrix_800(mwSize m, mwSize n, mxComplexity flag); 




extern mxLogical *mxGetLogicals_800(const mxArray * pa); 




extern mxArray *mxCreateLogicalArray_800(mwSize ndim, const mwSize * dims); 
# 985
extern mxArray *mxCreateLogicalMatrix_800(mwSize m, mwSize n); 




extern mxArray *mxCreateLogicalScalar_800(_Bool value); 




extern _Bool mxIsLogicalScalar_800(const mxArray * pa); 




extern _Bool mxIsLogicalScalarTrue_800(const mxArray * pa); 
# 1006
extern mxArray *mxCreateDoubleScalar_800(double value); 
# 1027
extern mxArray *mxCreateSparse_800(mwSize m, mwSize n, mwSize nzmax, mxComplexity flag); 
# 1033
extern mxArray *mxCreateSparseLogicalMatrix_800(mwSize m, mwSize n, mwSize nzmax); 
# 1041
extern void mxGetNChars_800(const mxArray * pa, char * buf, mwSize nChars); 
# 1052
extern int mxGetString_800(const mxArray * pa, char * buf, mwSize buflen); 
# 1059
extern char *mxArrayToString_800(const mxArray * pa); 
# 1067
extern char *mxArrayToUTF8String_800(const mxArray * pa); 
# 1074
extern mxArray *mxCreateStringFromNChars_800(const char * str, mwSize n); 
# 1081
extern mxArray *mxCreateString_800(const char * str); 




extern mxArray *mxCreateCharMatrixFromStrings_800(mwSize m, const char ** str); 
# 1092
extern mxArray *mxCreateCellMatrix_800(mwSize m, mwSize n); 
# 1098
extern mxArray *mxCreateCellArray_800(mwSize ndim, const mwSize * dims); 
# 1105
extern mxArray *mxCreateStructMatrix_800(mwSize m, mwSize n, int nfields, const char ** fieldnames); 
# 1112
extern mxArray *mxCreateStructArray_800(mwSize ndim, const mwSize * dims, int nfields, const char ** fieldnames); 




extern mxArray *mxDuplicateArray_800(const mxArray * in); 
# 1124
extern int mxSetClassName_800(mxArray * pa, const char * classname); 
# 1130
extern int mxAddField_800(mxArray * pa, const char * fieldname); 
# 1136
extern void mxRemoveField_800(mxArray * pa, int field); 




extern double mxGetEps_800(void); 




extern double mxGetInf_800(void); 




extern double mxGetNaN_800(void); 




extern _Bool mxIsFinite_800(double x); 
# 1162
extern _Bool mxIsInf_800(double x); 




extern _Bool mxIsNaN_800(double x); 
# 1194
extern mxDouble *mxGetDoubles_800(const mxArray *); extern int mxSetDoubles_800(mxArray *, mxDouble *); extern mxComplexDouble *mxGetComplexDoubles_800(const mxArray *); extern int mxSetComplexDoubles_800(mxArray *, mxComplexDouble *); 
extern mxSingle *mxGetSingles_800(const mxArray *); extern int mxSetSingles_800(mxArray *, mxSingle *); extern mxComplexSingle *mxGetComplexSingles_800(const mxArray *); extern int mxSetComplexSingles_800(mxArray *, mxComplexSingle *); 
extern mxInt8 *mxGetInt8s_800(const mxArray *); extern int mxSetInt8s_800(mxArray *, mxInt8 *); extern mxComplexInt8 *mxGetComplexInt8s_800(const mxArray *); extern int mxSetComplexInt8s_800(mxArray *, mxComplexInt8 *); 
extern mxUint8 *mxGetUint8s_800(const mxArray *); extern int mxSetUint8s_800(mxArray *, mxUint8 *); extern mxComplexUint8 *mxGetComplexUint8s_800(const mxArray *); extern int mxSetComplexUint8s_800(mxArray *, mxComplexUint8 *); 
extern mxInt16 *mxGetInt16s_800(const mxArray *); extern int mxSetInt16s_800(mxArray *, mxInt16 *); extern mxComplexInt16 *mxGetComplexInt16s_800(const mxArray *); extern int mxSetComplexInt16s_800(mxArray *, mxComplexInt16 *); 
extern mxUint16 *mxGetUint16s_800(const mxArray *); extern int mxSetUint16s_800(mxArray *, mxUint16 *); extern mxComplexUint16 *mxGetComplexUint16s_800(const mxArray *); extern int mxSetComplexUint16s_800(mxArray *, mxComplexUint16 *); 
extern mxInt32 *mxGetInt32s_800(const mxArray *); extern int mxSetInt32s_800(mxArray *, mxInt32 *); extern mxComplexInt32 *mxGetComplexInt32s_800(const mxArray *); extern int mxSetComplexInt32s_800(mxArray *, mxComplexInt32 *); 
extern mxUint32 *mxGetUint32s_800(const mxArray *); extern int mxSetUint32s_800(mxArray *, mxUint32 *); extern mxComplexUint32 *mxGetComplexUint32s_800(const mxArray *); extern int mxSetComplexUint32s_800(mxArray *, mxComplexUint32 *); 
extern mxInt64 *mxGetInt64s_800(const mxArray *); extern int mxSetInt64s_800(mxArray *, mxInt64 *); extern mxComplexInt64 *mxGetComplexInt64s_800(const mxArray *); extern int mxSetComplexInt64s_800(mxArray *, mxComplexInt64 *); 
extern mxUint64 *mxGetUint64s_800(const mxArray *); extern int mxSetUint64s_800(mxArray *, mxUint64 *); extern mxComplexUint64 *mxGetComplexUint64s_800(const mxArray *); extern int mxSetComplexUint64s_800(mxArray *, mxComplexUint64 *); 

extern int mxMakeArrayReal_800(mxArray *); 
extern int mxMakeArrayComplex_800(mxArray *); 
# 1301
#endif /* matrix_h */
# 49 "/Applications/MATLAB_R2022a.app/extern/include/mex.h"
typedef void (*mex_exit_fn)(void); 
# 58
typedef 
# 54
struct mexGlobalTableEntry_Tag { 

const char *name; 
mxArray **variable; 
} mexGlobalTableEntry, *mexGlobalTable; 
# 73
typedef 
# 67
struct mexFunctionTableEntry_tag { 
const char *name; 
mxFunctionPtr f; 
int nargin; 
int nargout; 
struct _mexLocalFunctionTable *local_function_table; 
} mexFunctionTableEntry, *mexFunctionTable; 




typedef 
# 75
struct _mexLocalFunctionTable { 
size_t length; 
mexFunctionTable entries; 
} _mexLocalFunctionTable, *mexLocalFunctionTable; 




typedef 
# 80
struct  { 
void (*initialize)(void); 
void (*terminate)(void); 
} _mexInitTermTableEntry, *mexInitTermTableEntry; 



typedef void (*fn_clean_up_after_error)(void); 
typedef const char *(*fn_simple_function_to_string)(mxFunctionPtr f); 

typedef mexLocalFunctionTable (*fn_mex_get_local_function_table)(void); 
typedef mexLocalFunctionTable (*fn_mex_set_local_function_table)(mexLocalFunctionTable); 
# 150
extern void mexErrMsgTxt_800(const char * error_msg); 
# 159
extern void mexErrMsgIdAndTxt_800(const char * identifier, const char * err_msg, ...); 
# 170
extern void mexWarnMsgTxt_800(const char * warn_msg); 
# 181
extern void mexWarnMsgIdAndTxt_800(const char * identifier, const char * warn_msg, ...); 
# 191
extern int mexPrintf_800(const char * fmt, ...); 
# 206
extern void mexMakeArrayPersistent_800(mxArray * pa); 
# 216
extern void mexMakeMemoryPersistent_800(void * ptr); 
# 222
extern int mexCallMATLAB_800(int nlhs, mxArray * plhs[], int nrhs, mxArray * prhs[], const char * fcn_name); 
# 234
extern mxArray *mexCallMATLABWithTrap_800(int nlhs, mxArray * plhs[], int nrhs, mxArray * prhs[], const char * fcn_name); 
# 247
extern void mexPrintAssertion_800(const char * test, const char * fname, int linenum, const char * message); 
# 257
extern _Bool mexIsGlobal_800(const mxArray * pA); 
# 264
extern int mexPutVariable_800(const char * workspace, const char * name, const mxArray * parray); 
# 275
extern const mxArray *mexGetVariablePtr_800(const char * workspace, const char * name); 
# 285
extern mxArray *mexGetVariable_800(const char * workspace, const char * name); 
# 294
extern void mexLock_800(void); 
# 300
extern void mexUnlock_800(void); 
# 306
extern _Bool mexIsLocked_800(void); 
# 312
extern const char *mexFunctionName_800(void); 
# 319
extern int mexEvalString_800(const char * str); 
# 328
extern mxArray *mexEvalStringWithTrap_800(const char * str); 
# 336
extern int mexAtExit_800(mex_exit_fn exit_fcn); 
# 356
extern void mexFunction(int nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[]); 
# 363
#endif /* mex_h */
# 58 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/string.h" 3
#ifndef _STRING_H_
#define _STRING_H_
# 70
void *memchr(const void * __s, int __c, size_t __n); 
int memcmp(const void * __s1, const void * __s2, size_t __n); 
void *memcpy(void * __dst, const void * __src, size_t __n); 
void *memmove(void * __dst, const void * __src, size_t __len); 
void *memset(void * __b, int __c, size_t __len); 
char *strcat(char * __s1, const char * __s2); 
char *strchr(const char * __s, int __c); 
int strcmp(const char * __s1, const char * __s2); 
int strcoll(const char * __s1, const char * __s2); 
char *strcpy(char * __dst, const char * __src); 
size_t strcspn(const char * __s, const char * __charset); 
char *strerror(int __errnum) __asm__("_strerror"); 
size_t strlen(const char * __s); 
char *strncat(char * __s1, const char * __s2, size_t __n); 
int strncmp(const char * __s1, const char * __s2, size_t __n); 
char *strncpy(char * __dst, const char * __src, size_t __n); 
char *strpbrk(const char * __s, const char * __charset); 
char *strrchr(const char * __s, int __c); 
size_t strspn(const char * __s, const char * __charset); 
char *strstr(const char * __big, const char * __little); 
char *strtok(char * __str, const char * __sep); 
size_t strxfrm(char * __s1, const char * __s2, size_t __n); 
# 104
char *strtok_r(char * __str, const char * __sep, char ** __lasts); 
# 116
int strerror_r(int __errnum, char * __strerrbuf, size_t __buflen); 
char *strdup(const char * __s1); 
void *memccpy(void * __dst, const void * __src, int __c, size_t __n); 
# 130
char *stpcpy(char * __dst, const char * __src); 
char *stpncpy(char * __dst, const char * __src, size_t __n) __attribute((availability(macosx,introduced=10.7))); 
char *strndup(const char * __s1, size_t __n) __attribute((availability(macosx,introduced=10.7))); 
size_t strnlen(const char * __s1, size_t __n) __attribute((availability(macosx,introduced=10.7))); 
char *strsignal(int __sig); 
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/_types/_errno_t.h" 3
#ifndef _ERRNO_T
#define _ERRNO_T
typedef int errno_t; 
#endif /* _ERRNO_T */
# 145 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/string.h" 3
errno_t memset_s(void * __s, rsize_t __smax, int __c, rsize_t __n) __attribute((availability(macosx,introduced=10.9))); 
# 155
void *memmem(const void * __big, size_t __big_len, const void * __little, size_t __little_len) __attribute((availability(macosx,introduced=10.7))); 
void memset_pattern4(void * __b, const void * __pattern4, size_t __len) __attribute((availability(macosx,introduced=10.5))); 
void memset_pattern8(void * __b, const void * __pattern8, size_t __len) __attribute((availability(macosx,introduced=10.5))); 
void memset_pattern16(void * __b, const void * __pattern16, size_t __len) __attribute((availability(macosx,introduced=10.5))); 

char *strcasestr(const char * __big, const char * __little); 
char *strnstr(const char * __big, const char * __little, size_t __len); 
size_t strlcat(char * __dst, const char * __source, size_t __size); 
size_t strlcpy(char * __dst, const char * __source, size_t __size); 
void strmode(int __mode, char * __bp); 
char *strsep(char ** __stringp, const char * __delim); 


void swab(const void *, void *, ssize_t); 



int timingsafe_bcmp(const void * __b1, const void * __b2, size_t __len); 



int strsignal_r(int __sig, char * __strsignalbuf, size_t __buflen); 
# 58 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/strings.h" 3
#ifndef _STRINGS_H_
#define _STRINGS_H_
# 70
int bcmp(const void *, const void *, size_t); 
void bcopy(const void *, void *, size_t); 
void bzero(void *, size_t); 
char *index(const char *, int); 
char *rindex(const char *, int); 


int ffs(int); 
int strcasecmp(const char *, const char *); 
int strncasecmp(const char *, const char *, size_t); 
# 85
int ffsl(long) __attribute((availability(macosx,introduced=10.5))); 
int ffsll(long long) __attribute((availability(macosx,introduced=10.9))); 
int fls(int) __attribute((availability(macosx,introduced=10.5))); 
int flsl(long) __attribute((availability(macosx,introduced=10.5))); 
int flsll(long long) __attribute((availability(macosx,introduced=10.9))); 
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/secure/_strings.h" 3
#ifndef _SECURE__STRINGS_H_
#define _SECURE__STRINGS_H_
# 59
#endif /* _SECURE__STRINGS_H_ */
# 100 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/strings.h" 3
#endif /* _STRINGS_H_ */
# 28 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/secure/_string.h" 3
#ifndef _SECURE__STRING_H_
#define _SECURE__STRING_H_
# 150
#endif /* _SECURE__STRING_H_ */
# 197 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/string.h" 3
#endif /* _STRING_H_ */
# 23 "/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/math.h" 3
#ifndef __MATH_H__
#define __MATH_H__

#ifndef __MATH__
#define __MATH__
#endif /* __MATH__ */
# 44
typedef float float_t; 
typedef double double_t; 
# 111
extern int __math_errhandling(void); 
# 131
extern int __fpclassifyf(float); 
extern int __fpclassifyd(double); 
extern int __fpclassifyl(long double); 
# 174
__attribute((__always_inline__)) __inline__ int __inline_isfinitef(float); 
__attribute((__always_inline__)) __inline__ int __inline_isfinited(double); 
__attribute((__always_inline__)) __inline__ int __inline_isfinitel(long double); 
__attribute((__always_inline__)) __inline__ int __inline_isinff(float); 
__attribute((__always_inline__)) __inline__ int __inline_isinfd(double); 
__attribute((__always_inline__)) __inline__ int __inline_isinfl(long double); 
__attribute((__always_inline__)) __inline__ int __inline_isnanf(float); 
__attribute((__always_inline__)) __inline__ int __inline_isnand(double); 
__attribute((__always_inline__)) __inline__ int __inline_isnanl(long double); 
__attribute((__always_inline__)) __inline__ int __inline_isnormalf(float); 
__attribute((__always_inline__)) __inline__ int __inline_isnormald(double); 
__attribute((__always_inline__)) __inline__ int __inline_isnormall(long double); 
__attribute((__always_inline__)) __inline__ int __inline_signbitf(float); 
__attribute((__always_inline__)) __inline__ int __inline_signbitd(double); 
__attribute((__always_inline__)) __inline__ int __inline_signbitl(long double); 

__attribute((__always_inline__)) __inline__ int __inline_isfinitef(float __x) { 
return (__x == __x) && (__builtin_fabsf(__x) != __builtin_inff()); 
} 
__attribute((__always_inline__)) __inline__ int __inline_isfinited(double __x) { 
return (__x == __x) && (__builtin_fabs(__x) != __builtin_inf()); 
} 
__attribute((__always_inline__)) __inline__ int __inline_isfinitel(long double __x) { 
return (__x == __x) && (__builtin_fabsl(__x) != __builtin_infl()); 
} 
__attribute((__always_inline__)) __inline__ int __inline_isinff(float __x) { 
return __builtin_fabsf(__x) == __builtin_inff(); 
} 
__attribute((__always_inline__)) __inline__ int __inline_isinfd(double __x) { 
return __builtin_fabs(__x) == __builtin_inf(); 
} 
__attribute((__always_inline__)) __inline__ int __inline_isinfl(long double __x) { 
return __builtin_fabsl(__x) == __builtin_infl(); 
} 
__attribute((__always_inline__)) __inline__ int __inline_isnanf(float __x) { 
return __x != __x; 
} 
__attribute((__always_inline__)) __inline__ int __inline_isnand(double __x) { 
return __x != __x; 
} 
__attribute((__always_inline__)) __inline__ int __inline_isnanl(long double __x) { 
return __x != __x; 
} 
__attribute((__always_inline__)) __inline__ int __inline_signbitf(float __x) { 
union  { float __f; unsigned __u; } __u; 
__u.__f = __x; 
return (int)((__u.__u) >> 31); 
} 
__attribute((__always_inline__)) __inline__ int __inline_signbitd(double __x) { 
union  { double __f; unsigned long long __u; } __u; 
__u.__f = __x; 
return (int)((__u.__u) >> 63); 
} 

__attribute((__always_inline__)) __inline__ int __inline_signbitl(long double __x) { 
union  { 
long double __ld; 
struct  { unsigned long long __m; unsigned short __sexp; } __p; 
} __u; 
__u.__ld = __x; 
return (int)(((__u.__p).__sexp) >> 15); 
} 
# 243
__attribute((__always_inline__)) __inline__ int __inline_isnormalf(float __x) { 
return __inline_isfinitef(__x) && (__builtin_fabsf(__x) >= (1.17549435e-38F)); 
} 
__attribute((__always_inline__)) __inline__ int __inline_isnormald(double __x) { 
return __inline_isfinited(__x) && (__builtin_fabs(__x) >= (2.2250738585072014e-308)); 
} 
__attribute((__always_inline__)) __inline__ int __inline_isnormall(long double __x) { 
return __inline_isfinitel(__x) && (__builtin_fabsl(__x) >= (3.36210314311209350626e-4932L)); 
} 
# 308
extern float acosf(float); 
extern double acos(double); 
extern long double acosl(long double); 

extern float asinf(float); 
extern double asin(double); 
extern long double asinl(long double); 

extern float atanf(float); 
extern double atan(double); 
extern long double atanl(long double); 

extern float atan2f(float, float); 
extern double atan2(double, double); 
extern long double atan2l(long double, long double); 

extern float cosf(float); 
extern double cos(double); 
extern long double cosl(long double); 

extern float sinf(float); 
extern double sin(double); 
extern long double sinl(long double); 

extern float tanf(float); 
extern double tan(double); 
extern long double tanl(long double); 

extern float acoshf(float); 
extern double acosh(double); 
extern long double acoshl(long double); 

extern float asinhf(float); 
extern double asinh(double); 
extern long double asinhl(long double); 

extern float atanhf(float); 
extern double atanh(double); 
extern long double atanhl(long double); 

extern float coshf(float); 
extern double cosh(double); 
extern long double coshl(long double); 

extern float sinhf(float); 
extern double sinh(double); 
extern long double sinhl(long double); 

extern float tanhf(float); 
extern double tanh(double); 
extern long double tanhl(long double); 

extern float expf(float); 
extern double exp(double); 
extern long double expl(long double); 

extern float exp2f(float); 
extern double exp2(double); 
extern long double exp2l(long double); 

extern float expm1f(float); 
extern double expm1(double); 
extern long double expm1l(long double); 

extern float logf(float); 
extern double log(double); 
extern long double logl(long double); 

extern float log10f(float); 
extern double log10(double); 
extern long double log10l(long double); 

extern float log2f(float); 
extern double log2(double); 
extern long double log2l(long double); 

extern float log1pf(float); 
extern double log1p(double); 
extern long double log1pl(long double); 

extern float logbf(float); 
extern double logb(double); 
extern long double logbl(long double); 

extern float modff(float, float *); 
extern double modf(double, double *); 
extern long double modfl(long double, long double *); 

extern float ldexpf(float, int); 
extern double ldexp(double, int); 
extern long double ldexpl(long double, int); 

extern float frexpf(float, int *); 
extern double frexp(double, int *); 
extern long double frexpl(long double, int *); 

extern int ilogbf(float); 
extern int ilogb(double); 
extern int ilogbl(long double); 

extern float scalbnf(float, int); 
extern double scalbn(double, int); 
extern long double scalbnl(long double, int); 

extern float scalblnf(float, long); 
extern double scalbln(double, long); 
extern long double scalblnl(long double, long); 

extern float fabsf(float); 
extern double fabs(double); 
extern long double fabsl(long double); 

extern float cbrtf(float); 
extern double cbrt(double); 
extern long double cbrtl(long double); 

extern float hypotf(float, float); 
extern double hypot(double, double); 
extern long double hypotl(long double, long double); 

extern float powf(float, float); 
extern double pow(double, double); 
extern long double powl(long double, long double); 

extern float sqrtf(float); 
extern double sqrt(double); 
extern long double sqrtl(long double); 

extern float erff(float); 
extern double erf(double); 
extern long double erfl(long double); 

extern float erfcf(float); 
extern double erfc(double); 
extern long double erfcl(long double); 




extern float lgammaf(float); 
extern double lgamma(double); 
extern long double lgammal(long double); 

extern float tgammaf(float); 
extern double tgamma(double); 
extern long double tgammal(long double); 

extern float ceilf(float); 
extern double ceil(double); 
extern long double ceill(long double); 

extern float floorf(float); 
extern double floor(double); 
extern long double floorl(long double); 

extern float nearbyintf(float); 
extern double nearbyint(double); 
extern long double nearbyintl(long double); 

extern float rintf(float); 
extern double rint(double); 
extern long double rintl(long double); 

extern long lrintf(float); 
extern long lrint(double); 
extern long lrintl(long double); 

extern float roundf(float); 
extern double round(double); 
extern long double roundl(long double); 

extern long lroundf(float); 
extern long lround(double); 
extern long lroundl(long double); 




extern long long llrintf(float); 
extern long long llrint(double); 
extern long long llrintl(long double); 

extern long long llroundf(float); 
extern long long llround(double); 
extern long long llroundl(long double); 


extern float truncf(float); 
extern double trunc(double); 
extern long double truncl(long double); 

extern float fmodf(float, float); 
extern double fmod(double, double); 
extern long double fmodl(long double, long double); 

extern float remainderf(float, float); 
extern double remainder(double, double); 
extern long double remainderl(long double, long double); 

extern float remquof(float, float, int *); 
extern double remquo(double, double, int *); 
extern long double remquol(long double, long double, int *); 

extern float copysignf(float, float); 
extern double copysign(double, double); 
extern long double copysignl(long double, long double); 

extern float nanf(const char *); 
extern double nan(const char *); 
extern long double nanl(const char *); 

extern float nextafterf(float, float); 
extern double nextafter(double, double); 
extern long double nextafterl(long double, long double); 

extern double nexttoward(double, long double); 
extern float nexttowardf(float, long double); 
extern long double nexttowardl(long double, long double); 

extern float fdimf(float, float); 
extern double fdim(double, double); 
extern long double fdiml(long double, long double); 

extern float fmaxf(float, float); 
extern double fmax(double, double); 
extern long double fmaxl(long double, long double); 

extern float fminf(float, float); 
extern double fmin(double, double); 
extern long double fminl(long double, long double); 

extern float fmaf(float, float, float); 
extern double fma(double, double, double); 
extern long double fmal(long double, long double, long double); 
# 552
extern float __inff(void)
 __attribute((availability(macos,introduced=10.0,deprecated=10.9,message="use `(float)INFINITY` instead"))) __attribute((availability(ios,unavailable))) __attribute((availability(watchos,unavailable))) __attribute((availability(tvos,unavailable))); 
extern double __inf(void)
 __attribute((availability(macos,introduced=10.0,deprecated=10.9,message="use `INFINITY` instead"))) __attribute((availability(ios,unavailable))) __attribute((availability(watchos,unavailable))) __attribute((availability(tvos,unavailable))); 
extern long double __infl(void)
 __attribute((availability(macos,introduced=10.0,deprecated=10.9,message="use `(long double)INFINITY` instead"))) __attribute((availability(ios,unavailable))) __attribute((availability(watchos,unavailable))) __attribute((availability(tvos,unavailable))); 
extern float __nan(void)
 __attribute((availability(macos,introduced=10.0,deprecated=10.14,message="use `NAN` instead"))) __attribute((availability(ios,unavailable))) __attribute((availability(watchos,unavailable))) __attribute((availability(tvos,unavailable))); 
# 588
extern float __exp10f(float) __attribute((availability(macos,introduced=10.9))) __attribute((availability(ios,introduced=7.0))); 
extern double __exp10(double) __attribute((availability(macos,introduced=10.9))) __attribute((availability(ios,introduced=7.0))); 
# 595
__attribute((__always_inline__)) __inline__ void __sincosf(float __x, float * __sinp, float * __cosp); 
__attribute((__always_inline__)) __inline__ void __sincos(double __x, double * __sinp, double * __cosp); 
# 605
extern float __cospif(float) __attribute((availability(macos,introduced=10.9))) __attribute((availability(ios,introduced=7.0))); 
extern double __cospi(double) __attribute((availability(macos,introduced=10.9))) __attribute((availability(ios,introduced=7.0))); 
extern float __sinpif(float) __attribute((availability(macos,introduced=10.9))) __attribute((availability(ios,introduced=7.0))); 
extern double __sinpi(double) __attribute((availability(macos,introduced=10.9))) __attribute((availability(ios,introduced=7.0))); 
extern float __tanpif(float) __attribute((availability(macos,introduced=10.9))) __attribute((availability(ios,introduced=7.0))); 
extern double __tanpi(double) __attribute((availability(macos,introduced=10.9))) __attribute((availability(ios,introduced=7.0))); 
# 636
__attribute((__always_inline__)) __inline__ void __sincospif(float __x, float * __sinp, float * __cosp); 
__attribute((__always_inline__)) __inline__ void __sincospi(double __x, double * __sinp, double * __cosp); 
# 644
struct __float2 { float __sinval; float __cosval; }; 
struct __double2 { double __sinval; double __cosval; }; 

extern struct __float2 __sincosf_stret(float); 
extern struct __double2 __sincos_stret(double); 
extern struct __float2 __sincospif_stret(float); 
extern struct __double2 __sincospi_stret(double); 

__attribute((__always_inline__)) __inline__ void __sincosf(float __x, float *__sinp, float *__cosp) { 
const struct __float2 __stret = __sincosf_stret(__x); 
*__sinp = __stret.__sinval; *__cosp = __stret.__cosval; 
} 

__attribute((__always_inline__)) __inline__ void __sincos(double __x, double *__sinp, double *__cosp) { 
const struct __double2 __stret = __sincos_stret(__x); 
*__sinp = __stret.__sinval; *__cosp = __stret.__cosval; 
} 

__attribute((__always_inline__)) __inline__ void __sincospif(float __x, float *__sinp, float *__cosp) { 
const struct __float2 __stret = __sincospif_stret(__x); 
*__sinp = __stret.__sinval; *__cosp = __stret.__cosval; 
} 

__attribute((__always_inline__)) __inline__ void __sincospi(double __x, double *__sinp, double *__cosp) { 
const struct __double2 __stret = __sincospi_stret(__x); 
*__sinp = __stret.__sinval; *__cosp = __stret.__cosval; 
} 
# 678
extern double j0(double) __attribute((availability(macos,introduced=10.0))) __attribute((availability(ios,introduced=3.2))); 
extern double j1(double) __attribute((availability(macos,introduced=10.0))) __attribute((availability(ios,introduced=3.2))); 
extern double jn(int, double) __attribute((availability(macos,introduced=10.0))) __attribute((availability(ios,introduced=3.2))); 
extern double y0(double) __attribute((availability(macos,introduced=10.0))) __attribute((availability(ios,introduced=3.2))); 
extern double y1(double) __attribute((availability(macos,introduced=10.0))) __attribute((availability(ios,introduced=3.2))); 
extern double yn(int, double) __attribute((availability(macos,introduced=10.0))) __attribute((availability(ios,introduced=3.2))); 
extern double scalb(double, double); 
extern int signgam; 
# 743
extern long rinttol(double)
 __attribute((availability(macos,introduced=10.0,deprecated=10.9))) __attribute((availability(ios,unavailable))) __attribute((availability(watchos,unavailable))) __attribute((availability(tvos,unavailable))); 

extern long roundtol(double)
 __attribute((availability(macos,introduced=10.0,deprecated=10.9))) __attribute((availability(ios,unavailable))) __attribute((availability(watchos,unavailable))) __attribute((availability(tvos,unavailable))); 

extern double drem(double, double)
 __attribute((availability(macos,introduced=10.0,deprecated=10.9))) __attribute((availability(ios,unavailable))) __attribute((availability(watchos,unavailable))) __attribute((availability(tvos,unavailable))); 

extern int finite(double)
 __attribute((availability(macos,introduced=10.0,deprecated=10.9,message="Use `isfinite((double)x)` instead."))) __attribute((availability(ios,unavailable))) __attribute((availability(watchos,unavailable))) __attribute((availability(tvos,unavailable))); 

extern double gamma(double)
 __attribute((availability(macos,introduced=10.0,deprecated=10.9))) __attribute((availability(ios,unavailable))) __attribute((availability(watchos,unavailable))) __attribute((availability(tvos,unavailable))); 

extern double significand(double)
 __attribute((availability(macos,introduced=10.0,deprecated=10.9,message="Use `2*frexp( )` or `scalbn(x, -ilogb(x))` instead."))) __attribute((availability(ios,unavailable))) __attribute((availability(watchos,unavailable))) __attribute((availability(tvos,unavailable))); 



struct exception { 
int type; 
char *name; 
double arg1; 
double arg2; 
double retval; 
}; 





#endif /* __MATH_H__ */
# 5 "/var/folders/nb/bbv1g1h14wxc097q5m7tc9f40000gn/T/cxxfe_108249494742917.in"
#ifndef RTWTYPES_H
#define RTWTYPES_H

#endif /* RTWTYPES_H */
# 8 "/Users/baikhyeongmeon/Documents/MATLAB/xytheta/microcontroller.h"
#ifndef MICROCONTROLLER_H_
#define MICROCONTROLLER_H_
# 6 "/Users/baikhyeongmeon/Documents/MATLAB/paper/FEMM_xytheta/hihi/Library/Software/headers/Constants.h"
#ifndef CONSTANTS_H_
#define CONSTANTS_H_
# 27
#endif /* CONSTANTS_H_ */
# 15 "/Users/baikhyeongmeon/Documents/MATLAB/xytheta/microcontroller.h"
void microcontroller(const double * adc1, const double * adc2, const double * adc3, const double * adc4, const double * adc5, const double * adc6, const double * adc7, const double * adc8, const double * adc9, const double * adc10, const double * adc11, const double * adc12, double * dac1, double * dac2, double * dac3); 




void init_software(void); 
# 42
#endif /* MICROCONTROLLER_H_ */
