#!/usr/bin/env perl6
use v6;

my @arr = "str1",
           23,
           [1, 2, 3],
           "str2"
          ;
@arr.push(42);
@arr[1] = 232323;
@arr[2][1] = "Zwei";
say @arr.perl;
say;


# three ways to get an empty list:
# 1.
my @empty-array1 = ();
say @empty-array1.perl;
say @empty-array1.WHAT;
say "Lenght: {@empty-array1.elems}";
say;

# 2.
my @empty-array2 = < >;
say @empty-array2.perl;
say @empty-array2.WHAT;
say "Lenght: {@empty-array2.elems}";
say

# 3.
my @empty-array3 = Array.new;
say @empty-array3.perl;
say @empty-array3.WHAT;
say "Lenght: {@empty-array3.elems}";
say

# this produces an array with one elem, which is the empty list
my @array-of-empty-array = [];
say @array-of-empty-array.perl;
say @array-of-empty-array.WHAT;
say "Lenght: {@array-of-empty-array.elems}";
say @array-of-empty-array[0].perl;
say @array-of-empty-array[0].WHAT;
say "Lenght: {@array-of-empty-array[0].elems}";
