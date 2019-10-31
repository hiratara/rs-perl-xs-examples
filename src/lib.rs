#[macro_use]
extern crate perl_xs;
#[macro_use]
extern crate perl_sys;

extern crate publicsuffix;

mod hello {

    use perl_xs::DataRef;
    use publicsuffix::List;
    use std::cell::RefCell;

    xs! {
    package Domain::PublicSuffix::RS;


    sub new(ctx, class: String, path: String) {
        let list = List::from_path(&path).expect("load path faild");
        ctx.new_sv_with_data(RefCell::new(list)).bless(&class)
    }

    sub get_root_domain (ctx, this: DataRef<RefCell<List>>, domain_string: String) {
    let list = this.borrow();
        let domain = list.parse_domain(&domain_string).unwrap();
    domain.root().unwrap().to_owned()
    }
    }
}

xs! {
    bootstrap boot_Domain__PublicSuffix__RS;
    use hello;
}
