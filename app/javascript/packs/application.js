// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "@hotwired/turbo-rails"
import 'css/site'
import 'jquery'
import 'popper.js'
import 'bootstrap'

Rails.start()
ActiveStorage.start()

document.addEventListener('turbo:before-fetch-request', async (event) => {
    event.preventDefault()
  
    console.log('................')
    event.detail.resume()
  })