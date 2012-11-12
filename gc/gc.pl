#/usr/bin/perl

use strict;
use warnings;

my $curr_label = '';
my $curr_input = [];
my $max_label = '';
my $max_count = 0;

while (<>) {
   chomp;
   next unless $_;
   if (/^>/) {
      my $new_label = $_;

      if (@$curr_input) {
	 analyze($curr_label, join('', @$curr_input));
	 $curr_input = [];
      }

      $new_label =~ s/^>//;
      $curr_label = $new_label;
   } else {
      push @$curr_input, $_;
   }
}

if (@$curr_input) {
   analyze($curr_label, join('', @$curr_input));
   $curr_input = [];
}

print join "\n", $max_label, sprintf('%0.5f%%', $max_count);

1;

sub analyze {
   my $label = shift;
   my $in    = shift;
   my $c     = count($in);

   print "[$c]\n";
   if ($c > $max_count) {
      $max_count = $c;
      $max_label = $label;
   }
}

sub count {
   my $in = shift;
   print length $in, "\n";
   my $tmp = $in;
   my $gc = ($tmp =~ tr/GC/../);
   return ($gc / length($in)) * 100;
}
