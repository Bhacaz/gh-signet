import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    static targets = [ "query" ]

    connect() {
        console.log(this.queryTarget)
    }
    useThisStartQuery(event) {
        let value = event.target.innerText
        value = value.trim()
        console.log(value)
        // set the value to the query target
        this.queryTarget.value = value
        console.log(this.queryTarget)
    }
}
