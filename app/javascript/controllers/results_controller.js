import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static outlets = ['debounce']
  static targets = ['container']

  select(event) {
    event.preventDefault()

    const movie = {
      caption: event.target.innerText,
      code: event.target.querySelector('input').value
    }

    this.debounceOutlet.alert(movie)
    this.containerTarget.innerText = ''
  }
}
