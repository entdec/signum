import ApplicationController from "../../../../frontend/controllers/application_controller"

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
      if (event) {
        this.markClose()
      }
    }, 300)
  }

  markClose() {
    fetch("/signal/close", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ id: this.signalIdValue }),
    })
      .then((res) => {
        const niE = new CustomEvent("nd-item-activity", {
          bubbles: true,
          detail: "closed",
        })
        window.dispatchEvent(niE)
      })
      .catch((err) => {
        console.log(err)
      })
  }
}
