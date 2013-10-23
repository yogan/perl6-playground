#!/usr/bin/env perl6
use v6;
#no strict;
#no warnings;

#my $this = "0";
#my $that = "1";
#say "$this is EQ $that" if $this eq $that;
#say "$this is == $that" if $this == $that;
#say "$this is not EQ $that" unless $this eq $that;
#say "$this is not == $that" unless $this == $that;

#$_ = "Some nice text";
#say "The text is BAD!" if /BAD/;
#s/nice/BAD/;
#say "The text is BAD after substitution!" if /BAD/;

#say "#$_" for 1..10;

#for (1..3) {
#    say $_;
#}

#my $line_count = 0;
#for ($*IN.lines) -> $line {
    #$line_count++;
    #say "$line_count: ", flip $line;
#}


#my @arr = "str1",
           #23,
           #[1, 2, 3],
           #"str2"
          #;
#@arr.push(42);
#@arr[1] = 232323;
#@arr[2][1] = "Zwei";
#say @arr.perl;
#say;

#my @emptyarr = ();
#say @emptyarr.perl;
#say @emptyarr.WHAT;
#say "Lenght: {@emptyarr.elems}";
#say;

#my @whatisthis = [];
#say @whatisthis.perl;
#say @whatisthis.WHAT;
#say "Lenght: {@whatisthis.elems}";
#say @whatisthis[0].perl;
#say @whatisthis[0].WHAT;
#say "Lenght: {@whatisthis[0].elems}";
#say;

#my @otherwat = < >;
#say @otherwat.perl;
#say @otherwat.WHAT;
#say "Lenght: {@otherwat.elems}";
#say

#my @anew = Array.new;
#say @anew.perl;
#say @anew.WHAT;
#say "Lenght: {@anew.elems}";


my @foo = split(" ", capitalize("hello world"));
@foo.perl.say;
say split(" ", capitalize("hello world"))[1];


my @untypedArray;
@untypedArray.push(23).push("foo").push([1, 2]);
@untypedArray.perl.say;

#my Int @intArray;
#@intArray.push(23).push("foo");
#@intArray.perl.say;

#my Array of Int @positiveArray where > 0;
#@positiveArray.push(23).push(-1);

sub add(Real $x, Real $y) { $x + $y };
add(1, 2.75).say;

sub div(Real $x, Real $y where $y != 0) { $x / $y };
div(1, 2).say;
#div(1, 0).say;

sub inc(Int $x) { $x + 1 };
inc(9).say;
#inc("nine").say;


#1..10».inc.perl.say;
 


my $i = Int;
say $i.WHAT;        # (Int)
say $i.defined;     # False
say $i;             # (Int)

$i .= new;          # same as  $i = $i.new  or  $i = Int.new
say $i.WHAT;        # (Int)
say $i.defined;     # True
say $i;             # 0




my &code = { say "Ohai." };
say &code.WHAT;
&code();

&code = sub ($name) { say "Ohai {$name}." };
say &code.WHAT;
&code("Alice");

&code = -> $name { say "Ohai {$name}." };
say &code.WHAT;
&code("Bob");



# tail recursion

multi sub printlist(&op) {}
multi sub printlist(&op, *$elem, *@rest-of-list) {
    &op($elem);
    printlist(&op, |@rest-of-list);
}

my @list   = 1..10;
my &say-op = -> $a { say "[$a]" };
printlist(&say-op, |@list);         # flatten is important, otherwise $elem
                                    # will catch the whole Array object

multi sub sum ()         returns Int { 0              }
multi sub sum ($x, *@xs) returns Int { $x + sum(|@xs) }
say sum(@list);





my %complicatedObj = Hash.new;
%complicatedObj{'string'}      = "this is foo";
%complicatedObj{'list'}        = [4, 5, 6];
%complicatedObj{'parcel'}      = 4, 5, 6;    # think of "not yet built list"
%complicatedObj{'range'}       = 10..15;
%complicatedObj{'inner hash'}  = x => 1.1, y => 2.5;

%complicatedObj.perl.say;
%complicatedObj.DUMP.say;
