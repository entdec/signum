import ApplicationController from "signum/controllers/application_controller"
import { post } from '@rails/request.js';

export default class extends ApplicationController {
  static targets = []
  static values = {
    signalId: String,
    signalState: String,
  }

  connect() {
    const niE = new CustomEvent("nd-item-activity", {
      bubbles: true,
      detail: "added",
    })
    window.dispatchEvent(niE)
    if (this.signalStateValue == "broadcasted") {
      this.showSignal()
    }
  }

  async showSignal() {
    try {
      const response = await post("/signal/show", {
        body: JSON.stringify({ id: this.signalIdValue }),
        contentType: 'application/json'
      });
      if (response.ok) {
      } else {
        console.error('Error: ', response.statusText);
      }
    } catch (error) {
      console.error('Request failed', error);
    }
  }
}
