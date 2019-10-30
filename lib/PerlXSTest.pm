package PerlXSTest;

use strict;
use warnings;

sub dies {
    die "Croak!\n";
}

require XSLoader;
XSLoader::load();
