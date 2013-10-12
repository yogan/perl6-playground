#!/usr/bin/env perl6
use v6;

#sub perl5_style_param_checking {
#    my $arg = shift;
#    die "Argument is undefined" unless defined $arg;
#    say "Perl 5 is happy at run-time.";
#}

sub perl6_param_adverbs(Any:D $p) {
    say "Perl 6 is happy at compile-time! :D";
}
my $foo;
#perl6_param_adverbs($foo);  # ERROR: param requires an instance
$foo = 5;
perl6_param_adverbs($foo);
