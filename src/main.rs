use actix_web::{get, App, HttpServer, Responder, HttpResponse};

#[get("/")]
async fn hello() -> impl Responder {
    println!("get request");
    let request_url = format!("http://192.168.178.36:8080/convert/html2image?u=doctron&p=lampnick&format=jpeg&Quality=80&url=https%3A%2F%2Fwww.stadtradeln.de%2Ffileadmin%2Fradelkalender%2Fembed%2Fradelmeter-team.php%3Fsr_team_id%3D83474%26L%3D2");
    let response = reqwest::get(&request_url).await.expect("error");
    HttpResponse::Ok().body(response.bytes().await.expect("as"))
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    println!("start on 8080");
    HttpServer::new(|| App::new()
        .service(hello)
    )
        .bind(("127.0.0.1", 8080))?
        .run()
        .await
}