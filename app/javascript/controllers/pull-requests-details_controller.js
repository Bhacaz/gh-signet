import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    closeDetailsOffcanvas() {
        document.getElementsByClassName('offcanvas')[0].remove()
        document.getElementsByClassName('offcanvas-backdrop')[0].remove()
    }
}
