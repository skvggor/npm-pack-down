#[macro_use] extern crate serde_derive;
extern crate serde;
// extern crate serde_json;

extern crate reqwest;

#[derive(Debug, Deserialize)]
struct Request {
  downloads: Vec<Downloads>
}

#[derive(Debug, Deserialize)]
struct Downloads {
    downloads: i64
}

fn main() {
    let start_date = "2018-04-08";
    let end_date = "2018-05-16";
    let package_name = "begynner";
    let url = format!("https://api.npmjs.org/downloads/range/{}:{}/{}", start_date, end_date, package_name);

    let mut request = reqwest::get(&url).unwrap();

    println!("{:?}", request.json::<Request>());
}
