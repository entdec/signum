import consumer from "./consumer"
import { alert } from '@pnotify/core';

import { defaultModules, Stack, defaultStack } from '@pnotify/core';
import * as PNotifyFontAwesome5Fix from '@pnotify/font-awesome5-fix';
import * as PNotifyFontAwesome5 from '@pnotify/font-awesome5';

defaultModules.set(PNotifyFontAwesome5Fix, {});
defaultModules.set(PNotifyFontAwesome5, {});

consumer.subscriptions.create({channel: "Signum::SignalChannel"},{
  connected() {
    console.log("connected to signal channel")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log('received', data);

defaultStack

    defaultStack.context = document.body;
    const myAlert = alert({
      type:  data['kind'],
      title: data['title'],
      titleTrusted: true,
      text: data['text'],
      textTrusted: true,
      hide: false,
      stack: defaultStack
      // modules: {
      //   Confirm: {
      //     confirm: true
      //   }
      // }
    });
    myAlert.on('pnotify:afterClose', () => {
    });
    myAlert.on('pnotify:confirm', () => {
      // User confirmed, continue here...
    });
    myAlert.on('pnotify:cancel', () => {
      // User canceled, continue here...
    });

  },

  notice: function (data) {
    console.log('notice', data);
    return this.perform('notice');
  }
});
