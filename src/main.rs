use actix_web::{get, App, HttpServer, Responder, HttpResponse};
use actix_web::http::header::{ContentType};

#[get("/")]
async fn hello() -> impl Responder {
    println!("get request");
    let request_url = format!("http://192.168.178.36:8080/convert/html2image?u=doctron&p=lampnick&customClip=true&clipX=0&clipY=0&clipWidth=400&clipHeight=1500&clipScale=2&format=jpeg&Quality=80&url=https%3A%2F%2Fwww.stadtradeln.de%2Ffileadmin%2Fradelkalender%2Fembed%2Fradelmeter-team.php%3Fsr_team_id%3D83474%26L%3D2");
    let response = reqwest::get(&request_url).await.expect("error");
    HttpResponse::Ok().content_type(ContentType::jpeg()).body(response.bytes().await.expect("no bytes"))
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    println!("start on 8080");
    HttpServer::new(|| App::new()
        .service(hello)
    )
        .bind("0.0.0.0:8080")?
        .run()
        .await
}