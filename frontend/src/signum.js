import { definitionsFromContext } from "stimulus/webpack-helpers"

import './channels';

import '@pnotify/core/dist/PNotify.css';
import '@pnotify/mobile/dist/PNotifyMobile.css';
import '@pnotify/core/dist/Material.css';

export class Signum {
  static start(application) {

    this.application = application;
    const context = require.context("./controllers", true, /\.js$/);
    this.application.load(definitionsFromContext(context));
  }
}

