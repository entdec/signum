import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"
import { Application } from "@hotwired/stimulus"

class Signum {
  static start(application) {
    if (!application) {
      application = Application.start()
    }

    this.application = application

    console.log("Signum")

    // Setup all controllers
    Signum.setupControllers()
  }

  // Setup all controllers
  static setupControllers() {
    const regularControllers = require.context("./controllers", true, /\.js$/)
    const componentControllers = require.context("../app/components/", true, /component_controller\.js$/)

    regularControllers
      .keys()
      .map((key) => {
        const [_, name] = /([a-z\_]+)_controller\.js$/.exec(key)
        return [name, regularControllers(key).default]
      })
      .filter(([name, controller]) => {
        return name != "application"
      })
      .forEach(([name, controller]) => {
        let identifier = `signum-${name.replace(/_/g, "-")}`
        this.application.register(identifier, controller)
      })

    componentControllers
      .keys()
      .map((key) => {
        // Take the last part (before component_controller) of the path as the name
        const [_, name] = /([^/]+)\/component_controller\.js$/.exec(key)
        return [name, componentControllers(key).default]
      })
      .forEach(([name, controller]) => {
        let identifier = `signum-${name.replace(/_/g, "-")}`
        this.application.register(identifier, controller)
      })

    this.application.load(
      definitionsFromContext(regularControllers).concat(definitionsFromContext(componentControllers))
    )
  }
}

export { Signum }
