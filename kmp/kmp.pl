#!/usr/bin/perl

use strict;
use warnings;

while (<>) {
   chomp;
   next unless $_;
   print join(' ', failArray($_)), "\n";
}

sub failArray {
   my $arr  = [split //, shift];
   my @fail = map { 0 } @$arr;

   my $m = 0;
   my $i = 1;
   while($i < scalar @$arr) {
      if ($arr->[$i] eq $arr->[$m]) {
         $m++;
         $fail[$i] = $m if ($fail[$i] < $m);
         $i++;
      } else {
         $i = $i - $m + 1;
         $m = 0;
      }
   }

   return @fail;
}
