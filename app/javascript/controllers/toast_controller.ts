import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('toast')
    $(this.element).toast("show")
  }
}
