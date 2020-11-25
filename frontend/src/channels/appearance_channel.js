// app/javascript/channels/appearance_channel.js
import consumer from "./consumer"

consumer.subscriptions.create({channel: "Signum::AppearanceChannel"}, {
  // Called once when the subscription is created.
  initialized() {
    this.update = this.update.bind(this)
  },

  // Called when the subscription is ready for use on the server.
  connected() {
    this.install()
    this.update()
  },

  // Called when the WebSocket connection is closed.
  disconnected() {
    this.uninstall()
  },

  // Called when the subscription is rejected by the server.
  rejected() {
    this.uninstall()
  },

  update() {
    if(!document.hidden && document.hasFocus()) {
      this.appear()
    } else {
      this.away()
    }
  },

  appear() {
    // Calls `AppearanceChannel#appear(data)` on the server.
    this.perform("appear", { appearing_on: this.appearingOn })
  },

  away() {
    // Calls `AppearanceChannel#away` on the server.
    this.perform("away")
  },

  install() {
    window.addEventListener("focus", this.update)
    document.addEventListener("blur", this.update)
    document.addEventListener("turbolinks:load", this.update)


    document.addEventListener("visibilitychange", this.update)
  },

  uninstall() {
    window.removeEventListener("focus", this.update)
    document.removeEventListener("blur", this.update)
    document.removeEventListener("turbolinks:load", this.update)

    document.removeEventListener("visibilitychange", this.update)
  },

  get appearingOn() {
    const element = document.querySelector("[data-appearing-on]")
    return element ? element.getAttribute("data-appearing-on") : null
  }
})
