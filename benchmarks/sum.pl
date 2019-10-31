use strict;
use warnings;
use Benchmark qw(cmpthese);
use Sum::RS;

sub sum {
    $_[0] + $_[1];
}

# test
for (
    [[1, 1], 2],
    [[20, 30], 50],
) {
    my ($input, $output) = @$_;
    sum(@$input) == $output or die "pp failed $input";
    Sum::RS::sum(@$input) == $output or die "rs failed $input";
}

cmpthese 10_000_000 => {
    pp => sub {
        sum(12, 45);
    },
    rs => sub {
        Sum::RS::sum(12, 45);
    },
};
