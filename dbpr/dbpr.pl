#!/usr/bin/perl

use strict;
use warnings;
use v5.10;

use LWP::Simple;


my $content = get "http://www.uniprot.org/uniprot/B5ZC00.txt";

say join "\n", grep { m/GO;/ } split /[\r\n]+/, $content;

exit 0;
