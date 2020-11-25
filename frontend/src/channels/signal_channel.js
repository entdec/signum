import consumer from "./consumer"
import { notice, defaults } from '@pnotify/core';

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
    let options = data;
    options['type'] = options['kind']
    defaults.styling = 'material'
    defaults.icons = 'material'
    const myAlert = notice(options)
  },

  notice: function (data) {
    console.log('notice', data);
    return this.perform('notice');
  }
});
