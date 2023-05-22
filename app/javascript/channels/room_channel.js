import consumer from "channels/consumer"

const appRoom = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // return alert(data["message"]);
    const messages = document.getElementById("messages");
    messages.insertAdjacentHTML('beforeend', data['message']);
  },

  speak: function(message) {
    return this.perform('speak', { message: message});
  }
});

window.document.onkeydown = (event) => {
  if(event.key == "Enter") {
    appRoom.speak(event.target.value);
    event.target.value = "";
    event.preventDefault();
  }
};
