#!/usr/bin/perl
# -*- perl -*-
#
# DO NOT EDIT, created automatically by /home/e/eserte/src/mkautoinstall/mkautoinstall

# on Thu Feb 28 21:40:26 2002
#

use Getopt::Long;
my $require_errors;
my $use_ppm;

if (!GetOptions("ppm!" => \$use_ppm)) {
    die "usage: $0 [-[no]ppm]\n";
}

if ($use_ppm) {
    require PPM;
    do { print STDERR 'Install XML-Parser'.qq(\n); PPM::InstallPackage(package => 'XML-Parser') or warn ' (not successful)'.qq(\n); } if !eval 'require XML::Parser';
    do { print STDERR 'Install Tk'.qq(\n); PPM::InstallPackage(package => 'Tk') or warn ' (not successful)'.qq(\n); } if !eval 'require Tk';
} else {
    use CPAN;
    install 'XML::Parser' if !eval 'require XML::Parser';
    install 'Tk' if !eval 'require Tk';
}
if (!eval 'require XML::Parser;') { warn $@; $require_errors++ }
if (!eval 'require Tk;') { warn $@; $require_errors++ }

warn "Autoinstallation completed\n" if !$require_errors;
