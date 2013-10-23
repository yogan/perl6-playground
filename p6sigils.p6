#!/usr/bin/env perl6

use v6;

my $scalar = "sclr";
my @array = (1, 2, 3);
my %hash = (foo => 23, bar => 42);

print $scalar      ~ "\n";
print @array[0]    ~ "\n";
print %hash{'foo'} ~ "\n";

#print $array[1]    ~ "\n";  # Variable '$array' is not declared.
			    # Did you mean '@array'?

