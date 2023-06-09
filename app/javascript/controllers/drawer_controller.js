import { Controller } from "@hotwired/stimulus";
import "flowbite";


export default class extends Controller {
  static values = {
    placement: { type: String, default: "right" }
  }

  connect() {
    const options = {
      placement: this.placementValue
    };
    this.drawer = new Drawer(this.element, options);
    this.drawer.show();
  }

  close() {
    this.drawer.hide();
  }

  disconnect() {
    this.drawer.hide();
  }
}
