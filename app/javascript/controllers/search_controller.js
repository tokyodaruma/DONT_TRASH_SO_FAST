import { Controller } from "@hotwired/stimulus"

import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Search for leftovers",
                "Search by local cafes",
                "Search to prevent food waste",
                "Type in your current location and get searching ->"],
      startDelay: 5,
      typeSpeed: 5,
      loop: false
    });
  }
}
