import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    const timeoutSeconds = parseInt(this.data.get("timeout"))

    setTimeout(() => {
      this.element.classList.remove("hidden")
    }, 500)

    this.timeoutId = setTimeout(() => {
      this.close()
    }, timeoutSeconds * 1000 + 500)
  }

  close() {
    setTimeout(() => {
      this.element.remove()
    }, 300)
  }
}
