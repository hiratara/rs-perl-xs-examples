use inc::Module::Install;

name "Fib-RS";
version "0.01";
abstract "Tests for perl-xs";

configure_requires "Module::Install::Rust" => 0;
requires "XSLoader" => 0;

rust_use_perl_xs { git => "https://github.com/vickenty/perl-xs" };

rust_requires "perl-sys" => { git => "https://github.com/vickenty/perl-sys" };
rust_requires "perlxs_derive" => { git => "https://github.com/vickenty/perl-xs" };
rust_write;

WriteAll;
