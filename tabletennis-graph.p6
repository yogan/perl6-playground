#!/usr/bin/env perl6
use v6;

my @scores = 'Ana' => 8, 'Dave' => 6, 'Charlie' => 4, 'Beth' => 4;

my $screen_width     = 48;

my $label_area_width = 1 + [max] @scores».key».chars;
my $max_score        =     [max] @scores».value;
my $unit             = ($screen_width - $label_area_width) / $max_score;
my $format           = '%- ' ~ $label_area_width ~ "s(%d) %s\n";

for @scores {
    printf $format, .key, .value, '#' x ($unit * .value);
}
