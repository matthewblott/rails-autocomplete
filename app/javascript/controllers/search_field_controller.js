import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['submit', 'query', 'display', 'code']

  display(item) {
    this.queryTarget.value = item.text
    this.displayTarget.textContent = item.value
    this.codeTarget.value = item.value
  }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.submitTarget.click()
    }, 500)
  }
}
