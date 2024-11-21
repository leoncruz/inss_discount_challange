import { Controller } from "@hotwired/stimulus"
import IMask from "imask"

// Connects to data-controller="input-mask"
export default class extends Controller {
  static targets = ["input"]

  static values = {
    type: String, 
    mask: String
  }

  masks = {
    "money": {
      mask: Number,
      scale: 2,
      thousandsSeparator: ".",
      padFractionalZeros: true,
      normalizeZeros: true,
      radix: ",",
      mapToRadix: ["."],
    },
  }

  connect() {
    if (this.hasMaskValue && !this.hasTypeValue) {
      this.mask = IMask(this.inputTarget, { mask: this.maskValue });
    } else {
      this.mask = IMask(this.inputTarget, this.masks[this.typeValue]);
    }
  }
}
