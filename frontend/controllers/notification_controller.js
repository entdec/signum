import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { timeout: Number, sticky: Boolean }
  connect() {
    setTimeout(() => {
      this.element.classList.remove("hidden")
    }, 500)

    if (!this.stickyValue) {
      this.timeoutId = setTimeout(() => {
        this.close()
      }, this.timeoutValue * 1000 + 500)
    }
  }

  close() {
    setTimeout(() => {
      this.element.remove()
    }, 300)
  }
}
