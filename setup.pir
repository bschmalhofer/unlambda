#!/usr/bin/env parrot
# Copyright (C) 2009, Parrot Foundation.

=head1 NAME

setup.pir - Python distutils style

=head1 DESCRIPTION

No Configure step, no Makefile generated.

=head1 USAGE

    $ parrot setup.pir build
    $ parrot setup.pir test
    $ sudo parrot setup.pir install

=cut

.sub 'main' :main
    .param pmc args
    $S0 = shift args
    load_bytecode 'distutils.pbc'

    $P0 = new 'Hash'
    $P0['name'] = 'Unlambda'
    $P0['abstract'] = 'Unlambda is a functional programming language.'
    $P0['authority'] = 'http://github.com/bschmalhofer'
    $P0['description'] = 'Unlambda is a functional programming language. See http://en.wikipedia.org/wiki/Unlambda for details.'
    $P0['license_type'] = 'Artistic License 2.0'
    $P0['license_uri'] = 'http://www.perlfoundation.org/artistic_license_2_0'
    $P0['copyright_holder'] = 'Parrot Foundation'
    $P0['checkout_uri'] = 'git://github.com/bschmalhofer/unlambda.git'
    $P0['browser_uri'] = 'http://github.com/bschmalhofer/unlambda'
    $P0['project_uri'] = 'http://github.com/bschmalhofer/unlambda'

    # build
    $P1 = new 'Hash'
    $P1['unl.pbc'] = 'unl.pir'
    $P0['pbc_pir'] = $P1

    $P2 = new 'Hash'
    $P2['parrot-unl'] = 'unl.pbc'
    #$P0['installable_pbc'] = $P2

    .tailcall setup(args :flat, $P0 :flat :named)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
