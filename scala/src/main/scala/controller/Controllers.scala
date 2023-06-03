package controller

import skinny._
import skinny.controller.AssetsController

object Controllers {

  def mount(ctx: ServletContext): Unit = {
    test.mount(ctx)
    help.mount(ctx)
    root.mount(ctx)
    AssetsController.mount(ctx)
  }

  object root extends RootController with Routes {
    val indexUrl = get("/?")(index).as("index")
  }

  object help extends _root_.controller.HelpController with Routes {
    val indexUrl = get("/help")(index).as("index")
  }

  object test extends _root_.controller.TestController with Routes {
    val indexUrl = get("/test")(index).as("index")
  }

}
