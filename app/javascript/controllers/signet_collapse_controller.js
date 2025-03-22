import { Controller } from "@hotwired/stimulus"
import { patch } from "@rails/request.js"

// Connects to data-controller="signet-collapse"
export default class extends Controller {
  static values = {
    toggleUrl: String
  }
  
  connect() {
  }

  toggle(event) {
    if (this.element.classList.contains("collapse-open")) {
      this.element.classList.replace("collapse-open", "collapse-close")
    } else {
      this.element.classList.replace("collapse-close", "collapse-open")
    }
    patch(this.toggleUrlValue);
  }
}
