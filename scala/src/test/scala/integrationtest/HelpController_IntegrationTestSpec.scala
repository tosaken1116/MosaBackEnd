package integrationtest

import org.scalatest._
import skinny._
import skinny.test._
import org.joda.time._
import _root_.controller.Controllers

class HelpController_IntegrationTestSpec extends SkinnyFlatSpec with SkinnyTestSupport {
  addFilter(Controllers.help, "/*")

  it should "show index page" in {
    get("/help") {
      logBodyUnless(200)
      status should equal(200)
    }
  }

}
