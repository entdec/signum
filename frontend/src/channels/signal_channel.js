import consumer from "./consumer"
import { alert } from "@pnotify/core"

import { defaultModules, Stack, defaultStack } from "@pnotify/core"
import * as PNotifyFontAwesome5Fix from "@pnotify/font-awesome5-fix"
import * as PNotifyFontAwesome5 from "@pnotify/font-awesome5"

defaultModules.set(PNotifyFontAwesome5Fix, {})
defaultModules.set(PNotifyFontAwesome5, {})

consumer.subscriptions.create(
  { channel: "Signum::SignalChannel" },
  {
    connected() {
      console.log("connected to signal channel")
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const self = this

      // https://github.com/sciactive/pnotify#options
      let options = {
        type: data["kind"],
        titleTrusted: true,
        text: data["text"],
        textTrusted: true,
        hide: true,
        stack: defaultStack,
        delay: 3000,
      }

      if (data["title"]) {
        options["title"] = data["title"]
      }

      defaultStack.context = document.body

      const myAlert = alert(options)
      myAlert.on("pnotify:afterOpen", () => {
        self.perform("show", { signal_id: data["id"] })
      })
      myAlert.on("pnotify:afterClose", (event) => {
        if (!event.detail.timerHide) {
          self.perform("close", { signal_id: data["id"] })
        }
      })
      myAlert.on("pnotify:confirm", () => {
        // User confirmed, continue here...
      })
      myAlert.on("pnotify:cancel", () => {
        // User canceled, continue here...
      })
    },
  }
)
