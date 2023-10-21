import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  hide() {
    document.getElementById('modal-preview').style.display = 'none';
    document.getElementsByClassName('modal-backdrop')[0].style.display = 'none';
  }
}
