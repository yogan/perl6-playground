#!/usr/bin/env perl6
use v6;

# to let rakudo find modules from lib/, call either with:
#   perl6 -Ilib FOO.p6
# or just use lib:
use lib './lib';

use LeStuff;

LeStuff::ding();
LeStuff::dong();

# this won't work, because dong_internal sub is not declared with "our":
#LeStuff::dong_internal();
