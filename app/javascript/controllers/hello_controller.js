import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  toogleTheme() {
    const theme = document.documentElement.dataset.bsTheme
    document.documentElement.dataset.bsTheme = theme === "light" ? "dark" : "light"
  }
}
