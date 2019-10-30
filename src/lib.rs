#[macro_use]
extern crate perl_xs;
#[macro_use]
extern crate perl_sys;

mod hello {
    use perl_xs::SV;
    xs! {
    package PerlXSTest::Hello;

    sub hello(ctx, name: SV) {
        println!("Hello, {} !", name.to_string().unwrap());
    }
    }
}

xs! {
    bootstrap boot_PerlXSTest;
    use hello;
}
