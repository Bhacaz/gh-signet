import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "query" ]

    useThisStartQuery(event) {
        let value = event.target.innerText
        value = value.trim()
        this.queryTarget.value = value
        document.getElementById('library-query-modal').style.display = 'none';
        document.getElementsByClassName('modal-backdrop')[0].remove()
    }

    showLibraryModal() {
        this.libraryQueryModal().show()
    }

    hidePreviewModal() {
        document.getElementById('modal-preview').style.display = 'none';
        document.getElementsByClassName('modal-backdrop')[0].remove();
    }

    libraryQueryModal() {
        return new bootstrap.Modal('#library-query-modal')
    }
}
