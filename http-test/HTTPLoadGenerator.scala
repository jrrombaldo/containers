import scala.concurrent.duration._

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import io.gatling.jdbc.Predef._

class HTTPLoadGenerator  extends Simulation {

    val TARGET = System.getenv("TARGET")
    val DURATION = System.getenv("DURATION")
    val CONTEXT_PATH = System.getenv("CONTEXT_PATH")
    val REQ_SEC = System.getenv("REQ_SEC")

    val UA = System.getenv("HEADER_UA")
    val ACCEPT = System.getenv("HEADER_ENC")
    val ENC = System.getenv("HEADER_ENC")
    val LANG = System.getenv("HEADER_LANG")
    




    val target = System.getProperty("TARGET")

    val httpProtocol = http
        .baseUrl(TARGET)
        //.inferHtmlResources() // not loading resoruces atm
        .acceptHeader(ACCEPT)
        .acceptEncodingHeader(ENC)
        .acceptLanguageHeader(LANG)
        .doNotTrackHeader("1")
        .userAgentHeader(UA)

    val headers_0 = Map(
        "Pragma" -> "no-cache",
        "Upgrade-Insecure-Requests" -> "1")

    val scn = scenario("HTTPLoadGenerator")
        .exec(
            http("request_0").get(CONTEXT_PATH).headers(headers_0)
        )

    setUp(
        scn.inject(
            constantUsersPerSec(10) during (1 minutes)
        ).protocols(httpProtocol)
    )
}