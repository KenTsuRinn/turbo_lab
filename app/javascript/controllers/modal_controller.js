import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        // The listener for the Bootstrap event via jQuery
        $(this.element).on('hide.bs.modal', (event) => {
            console.log('modal close.');
        })
    }
    closeModal(){
        console.log("close modal")
        $('.modal').modal('hide');

    }
}
