#!/usr/bin/env perl6
use v6;

class A {}
class B is A {}
class C {}

my $b = B.new;

say "b is a A" if $b ~~ A;  # yep.
say "b is a B" if $b ~~ B;  # yep.
say "b is a C" if $b ~~ C;  # certainly not


my $num = 23;
say "num has two digits" if $num ~~ 10..99;


my @list1 = 1, 2, 3, 4;
my @list2 = 1..4;
say "list are identical" if @list1 ~~ @list2;


my $text = "sOme tExT hEre";
say "matches" if $text ~~ m:i/text/;


my @list = 1, 2, 3; 
say (1 ~~ any(@list)) ?? "yes" !! "nope" ;
say (6 ~~ any(@list)) ?? "yes" !! "nope" ;



my $thing = 17.23;
given $thing {
    when    Bool  { say "yes/no"    }
    when    Real  { say "number"    }
    default       { say $thing.WHAT }
}


my $n = 17;
given $n {
    when    $n < 10  { say "small"  }
    when    $n < 100 { say "medium" }
    default          { say "big"    }
}

my ($x, $y) = 12, 23;
given $x, $y {
    when $x <  $y  { say "smaller"  }
    when $x >  $y  { say "greater"  }
    when $x == $y  { say "same"  }
}
