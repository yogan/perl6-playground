#!/usr/bin/env perl6
use v6;

class PointPositionalArgs {
    has $.x;
    has $.y;
    method new($x, $y) {
        #self.bless(*, :$x, :$y);   # deprecated!
        self.bless(:$x, :$y);
    }
}

say PointPositionalArgs.new(1, 2);
#say Point.new(:y(1), :x(2));       # NOPE!


class PointNamedArgs {
    has $.x;
    has $.y;
}

say PointNamedArgs.new(:y(2), :x(1));


class PointPositionalAndNamedArgs {
    has $.x;
    has $.y;
    multi method new($x, $y) {
        self.bless(:$x, :$y);
    }
    multi method new(:$x, :$y) {
        self.bless(:$x, :$y);
    }
}

say PointPositionalAndNamedArgs.new(1, 2);
say PointPositionalAndNamedArgs.new(:y(2), :x(1));
