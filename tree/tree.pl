#!/usr/bin/perl

use strict;
use warnings;

my $n = (<>);
chomp $n;

my $edges = 0;

while (<>) {
   chomp;
   next unless $_;
   $edges++;
}

print $n - $edges - 1, "\n";
