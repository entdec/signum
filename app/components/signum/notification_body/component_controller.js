import ApplicationController from "signum/controllers/application_controller"
import { post } from '@rails/request.js';

export default class extends ApplicationController {
  static values = { type: String, timeout: Number, sticky: Boolean, signalId: String, signalState: String }
  connect() {
    if (this.typeValue == "balloon" && !this.stickyValue) {
      this.timeoutId = setTimeout(() => {
        this.close()
      }, this.timeoutValue * 1000 + 500)
    }
  }

  close(event) {
    setTimeout(() => {
      this.element?.parentElement?.remove()
      if (event && this.typeValue != "balloon") {
        this.markClose()
      }
    }, 300)
  }

  async markClose() {
    try {
      const response = await post('/signal/close', {
        body: JSON.stringify({ id: this.signalIdValue }),
        contentType: 'application/json'
      });
      if (response.ok) {
        const niE = new CustomEvent("nd-item-activity", {
          bubbles: true,
          detail: "closed",
        });
        window.dispatchEvent(niE);
      } else {
        console.error('Error: ', response.statusText);
      }
    } catch (error) {
      console.error('Request failed', error);
    }
  }
}
