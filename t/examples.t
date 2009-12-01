#! perl

# Copyright (C) 2005-2009, The Perl Foundation.
# $Id$

=head1 NAME

unlambda/t/examples.t - testing the examples

=head1 SYNOPSIS

    % cd languages/unlambda && perl t/examples.t

=head1 DESCRIPTION

Test the examples.

=head1 AUTHOR

Bernhard Schmalhofer - C<Bernhard.Schmalhofer@gmx.de>

=cut

use strict;
use warnings;

use Test::More        tests => 4;
use File::Spec        ();

my $parrot    = 'parrot';
my $unlamba   = "$parrot unl.pbc";
my @test_cases = (
    [ 'newline.unl'  => "\n" ],
    [ 'h.unl'        => "h\n" ],
    [ 'k.unl'        => 'H' ],
    [ 'hello.unl'    => "Hello world\n" ],
);

foreach (@test_cases) {
    my ($code_fn, $out) = @{$_};
    my $prog = File::Spec->catfile( 'examples', $code_fn ); 
    is( `$unlamba $prog`, $out, "example $code_fn" );
}
