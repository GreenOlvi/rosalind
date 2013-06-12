#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

while (<>) {
   chomp;
   my $count = get_count($_);
   printf "%d %d %d %d", $count->('A'), $count->('C'), $count->('G'), $count->('T');
}

exit 0;

sub get_count {
   my $seq = shift;
   my $c = {};
   foreach (split //, $seq) {
      $c->{$_}++;
   }
   return sub { $c->{ shift() } };
}
