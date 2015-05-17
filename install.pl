#!/usr/bin/perl -w

#
# install.pl
#
# Developed by Baskar Nallathambi <baskarmusiri@gmail.com>
#
# Changelog:
# 2015-05-17 - created
#

use strict;
use Cwd;

my $csv_file = "./conf.csv";
open FH, "<", "$csv_file" or die $!;;
<FH>;
while (<FH>) {
        chomp $_;
        next unless ($_);
        my ($src,$dest) = split(",",$_);
        
        $dest = "$ENV{HOME}/$dest";
        $src = getcwd() . "/$src";

        if ( -e $src ) {
            rename $dest,"$dest.old";
        }

        if ( symlink($src,$dest) ) {
            print "symlink created $dest to $src\n";
        }else {
            print "Failed to create symlink  on $dest\n";
        }
}




# vim: ts=4
# vim600: fdm=marker fdl=0 fdc=3

