#!/usr/bin/perl

use strict;
use warnings;

while (<>) {
   chomp;
   next unless $_;
   print $_, "\n", revc($_), "\n";
   print join("\n", map { join(' ', @$_) } find_palindromes($_) ), "\n";
}

1;

sub revc {
   my $in = shift;
   $in =~ y/ACGT/TGCA/;
   return scalar reverse $in;
}

sub find_palindromes {
   my $in = shift;
   my $str = join('|', $in, revc($in));

   my @m = ();

   while ($str =~ m/(?=(.{4,6})).*\|.*\1/g) {
      push @m, [$-[0] + 1, length $1, $1];
   }

   return @m;
}
