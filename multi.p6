#!/usr/bin/env perl6
use v6;


class Human	           { has $.name }
class CodeMonkey  is Human {}
class BusinessGuy is Human {}

multi sub greet(Human       $h) { say "Hello {$h.name}." }
multi sub greet(CodeMonkey  $h) { say "Hey {$h.name}, sup dude?" }
multi sub greet(BusinessGuy $h) { say "Delighted to meet you, {$h.name}." }

my $john = CodeMonkey.new(name => "John Johnson");
my $jack = BusinessGuy.new(name => "Jack Jackson");
greet $john;
greet $jack;


say "---------------";


multi sub mysign(Int $x where $x == 0) {  0 }
multi sub mysign(Int $x where $x <  0) { -1 }
multi sub mysign(Int $x)               { +1 }

for -2, 0, 2 { say mysign($_) }


say "---------------";


class Account { has Int $.money is rw }

multi sub dump(Account $account) { say "EUR ", $account.money; }

multi sub dump(Account $account where $account.money < 0) {
    say "BANKRUPT!";
}


my $acc = Account.new(money => 10);
dump($acc);

$acc.money = -20;
dump($acc);
