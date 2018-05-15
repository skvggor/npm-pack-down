#[macro_use] extern crate futures;
#[macro_use] extern crate hyper;
#[macro_use]extern crate tokio_core;
#[macro_use] extern crate nickel;

use std::env;
use std::collections::HashMap;

use futures::{Future};
use hyper::{Client, Uri};
use tokio_core::reactor::Core;

use nickel::{Nickel, StaticFilesHandler, HttpRouter};
// use nickel::extensions::{Referer, Redirect};

fn get_server_port() -> u16 {
    env::var("PORT").unwrap_or("6767".to_string()).parse().unwrap()
}

fn main() {
    let mut server = Nickel::new();
    let mut router = Nickel::router();

    let mut core = Core::new().unwrap();
    let client = Client::new(&core.handle());

    let url : Uri = "http://httpbin.org/ip".parse().unwrap();

    let request = client.get(url)
        .map(|res| {
            return res.body();
    });

    core.run(request).unwrap();

    router.get("/", middleware! { |_, response|
        let mut data = HashMap::new();
        data.insert("response", "Teste");
        return response.render("views/index.tpl", &data);
    });

    // res.body().for_each(|chunk| {
    //     assert_eq!(res.status(), hyper::Ok);
    // });

    server.utilize(StaticFilesHandler::new("assets"));
    server.utilize(StaticFilesHandler::new("views"));
    server.utilize(router);

    server.listen(("0.0.0.0", get_server_port()));
}
