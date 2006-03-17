package Win32::Fmode;

use 5.0;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw(
    fmode
);

our $VERSION = '1.0.4';

require XSLoader;
XSLoader::load('Win32::Fmode', $VERSION);

sub fmode {
    my $fh = shift;
    die "No/bad argument supplied!.\nUsage: fmode( open filehandle )"
        unless defined $fh and ref $fh eq 'GLOB';
    die "fmode does no currently work on ramfiles\n" if fileno( $fh ) == -1;
    die "'$fh' is not an open filehandle\n"
        unless 1+fileno( $fh );
    return xs_fmode( $fh );
}

1;
__END__

=head1 NAME

Win32::Fmode - determine whether a Win32 filehandle is opened for reading, writing , or both.

=head1 SYNOPSIS

 use warnings;
 use Win32::Fmode;
 .
 .
 my $mode = fmode( \*FH ); # FH is an open filehandle

=head1 FUNCTIONS

The purpose is to work around the MS C runtime libraries lack of a
function to retrieve the file mode used when a file is opened.

Exports a single function: fmode

Pass it an open Perl filehandle and it will return a numeric value that
represents the mode parameter used on the open.

If the parameter passed is not an open filehandle, the call will raise an exception.

     fmode( \*FILEHANDLE ) &   1 and print "is readonly";
     fmode( \*FILEHANDLE ) &   2 and print "is writeonly";
     fmode( \*FILEHANDLE ) & 128 and print "is read/write";

=head1 BUGS

Note: Ram files c<open FH, '<', \$ram> are not true filehandles (they are tied globs),
and therefore do not have the associated CRT FILE structure from which this module
obtains the information, and no way has yet been found to retreive that information
from them.

The module IO::String suffers teh same limitations.


=head1 LICENSE

 This program is free software; you may redistribute it and/or
 modify it under the same terms as Perl itself.

=head1 AUTHOR & COPYRIGHT

 Written by BrowserUK.
 Copyright BrowserUK.
 bug reports to BrowserUk@cpan.org

=cut
