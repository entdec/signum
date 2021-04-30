// import { definitionsFromContext } from "stimulus/webpack-helpers"

import "./channels"

import "@pnotify/core/dist/PNotify.css"
import "@pnotify/core/dist/BrightTheme.css"

export class Signum {
  static start(application) {
    console.log("Signum")
    // this.application = application;
    // const context = require.context("./controllers", true, /\.js$/);
    // this.application.load(definitionsFromContext(context));
  }
}
