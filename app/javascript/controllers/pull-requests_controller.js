import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    connect() {
        let container = document.querySelector('#dashboard-masonry')
        new Masonry(container).reloadItems()
    }
}
