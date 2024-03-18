import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['form', 'search', 'display']

  alert(movie) {
    this.searchTarget.value = movie.caption
    this.displayTarget.textContent = movie.code
  }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.formTarget.requestSubmit()
    }, 500)
  }
}
