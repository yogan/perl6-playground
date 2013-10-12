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

# pass-by-value with "is copy"
sub say_next_num($num is copy) {
    say ++$num;
}

my $num_of_truth = 42;
say_next_num($num_of_truth);
say "the truth is: $num_of_truth";


# arrays, hashes and subs as arguments

sub shout_words(@words) {
    for @words -> $word {
        say uc($word);
    }
}
my @words = <hey ho let's go>;
shout_words(@words);

sub say_names_with_age(%people) {
    for %people {
        say .key ~ " (" ~ .value ~ ")";
    }
}
my %white_family = Walter => 52, Skyler => 41, "Walter Jr." => 17 , Holly => 2;
say_names_with_age(%white_family);

sub multi_exec(&proc, $times) {
    for 1..$times {
        proc();
    }
}
multi_exec( { say "Whooo!" }, 3 );


# interpolating arrays and hashes

sub sum_of_three($x, $y, $z) {
    say "$x + $y + $z = {$x + $y + $z}";
}

my @nums = (1, 2, 3);
sum_of_three(@nums[0], @nums[1], @nums[2]); # is equivalent to:
sum_of_three(|@nums);   # @nums must have exactly three elements

sub hashyhashy(:$foo, :$bar) {
    say "foo: $foo / bar: $bar";
}

my %stuff = bar => '123', foo => '---';
hashyhashy(|%stuff);


# restrict arguments with type and range
# http://perl6advent.wordpress.com/2009/12/09/day-9-having-beautiful-arguments-and-parameters
my %ages;
sub set_age(Str $name, Int $age where 0..90) {
    %ages{$name} = $age;
}
set_age("John Doe", 42);
#set_age(1234, 42);         # NOPE. Wrong arg types (Int, Int)
#set_age("John Doe", 99);   # NOPE. Constraint type check failed
say %ages;


# default parameters
sub draw_ascii_rectangle(Int $width  where 1..10 = 2,
                         Int $height where 1..10 = $width) {
    for ^$height {
        for ^$width {
            print "#";
        }
        print "\n";
    }
}
draw_ascii_rectangle(10, 1);
draw_ascii_rectangle();
draw_ascii_rectangle(4);


# named parameters

sub draw_line($x1, $y1, $x2, $y2) {
    say "($x1/$y1) -----> ($x2/$y2)";
}
my ($x1, $y1) = (0, 0);
my ($x2, $y2) = (4, 5);
draw_line($x1, $x2, $y1, $y2);      #damn, mixed up the args...

# use : prefix to declare param as named
# also put ! postfix to make required, default is optional (?) for named params
sub draw_line_named(:$x1!, :$y1!, :$x2!, :$y2!) {
    say "($x1/$y1) =====> ($x2/$y2)";
}
#draw_line_named();  # not possible because of !
draw_line_named(:$x1, :$x2, :$y1, :$y2);  # haha, don't care anymore!
draw_line_named(:$x2, :$x1, :$y2, :$y1);  # just the same

# drawback: those won't work anymore:
#draw_line_named(1,2,3,4);  # given as positional params
my ($a1, $b1) = (0, 0);
my ($a2, $b2) = (4, 5);
#draw_line_named(:$a1, :$a2, :$b1, :$b2);  # names don't match
draw_line_named(:x1($a1), :x2($a2), :y1($b1), :y2($b2)); # bind the names!
draw_line_named(:x1(1),   :x2(2),   :y1(3),   :y2(4));   # we can use consts now


# varargs with slurpy arrays (* prefix)
sub sum(*@nums) {
    [+] @nums;
}
say sum 42, 23, 1337;

# default (no "()" given!) is *@_, so:
sub sum2 {
    [+] @_;
}
say sum2 42, 23, 1337;

# for an variable amount of named params, use slurpy hashes:
sub detect_nonfoos(:$foo!, *%nonfoos) {
    say "Besides 'foo', you passed in ", %nonfoos.keys.join(", ");
}
detect_nonfoos(:foo(1), :bar(2), :baz(3), :qux);
