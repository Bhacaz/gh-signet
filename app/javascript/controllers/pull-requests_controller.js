import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    connect() {
        let container = document.querySelector('#dashboard-masonry')
        new Masonry(container).reloadItems()
    }

    toggleOffcanvas() {
        console.log('toggleOffcanvas')
        let offcanvas = document.querySelector('#offcanvas-pull-request-details')
        let offcanvasBackdrop = document.querySelector('#offcanvas-backdrop-pull-request-details')
        offcanvas.classList.toggle('show')
        offcanvasBackdrop.classList.toggle('show')
        offcanvasBackdrop.classList.toggle('d-none')
        document.getElementsByClassName('offcanvas-title')[0].innerText = 'Loading...';
        document.getElementsByClassName('offcanvas-body')[0].innerText = null;
    }
}
