import consumer from "./consumer"

consumer.subscriptions.create("SignalChannel", {
  connected() {
    console.log("connected to signal channel")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    alert(data);
    // Called when there's incoming data on the websocket for this channel
  },

  notice: function (data) {
    alert(data);
    return this.perform('notice');
  }
});
