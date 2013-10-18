use v6;
use Test;

use TDDFactorial;

my @inputsWithExpectedResults =
    0,   1,
    1,   1,
    2,   2,
    3,   6,
    4,   24,
    5,   120,
    10,  3628800,
;

# calculate number of testcases (it's annoying, but Test needs this)
#plan @inputsWithExpectedResults.elems / 2;

for @inputsWithExpectedResults -> $input, $expected {
    is TDDFactorial::fac($input), $expected, "fac($input) is $expected";
}

# this seems to make plan $numberOfTests unnecessary:
done();
