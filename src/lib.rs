#[macro_use]
extern crate perl_xs;
#[macro_use]
extern crate perl_sys;

mod fib {
    use perl_xs::IV;

    xs! {
    package Sum::RS;

    sub sum(ctx, a: IV, b: IV) {
        a + b
    }
    }
}

xs! {
    bootstrap boot_Sum__RS;
    use fib;
}
