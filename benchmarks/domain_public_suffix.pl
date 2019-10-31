use strict;
use warnings;
use Benchmark qw(cmpthese);
use Domain::PublicSuffix;
use Domain::PublicSuffix::RS;

my $pp = Domain::PublicSuffix->new({
  'data_file' => '/tmp/effective_tld_names.dat'
});

my $rs = Domain::PublicSuffix::RS->new(
    '/tmp/effective_tld_names.dat'
);

# test
for (
    ['www.nic-nagoya.or.jp', 'nic-nagoya.or.jp'],
    ['www.welcome.city.yokohama.jp', 'city.yokohama.jp'],
    ['www.welcome.town.yokohama.jp', 'welcome.town.yokohama.jp'],
) {
    my ($input, $output) = @$_;
    $pp->get_root_domain($input) eq $output or die "pp failed $input";
    $rs->get_root_domain($input) eq $output or die "rs failed $input";
}

cmpthese 100_000 => {
    pp => sub {
        $pp->get_root_domain('www.dan.co.jp');
    },
    rs => sub {
        $rs->get_root_domain('www.dan.co.jp');
    },
};
