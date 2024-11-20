import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hidden-field"
export default class extends Controller {
  static targets = ["hidden", "trigger"]

  connect() {
    if (this.triggerTarget.checked)
      this.display()
  }

  display() {
    this.hiddenTarget.classList.toggle("d-none")
  }
}
