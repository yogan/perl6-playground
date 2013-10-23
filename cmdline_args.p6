#!/usr/bin/env perl6
use v6;

#sub MAIN(Int $pid, $msg?, Int :$signal = 1, Bool :$force) {
    #if $force {
        #say "I'll kill process $pid with signal $signal in furious rage!";
    #} else {
        #say "I'll gently kill process $pid with signal $signal.";
    #}
    #say "Goodbye message for the poor process shall be: $msg" if $msg;
#}

multi sub MAIN('add',  Real $x, Real $y) { say "$x + $y = {$x + $y}" }
multi sub MAIN('sub',  Real $x, Real $y) { say "$x - $y = {$x - $y}" }
multi sub MAIN('mult', Real $x, Real $y) { say "$x * $y = {$x * $y}" }
multi sub MAIN('div',  Real $x, Real $y where $y != 0)
    { say "$x / $y = {$x / $y}" }
