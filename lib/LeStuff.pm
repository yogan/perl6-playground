use v6;

module LeStuff;

# "public" subs:
our sub ding() { say "ding"; }
our sub dong() { dong_internal(); }

# not callable from outside:
sub dong_internal() { say "dong"; }
