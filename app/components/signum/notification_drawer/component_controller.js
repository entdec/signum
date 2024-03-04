import ApplicationController from "../../../../frontend/controllers/application_controller"

export default class extends ApplicationController {
  static targets = ["alertbellicon", "bellicon", "submenu", "item"]

  connect() {
    this.bounditemActivity = this.itemActivity.bind(this)
    window.addEventListener("nd-item-activity", this.bounditemActivity)

    this.manageBellIcon()
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
  }

  manageBellIcon() {
    if (this.itemTargets.some((e) => e.classList.contains("font-bold"))) {
      this.alertbelliconTarget.classList.remove("hidden")
      this.belliconTarget.classList.add("hidden")
    } else {
      this.alertbelliconTarget.classList.add("hidden")
      this.belliconTarget.classList.remove("hidden")
    }
  }
}
