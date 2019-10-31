# A sample for perl-xs

A sample for https://github.com/vickenty/perl-xs/ .

## build

```
$ carton install
$ carton exec -- 'perl Makefile.PL && make'
$ carton exec -- 'perl -Mblib benchmarks/fib.pl'
            (warning: too few iterations for a reliable count)
     Rate     pp     rs
pp 3.74/s     --   -99%
rs  500/s 13260%     --
```
