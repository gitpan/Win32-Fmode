package Win32::Fmode;

use 5.0;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw(
    fmode
);

our $VERSION = '1.0';

require XSLoader;
XSLoader::load('Win32::Fmode', $VERSION);

# Preloaded methods go here.

1;
__END__

=heading1 Win32::Fmode

The purpose is to work around the MS C runtime libraries lack of a
function to retrieve the file mode used when a file is opened.

Exports a single function c<fmode( filehandle )>

Pass it a Perl filehandle and it will return a numeric value that
represents the mode parameter used on the open.

    fmode( \*FILEHANDLE ) &   1 and print "is readonly";
    fmode( \*FILEHANDLE ) &   2 and print "is writeonly";
    fmode( \*FILEHANDLE ) & 128 and print "is read/write";

Err. That's it folks. Nothing else to see here. Move along.
