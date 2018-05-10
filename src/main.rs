#[macro_use]
extern crate nickel;

use nickel::Nickel;
use std::env;

fn main() {
    let mut server = Nickel::new();

    server.utilize(router! {
        get "**" => |_req, _res| {
            "Hello world!"
        }
    });

    fn get_server_port() -> u16 {
        env::var("PORT").unwrap_or("6767".to_string()).parse().unwrap()
    }

    server.listen(("0.0.0.0", get_server_port()));
}
