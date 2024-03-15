import ApplicationController from "signum/controllers/application_controller"

export default class extends ApplicationController {
  static targets = ["alertbellicon", "bellicon", "submenu", "item"]

  connect() {
    this.bounditemActivity = this.itemActivity.bind(this)
    window.addEventListener("nd-item-activity", this.bounditemActivity)

    setTimeout(() => {
      this.manageBellIcon()
    }, 300)
  }

  disconnect() {
    window.removeEventListener("nd-item-activity", this.bounditemActivity)
  }

  show(event) {
    if (this.submenuTarget.children.length > 0) {
      this.submenuTarget.classList.remove("hidden")
    } else {
      this.submenuTarget.classList.add("hidden")
    }
  }

  hide(event) {
    this.submenuTarget.classList.add("hidden")
  }

  itemActivity(event) {
    this.manageBellIcon()

    if (this.submenuTarget.children.length == 0) {
      this.hide(event)
    }
  }

  manageBellIcon() {
    if (this.submenuTarget.children.length > 0) {
      this.alertbelliconTarget.classList.remove("hidden")
      this.belliconTarget.classList.add("hidden")
    } else {
      this.alertbelliconTarget.classList.add("hidden")
      this.belliconTarget.classList.remove("hidden")
    }
  }
}
