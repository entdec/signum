import ApplicationController from "../../../../frontend/controllers/application_controller"

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

  markRead(event) {
    if (this.element.classList.contains("font-bold")) {
      this.element.classList.remove("font-bold")

      fetch("/signal/read", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ id: this.signalIdValue }),
      })
        .then((res) => {
          const niE = new CustomEvent("nd-item-activity", {
            bubbles: true,
            detail: "clicked",
          })
          window.dispatchEvent(niE)
        })
        .catch((err) => {
          console.log(err)
          this.element.classList.add("font-bold")
        })
    }
  }
}
