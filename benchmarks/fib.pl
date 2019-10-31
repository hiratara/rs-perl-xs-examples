use strict;
use warnings;
use Benchmark qw(cmpthese);
use Fib::RS;

sub fib {
    return 1 if $_[0] <= 2;
    fib($_[0] - 1) + fib($_[0] - 2);
}

# test
for (
    [1, 1],
    [2, 1],
    [3, 2],
    [4, 3],
    [10, 55],
    [31, 1346269],
) {
    my ($input, $output) = @$_;
    fib($input) == $output or die "pp failed $input";
    Fib::RS::fib($input) == $output or die "rs failed $input";
}

cmpthese 100 => {
    pp => sub {
        fib(30);
    },
    rs => sub {
        Fib::RS::fib(30);
    },
};
