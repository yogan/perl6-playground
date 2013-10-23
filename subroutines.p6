#!/usr/bin/env perl6
use v6;

sub do-things() { say "I'll do things."; }
do-things();


# now with some simple signatures
sub square-and-sum($x, $y) {
    return $x*$x + $y*$y;
}

my $a = 3;
my $b = 4;
say "{$a}² + {$b}² = {square-and-sum($a, $b)}";


# modifying arguments
sub stutter($word) {
    my $first-letter = substr($word, 0, 1);
    my $wwwword = ($first-letter ~ "-") x 3 ~ $word;
    say $wwwword;
    # $word = $wwwword;         # no no no! $word is readonly
}

stutter("what");        # w-w-w-what


# modifying arguments
sub stutterify($word is rw) {
    my $first-letter = substr($word, 0, 1);
    my $wwwword = ($first-letter ~ "-") x 3 ~ $word;
    $word = $wwwword;
}

my $word = "hello";
$word.say;              # hello
stutterify($word);
$word.say;              # h-h-h-hello


sub reverse($word is rw) {
    $word = flip($word);
}


my $input-word = "stressed";
say "input-word (before reverse()): $input-word";
reverse($input-word);
say "input-word (after reverse()): $input-word";

# pass-by-value with "is copy"
sub say-next-num($num is copy) {
    say ++$num;
}

my $num-of-truth = 42;
say-next-num($num-of-truth);
say "The truth is still $num-of-truth";


# arrays, hashes and subs as arguments

sub shout-words(@words) {
    for @words -> $word {
        say uc($word);
    }
    for @words {
        say flip($_);
    }
}
my @words = <hey ho let's go>;
shout-words(@words);

sub say-names-with-age(%people) {
    for %people.kv -> $key, $value {
        say $key ~ " (" ~ $value ~ ")";
    }
    for %people {
        say $_.key ~ " (" ~ $_.value ~ ")";
    }
    for %people {
        say .key ~ " (" ~ .value ~ ")";
    }
}
my %white-family = Walter       => 52, Skyler => 41,
                   "Walter Jr." => 17, Holly  => 2;
say-names-with-age(%white-family);

sub multi-exec(&proc, $times) {
    for 1..$times {
        proc();
    }
}
multi-exec( { say "Whooo!" }, 3 );


# interpolating arrays and hashes

sub sum-of-three($x, $y, $z) {
    say "$x + $y + $z = {$x + $y + $z}";
}

my @nums = (1, 2, 3);
sum-of-three(@nums[0], @nums[1], @nums[2]); # is equivalent to:
sum-of-three(|@nums);   # @nums must have exactly three elements

sub hashyhashy(:$foo, :$bar) {
    say "foo: $foo / bar: $bar";
}

my %stuff = bar => '123', foo => '---';
hashyhashy(|%stuff);


# restrict arguments with type and range
# http://perl6advent.wordpress.com/2009/12/09/day-9-having-beautiful-arguments-and-parameters
my %ages;
sub set-age(Str $name, Int $age where 0..90) {
    %ages{$name} = $age;
}
set-age("John Doe", 42);
#set-age(1234, 42);         # NOPE. Wrong arg types (Int, Int)
#set-age("John Doe", 99);   # NOPE. Constraint type check failed
say %ages;


# default parameters
sub draw-ascii-rectangle(Int $width  where 1..10 = 2,
                         Int $height where 1..10 = $width) {
    for ^$height {
        for ^$width {
            print "#";
        }
        print "\n";
    }
}
draw-ascii-rectangle(10, 1);
draw-ascii-rectangle();
draw-ascii-rectangle(4);


# optional parameters
sub whatever($optional?) {
    if defined($optional) {
        say "$optional is pretty cool.";
    } else {
        say "Whatever, man.";
    }
}
whatever("The dude");
whatever();

# named parameters (2)

sub protip(:$what!, :$who!) {
    say "Use $what, $who!";
}
protip(:what("the force"), :who("Luke"));
protip(:who("Luke"), :what("the force"));

# short form for strings
protip(:who<Luke>, :what<the force>);

my $thing = "the force";
my $guy   = "Luke";
#protip( $thing,  $guy);             # Nope.
#protip(:$thing, :$guy);             # Also, nope.
protip(:what($thing), :who($guy));

my $what = "the force";
my $who  = "Luke";
protip(:$who, :$what);   # var names match → magic!

protip();


# named parameters

sub draw-line($x1, $y1, $x2, $y2) {
    say "($x1/$y1) -----> ($x2/$y2)";
}
my ($x1, $y1) = (0, 0);
my ($x2, $y2) = (4, 5);
draw-line($x1, $x2, $y1, $y2);      #damn, mixed up the args...

# use : prefix to declare param as named
# also put ! postfix to make required, default is optional (?) for named params
sub draw-line-named(:$x1!, :$y1!, :$x2!, :$y2!) {
    say "($x1/$y1) =====> ($x2/$y2)";
}
#draw-line-named();  # not possible because of !
draw-line-named(:$x1, :$x2, :$y1, :$y2);  # haha, don't care anymore!
draw-line-named(:$x2, :$x1, :$y2, :$y1);  # just the same

# drawback: those won't work anymore:
#draw-line-named(1,2,3,4);  # given as positional params
my ($a1, $b1) = (0, 0);
my ($a2, $b2) = (4, 5);
#draw-line-named(:$a1, :$a2, :$b1, :$b2);  # names don't match
draw-line-named(:x1($a1), :x2($a2), :y1($b1), :y2($b2)); # bind the names!
draw-line-named(:x1(1),   :x2(2),   :y1(3),   :y2(4));   # we can use consts now


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
sub detect-nonfoos(:$foo!, *%nonfoos) {
    say "Besides 'foo', you passed in ", %nonfoos.keys.join(", ");
}
detect-nonfoos(:foo(1), :bar(2), :baz(3), :qux);
