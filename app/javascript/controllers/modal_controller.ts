import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        // The listener for the Bootstrap event via jQuery
        $(this.element).on('hide.bs.modal', (event) => {
            console.log('modal close.');
            $('.modal trix-editor').each(function () {
                this.value = "";
            })
            $('.modal input[name^="twitter"]').each(function () {
                $(this).val('')
            })
        })
    }

    closeModal() {
        console.log("close modal")
        $('.modal').modal('hide');

    }
}
