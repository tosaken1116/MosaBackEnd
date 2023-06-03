package controller

import _root_.controller._
import skinny._
import skinny.validator._

class HelpController extends ApplicationController {
  protectFromForgery()

  def index = render("/help/index")

}
