import ApplicationController from "signum/controllers/application_controller"

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
      fetch("/signal/show", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ id: this.signalIdValue }),
      })
        .then((res) => {})
        .catch((err) => {
          console.log(err)
        })
    }
  }
}
