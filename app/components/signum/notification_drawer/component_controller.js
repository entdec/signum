import ApplicationController from "signum/controllers/application_controller"

export default class extends ApplicationController {

  static targets = ["alertbellicon", "bellicon", "submenu", "clearAll", "item", "crossicon"]

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
      if (event.altKey) {
        this.crossiconTarget.style.display = 'inline-block'
      } else {
        this.crossiconTarget.style.display = 'none'
      }
    } else {
      this.submenuTarget.classList.add("hidden")
    }
  }

  hide(event) {
    this.submenuTarget.classList.add("hidden")
    this.crossiconTarget.style.display = 'none'
    if (this.submenuTarget.children.length < 0) {
      this.alertbelliconTarget.classList.add("hidden")
    }
    if (event.altKey) {
      this.crossiconTarget.style.display = 'none'
    }
  }

  updateClearAllVisibility(event) {
    const hasNotifications = this.submenuTarget.querySelectorAll('.notification-item').length > 0;
    this.clearAllTarget.classList.toggle('hidden', !hasNotifications);
  }

  closeNotifications(event) {
      fetch("/signal/close_all", {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      })
        .then((res) => {})
        .catch((err) => {
          console.log(err)
        })
      this.crossiconTarget.style.display = 'none';
      this.belliconTarget.style.display = 'inline-block'
      this.alertbelliconTarget.style.display = 'none';
      this.updateClearAllVisibility();
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
