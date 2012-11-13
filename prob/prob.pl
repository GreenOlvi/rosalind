#!/usr/bin/perl

use strict;
use warnings;

while (<>) {
   chomp;
   next unless $_;
   print join(' ', map { sprintf("%0.6f", count($_)) } split /\s+/);
   print "\n";
}

sub count {
   my $gc = shift;
   return $gc**2 - $gc + 0.5;
}
