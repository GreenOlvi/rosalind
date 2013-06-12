#!/usr/bin/env perl

use strict;
use warnings;

MAIN: {
   my $n = <>;
   chomp $n;

   my $A = <>;
   $A = parse_set($A);

   my $B = <>;
   $B = parse_set($B);

   print set_string(union($A, $B)), "\n";
   print set_string(intersection($A, $B)), "\n";
   print set_string(difference($A, $B)), "\n";
   print set_string(difference($B, $A)), "\n";
   print set_string(complement($A, $n)), "\n";
   print set_string(complement($B, $n)), "\n";

   exit 0;
}

sub set {
   my @s = @_;
   return [keys { map { $_ => 1 } @s }];
}

sub parse_set {
   my $string = shift;
   chomp $string;
   $string =~ s/^{|}$//g;
   return set split /[,\s]+/, $string;
}

sub set_string {
   my $A = shift;
   return sprintf "{%s}", join ', ', sort { $a <=> $b } @$A;
}

sub union {
   my ($A, $B) = @_;
   return set @$A, @$B;
}

sub intersection {
   my ($A, $B) = @_;
   my $b = { map { $_ => 1 } @$B };
   return set grep { $b->{$_} } @$A;
}

sub difference {
   my ($A, $B) = @_;
   my $b = { map { $_ => 1 } @$B };
   return set grep { !$b->{$_} } @$A;
}

sub complement {
   my ($A, $n) = @_;
   return difference [1..$n], $A;
}
