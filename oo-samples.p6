#!/usr/bin/env perl6
use v6;

class Point {
    has $.x = 0;
    has $.y = $!x;

    method to-string() { "[$!x/$!y]"; }
}

Point.new.to-string.say;         # [0/0]
Point.new(x => 9).to-string.say; # [9/9]

#$point.DUMP.say;


class Foo {
    has $.bar;
    method bar { $!bar * 10 }
    method use-attribute { say "bar is $!bar" }
    method use-accessor  { say "bar is $.bar" }
}

Foo.new(bar => 10).use-attribute;
Foo.new(bar => 10).use-accessor;




#----------- INHERITANCE -----------------


class Mother { method i-am { say "I am your mother"; } }
class Father { method i-am { say "I am your father"; } }
class Child is Father is Mother {}

Child.new.i-am;     # I am your father
Child.^mro.say;     # (Child) (Father) (Mother) (Any) (Mu)



class Dog {
    method !do-private { say "This is dog." }
    method do-public   { self!do-private }
}
class Pug is Dog {
    method access-dog-public  { self.do-public  }
    method access-dog-private { self!do-private }
}

Dog.new.do-public;              # ok

Pug.new.do-public;              # ok

Pug.new.access-dog-public;      # ok
#Pug.new.access-dog-private;    # NOPE



# ----------- ROLES -------------------

role Happy { method have-fun { say ":-)" } }
role Sad   { method frown    { say ":-/" } }

class Guy does Happy does Sad {
    method code-some-perl6    { self.have-fun }
    method do-powerpoint-pres { self.frown }
}

my $me = Guy.new;
$me.code-some-perl6;        # :-)
$me.do-powerpoint-pres;     # :-/
$me.have-fun;               # :-)



# ----------- STUBS -------------------

role AbstractSerializable { method serialize() { ... } }

# not allowed:
#class APoint does AbstractSerializable {
    #has $.x;
    #has $.y;
#}
# -> Method 'serialize' must be implemented by APoint…

# this works:
class SPoint does AbstractSerializable {
    has $.x;
    has $.y;
    method serialize() { "p($.x, $.y)" }
}

SPoint.new(x=>1,y=>2).serialize.say;
