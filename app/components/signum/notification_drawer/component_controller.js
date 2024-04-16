import ApplicationController from "signum/controllers/application_controller"

export default class extends ApplicationController {
  static targets = ["alertBellIcon", "bellIcon", "submenu", "item", "crossIcon"]

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
      this.crossIconTarget.classList.remove("hidden")
    } else {
      this.submenuTarget.classList.add("hidden")
    }
  }

  hide(event) {
    this.submenuTarget.classList.add("hidden")
    this.crossIconTarget.classList.add("hidden")
    if (this.submenuTarget.children.length < 0) {
      this.alertBellIconTarget.classList.add("hidden")
    }
  }

  closeNotifications(event) {
    fetch("/signal/close_all", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({}),
    })
      .then((res) => {
        setTimeout(() => {
          this.manageBellIcon()
        }, 300)
      })
      .catch((err) => {
        console.log(err)
      })
  }

  itemActivity(event) {
    this.manageBellIcon()

    if (this.submenuTarget.children.length == 0) {
      this.hide(event)
    }
  }

  manageBellIcon() {
    if (this.submenuTarget.children.length > 0) {
      this.alertBellIconTarget.classList.remove("hidden")
      this.bellIconTarget.classList.add("hidden")
    } else {
      this.alertBellIconTarget.classList.add("hidden")
      this.bellIconTarget.classList.remove("hidden")
      this.crossIconTarget.classList.add("hidden")
    }
  }
}
