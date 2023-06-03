package controller

import org.scalatest.funspec.AnyFunSpec
import org.scalatest.matchers.should.Matchers
import skinny._
import skinny.test._
import org.joda.time._

// NOTICE before/after filters won't be executed by default
class HelpControllerSpec extends AnyFunSpec with Matchers with DBSettings {

  def createMockController = new HelpController with MockController

  describe("HelpController") {

    it("shows index page") {
      val controller = createMockController
      controller.index
      controller.status should equal(200)
      controller.renderCall.map(_.path) should equal(Some("/help/index"))
      controller.contentType should equal("text/html; charset=utf-8")
    }

  }

}
