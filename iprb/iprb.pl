#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;

while (<>) {
   chomp;
   my ($k, $m, $n) = split /\s+/, $_;

   print prob_dom($k, $m, $n);
}

exit 0;

sub prob_dom {
   my ($k, $m, $n) = @_;

   my $s = $k + $m + $n;
   my $s1 = $s - 1;

   return 1 - 0.25 * ($m / $s) * (($m - 1) / $s1)
            - 0.5  * ($m / $s) * ($n / $s1)
            - 0.5  * ($n / $s) * ($m / $s1)
            - 1.0  * ($n / $s) * (($n - 1) / $s1);
}
