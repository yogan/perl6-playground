#!/usr/bin/env perl6
use v6;

my @a = 1..10;
my @b = 11..20;

# multiply all elements of @a
my $prod = [*] @a;           

# calculate mean of @a
my $mean  = ([+] @a) / @a.elems;    
my $mean2 = ([+] @a) / @a;       # <- equivalent, because array in scalar
                                 #    context returns number of elements

# true if elements of @a are numerically sorted
my $sorted = [<=] @a;        

# find the smallest element of @a and @b combined
my $min = [min] @a, @b;      

say "prod: $prod, mean: $mean, sorted: $sorted, min: $min";


# length way to get array of sums:
my @sums = ();
for @a Z @b -> $x, $y {
    @sums.push($x + $y);
}
@sums.join(", ").say;

# short and nice with hyper plus!
(@a »+« @b).join(", ").say;



# increment all elements
@a = 1, 7, 9;
@a»++;
@a.join(", ").say;

# get pairwise minimum
@a = 1, 7, 9;
@b = 4, 2, 9;
my @minima = @a »min« @b;
@minima.join(", ").say;
