package Win32::Fmode;

use 5.0;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw(
    fmode
);

our $VERSION = '1.0.2';

require XSLoader;
XSLoader::load('Win32::Fmode', $VERSION);

# Preloaded methods go here.

1;
__END__

=head1 NAME

Win32::Fmode - determine whether a Win32 filehandle is opened for reading, writing , or both.

=head1 SYNOPSIS

 use warnings;
 use Win32::Fmode;
 .
 .
 my $mode = fmode( \*HND ); # HND is an open filehandle

=head1 FUNCTIONS

 The purpose is to work around the MS C runtime libraries lack of a
 function to retrieve the file mode used when a file is opened.

 Exports a single function: fmode

 Pass it a Perl filehandle and it will return a numeric value that
 represents the mode parameter used on the open.

     fmode( \*FILEHANDLE ) &   1 and print "is readonly";
     fmode( \*FILEHANDLE ) &   2 and print "is writeonly";
     fmode( \*FILEHANDLE ) & 128 and print "is read/write";

=head1 LICENSE

 This program is free software; you may redistribute it and/or
 modify it under the same terms as Perl itself.

=head1 AUTHOR & COPYRIGHT

 Written by BrowserUK.
 Copyright BrowserUK.
 bug reports to BrowserUk@cpan.org

=cut
