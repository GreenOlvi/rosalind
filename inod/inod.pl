#!/usr/bin/perl

use strict;
use warnings;

while (<>) {
   chomp;
   next unless $_;

   print $_ - 2, "\n";
}
