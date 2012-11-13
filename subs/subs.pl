#!/usr/bin/perl

use strict;
use warnings;

my $in = [];
while (<>) {
   chomp;
   next unless $_;
   push @$in, $_;
}

print join ' ', positions($in->[0], $in->[1]);
print "\n";

sub positions {
   my $string = shift;
   my $subs   = shift;

   my @ret = ();
   while ($string =~ m/(?=$subs)/g) {
      push @ret, ($-[0] + 1);
   }
   return @ret;
}
