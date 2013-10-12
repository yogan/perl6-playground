#!/usr/bin/env perl6
use v6;

sub MAIN(Int $pid, $msg?, Int :$signal = 1, Bool :$force) {
    if $force {
        say "I'll kill process $pid with signal $signal in furious rage!";
    } else {
        say "I'll gently kill process $pid with signal $signal.";
    }
    say "Goodbye message for the poor process shall be: $msg" if $msg;
}
