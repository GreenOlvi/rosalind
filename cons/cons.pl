#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(reduce);

my $arr  = [];

while (<>) {
   chomp $_;
   next unless $_;
   add($arr, $_);
}

sub add {
   my $arr = shift;
   my $in  = shift;

   my $i = 0;
   foreach my $l (split //, $in) {
      $arr->[$i]->{$l}++;
      $i++;
   }
}

print map { my $l = $_; reduce { $l->{$a} > $l->{$b} ? $a : $b } keys %$l } @$arr;
print "\n";

print join "\n", map { my $l = $_; "$l: " . join ' ', map { $_->{$l} || 0 } @$arr } qw(A C G T);
print "\n";

1;
