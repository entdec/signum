import ApplicationController from "signum/controllers/application_controller"

export default class extends ApplicationController {

  static targets = ["alertbellicon", "bellicon", "submenu", "item", "crossicon"]

  connect() {
    this.bounditemActivity = this.itemActivity.bind(this)
    window.addEventListener("nd-item-activity", this.bounditemActivity)

    this.drawerButtonHoverIn = () => this.showCrossIcon();
    this.drawerButtonHoverOut = () => this.hideCrossIcon();

    this.findDrawerButton().addEventListener("mouseover", this.drawerButtonHoverIn);
    this.findDrawerButton().addEventListener("mouseleave", this.drawerButtonHoverOut)

    setTimeout(() => {
      this.manageBellIcon()
    }, 300)
  }

  disconnect() {
    window.removeEventListener("nd-item-activity", this.bounditemActivity)


    const button = this.findDrawerButton();
    if (button) {
      button.removeEventListener("mouseover", this.drawerButtonHoverIn);
      button.removeEventListener("mouseleave", this.drawerButtonHoverOut);
    }
  }

  findDrawerButton() {
    return this.element.querySelector('.signum-notification-drawer-button');
  }

  show(event) {
    if (this.submenuTarget.children.length > 0) {
      this.submenuTarget.classList.remove("hidden")
    } else {
      this.submenuTarget.classList.add("hidden")
    }
  }

  showCrossIcon() {
    this.crossiconTarget.classList.remove("hidden");
  }

  hideCrossIcon() {
    this.crossiconTarget.classList.add("hidden");
  }

  hide(event) {
    this.submenuTarget.classList.add("hidden")
    if (this.submenuTarget.children.length < 0) {
      this.alertbelliconTarget.classList.add("hidden")
    }
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
      this.belliconTarget.style.display = 'inline-block'
      this.alertbelliconTarget.style.display = 'none';
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
