#!/usr/bin/env perl

use strict;
use warnings;

my $scalar = "sclr";
my @array = (1, 2, 3);
my %hash = (foo => 23, bar => 42);

print $scalar      . "\n";
print @array[0]    . "\n";	# works, but warning
#print %hash{'foo'} . "\n";	# syntax error
print $array[1]    . "\n";
print $hash{'bar'} . "\n";
