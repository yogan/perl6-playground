#!/usr/bin/env perl6
use v6;

sub do_things() { say "I'll do things."; }
do_things();


# now with some simple signatures
sub square_and_sum($x, $y) {
    return $x*$x + $y*$y;
}

my $a = 3;
my $b = 4;
say "{$a}² + {$b}² = {square_and_sum($a, $b)}";


# modifying arguments
sub stutter($word) {
    my $first_letter = substr($word, 0, 1);
    my $wwwword = ($first_letter ~ "-") x 3 ~ $word;
    say $wwwword;
    # $word = $wwwword;         # no no no! $word is readonly
}

sub reverse($word is rw) {
    $word = flip($word);
}

stutter("what");

my $input_word = "stressed";
say "input_word (before reverse()): $input_word";
reverse($input_word);
say "input_word (after reverse()): $input_word";
