#/usr/bin/perl

use strict;
use warnings;

while (<>) {
   chomp;
   next unless $_;
   print work($_), "\n";
}

sub work {
   my $in = shift;

   my $res = {};
   $res->{$_}++ foreach (split '', $in);

   return join(' ', map { $res->{$_} } qw(A C G T) );
}

1;
