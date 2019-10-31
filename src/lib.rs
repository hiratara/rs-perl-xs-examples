#[macro_use]
extern crate perl_xs;
#[macro_use]
extern crate perl_sys;

mod fib {
    use perl_xs::IV;

    fn fib_(n: i32) -> i32 {
        if n <= 2 {
            1
        } else {
            fib_(n - 1) + fib_(n - 2)
        }
    }

    xs! {
    package Fib::RS;

    sub fib(ctx, n: IV) {
        fib_(n as i32) as IV
    }
    }
}

xs! {
    bootstrap boot_Fib__RS;
    use fib;
}
