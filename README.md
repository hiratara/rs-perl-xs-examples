# A sample for perl-xs

A sample for https://github.com/vickenty/perl-xs/ .

## build

```
$ carton install
$ carton exec -- 'perl Makefile.pl && make'
$ carton exec -- 'perl -Mblib -MPerlXSTest -E "PerlXSTest::Hello::hello(\"perl\")"'
Hello, perl !
```
