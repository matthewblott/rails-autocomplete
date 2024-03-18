import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "search"]

  alert(message) {
    this.searchTarget.value = message
  }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.formTarget.requestSubmit()
    }, 500)
  }
}
