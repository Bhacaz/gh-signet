import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "query" ]

    useThisStartQuery(event) {
        let value = event.target.innerText
        value = value.trim()
        this.queryTarget.value = value
        document.getElementById("library_query_modal").close()
    }
}
