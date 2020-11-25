import { definitionsFromContext } from "stimulus/webpack-helpers"

import './channels';

export class Signum {
  static start(application) {

    this.application = application;
    const context = require.context("./controllers", true, /\.js$/);
    this.application.load(definitionsFromContext(context));
  }
}

