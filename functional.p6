#!/usr/bin/env perl6
use v6;

# closures
my @times = ();         # Array.new
for 1..10 {
    my $innerMultiplicant = $_;
    @times[$_] = sub ($a) { $a * $innerMultiplicant };
}

say @times[3](4);       # 12
say @times[5](20);      # 100
say @times[7](3);       # 21



# lazy eval.
my @all-the-integers = 0..Inf;
for ^10 { say @all-the-integers[$_] }

# map is not lazy, DO NOT DO THIS!
#my @squares = @all-the-integers.map( { $_ * $_ } );
#for ^10 { say @squares[$_] }

(1..10).map( { $_ * $_ } ).join(", ").say;


my @zipped-array = (1, 2, 3) Z (10, 20, 30);   
#my @zipped-array = zip (1, 2, 3), (10, 20, 30);   
@zipped-array.join(", ").say;


sub are-pairwise-greater(@array1, @array2) {
    for @array1 Z @array2 -> $x, $y {
        return False if $x <= $y;
    }
    return True;
}
are-pairwise-greater(2..11, 1..10).say;     # True
are-pairwise-greater(2..11, 1..5).say;      # True
are-pairwise-greater(2..3, 1..15).say;      # True
are-pairwise-greater((3,3,3), (1,2,3)).say; # False
