#!/usr/bin/env perl6
use v6;

sub print-array-infos(@array) {
    say @array.name ~ ": " ~ @array.perl ~ " (Lenght: {@array.elems})";
}

sub traverse-array(@array, $level = 0) {
    my $indent = "  " x $level;
    say $indent ~ "[";
    for @array -> $elem {
        if $elem ~~ Array {
            traverse-array($elem, $level + 1);
        }
        else {
            say "  " ~ $indent ~ $elem;
        }
    }
    say $indent ~ "]";
}

sub print-infos-and-traverse-array($array){
    print-array-infos($array);
    traverse-array($array);
}

# nested array
my @arr = "str1",
           23,
           [1, 2, 3],
           "str2";

print-infos-and-traverse-array(@arr);
say;

@arr.push(42);
@arr[1] = 232323;
@arr[2][0] = Array.new;
@arr[2][1] = "Zwei";
@arr[2][2] = [10, 20, 30];

print-infos-and-traverse-array(@arr);
say; say;


# three ways to get an empty list:
# 1.
my @empty-array1 = ();
#print-infos-and-traverse-array(@empty-array1);
#say;

# 2.
my @empty-array2 = < >;
#print-infos-and-traverse-array(@empty-array2);
#say;

# 3.
my @empty-array3 = Array.new;
#print-infos-and-traverse-array(@empty-array3);
#say;


# this produces an array with one elem, which is the empty list
my @array-of-empty-array = [];
print-infos-and-traverse-array(@array-of-empty-array);
say;


my @array-with-two-empty-arrays = Array.new;
@array-with-two-empty-arrays.push(@empty-array1);       # does nothing...?
@array-with-two-empty-arrays.push($(@empty-array1));
@array-with-two-empty-arrays.push($(@empty-array1));
print-infos-and-traverse-array(@array-with-two-empty-arrays);
say;

my @array-with-two-empty-arrays2 = $([]), $([]);
print-infos-and-traverse-array(@array-with-two-empty-arrays2);
say;

my @array-with-two-empty-arrays3 = [], [];
print-infos-and-traverse-array(@array-with-two-empty-arrays3);
say;

my @array-with-two-empty-arrays4 = Array.new([], []);
print-infos-and-traverse-array(@array-with-two-empty-arrays4);
