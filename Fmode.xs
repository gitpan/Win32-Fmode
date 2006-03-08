#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"
#include <STDIO.h>

int 
fmode( FILE *stream ) {
    return stream->_flag;
}

MODULE = Win32::Fmode  PACKAGE = Win32::Fmode  

PROTOTYPES: DISABLE

int
fmode (stream)
    FILE *  stream
