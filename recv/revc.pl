#/usr/bin/perl

use strict;
use warnings;

while (<>) {
   chomp;
   next unless $_;
   print work($_), "\n";
}

1;

sub work {
   my $in = shift;
   $in =~ y/ACGT/TGCA/;
   return scalar reverse $in;
}
