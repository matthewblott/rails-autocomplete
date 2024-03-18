import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['form', 'search', 'display', 'code']

  display(item) {
    this.searchTarget.value = item.text
    this.displayTarget.textContent = item.value
    this.codeTarget.value = item.value
  }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.formTarget.requestSubmit()
    }, 500)
  }
}
