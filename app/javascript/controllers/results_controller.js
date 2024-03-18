import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static outlets = ["debounce"]

  static targets = ["container"]

  foo(event) {
    const value = event.target.innerText
    this.debounceOutlet.alert(value)
    this.containerTarget.innerText = ''
  }
}
