# A sample for perl-xs

A sample for https://github.com/vickenty/perl-xs/ .

## build

```
$ carton install
$ carton exec -- 'perl Makefile.PL && make'
$ carton exec -- 'perl -Mblib benchmarks/domain_public_suffix.pl'
      Rate  pp  rs
pp 78740/s  -- -9%
rs 86957/s 10%  --
```
