#!/usr/bin/env perl

use strict;
use warnings;
use bigint;
use v5.10;

use Memoize;
memoize 'factorial';

my $in = '';
while (<>) {
   chomp;
   next if m/^>/;
   $in .= $_;
}

my $c = get_count($in);
print matchings($c->('A'), $c->('C'));

exit 0;

sub factorial {
   my $n = shift;
   return 1 if $n <= 1;
   return $n * factorial($n - 1);
}

sub get_count {
   my $seq = shift;
   my $c = {};
   foreach (split //, $seq) {
      $c->{$_}++;
   }
   return sub { $c->{ shift() } };
}

sub matchings {
   my ($ua, $cg) = @_;
   return factorial($ua) * factorial($cg);
}

