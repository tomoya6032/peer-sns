// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "controllers"

// import "@rails/ujs"


// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")

// import $ from 'jquery'
// import axios from 'axios'

// document.addEventListener('turbolinks:load', () => {
//     const dataset = $('#tweet-show').data()
//     const tweetId = dataset.tweetId; 
//     // 「いいね！」ボタンの状態を表示
//     axios.get(`/tweets/${tweetId}/like`)
//       .then((response) => {
//         const hasLiked = response.data.hasLiked
//         if (hasLiked) {
//           $('.active-heart').removeClass('hidden')
//         } else {
//           $('.inactive-heart').removeClass('hidden')
//         }
//       })
  
//     listenInactiveHeratEvent(tweetId);
//     listenActiveHeratEvent(tweetId);
// })
  


// document.addEventListener('DOMContentLoaded', () => {
//     window.alert('DOM LOADED')
// })

// document.addEventListener('DOMContentLoaded', () => {
//     $(`.content`).on(`click`, () => {
//       window.alert('clicked')
//     })
// })

//= require jquery
//= require like_count

