import { Controller } from "stimulus"

export default class extends Controller {
  static targets = []
  static values = {
    signalId: String,
  }

  connect() {
    const niE = new CustomEvent("nd-item-activity", {
      bubbles: true,
      detail: "added",
    })
    window.dispatchEvent(niE)

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

  markRead(event) {
    if (this.element.classList.contains("font-bold")) {
      this.element.classList.remove("font-bold")

      fetch("/signal/close", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ id: this.signalIdValue }),
      })
        .then((res) => {
          //console.log(res)
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
