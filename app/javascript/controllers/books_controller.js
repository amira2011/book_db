import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="books"
export default class extends Controller {
  connect() {
    console.log("Books controller has been connected");
    $( "#datepicker" ).datepicker();

  }
}
