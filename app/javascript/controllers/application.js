//= require jquery
//= require rails-ujs


import { Application } from "@hotwired/stimulus"
import '../custom.js'
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import '../custom.js'


document.addEventListener("DOMContentLoaded", function() {
    const likeButton = document.querySelector(".tweet-like-btn");
  
    likeButton.addEventListener("click", function() {
      this.classList.toggle("tweet-liked");
      alert("Like button clicked!");
    });
});