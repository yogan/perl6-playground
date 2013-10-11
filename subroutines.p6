#!/usr/bin/env perl6
use v6;

# to let rakudo find modules from lib/, call either with:
#   perl6 -Ilib FOO.p6
# or just use lib:
use lib './lib';

use LeStuff;

LeStuff::ding();
LeStuff::dong();


sub do_things() { say "I'll do things."; }

do_things();
