package controller

import _root_.controller._
import skinny._
import skinny.validator._

class TestController extends ApplicationController {
  protectFromForgery()

  def index = render("/test/index")

}
