# A sample for perl-xs

A sample for https://github.com/vickenty/perl-xs/ .

## build

```
$ carton install
$ carton exec -- 'perl Makefile.PL && make'
$ carton exec -- 'perl -Mblib benchmarks/sum.pl'
         Rate   rs   pp
rs  7462687/s   -- -49%
pp 14705882/s  97%   --
```
