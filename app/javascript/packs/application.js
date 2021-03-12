// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
import "@hotwired/turbo-rails"

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "bootstrap/dist/js/bootstrap.bundle";

// Internal imports
import "controllers";
import { initFlatpickr } from '../plugins/init_flatpickr';
import { initTooltip } from '../plugins/init_tooltip';
import { initMapbox } from '../plugins/init_mapbox';
import { toggleCollapse } from '../plugins/init_toggle';


import { initServiceworker } from '../plugins/register_serviceworker';
import { accidentInput } from '../plugins/init_accident_input';


document.addEventListener('turbo:load', () => {
  const spinner = document.querySelector('.spinner');
  spinner.style.display = 'none';
  initFlatpickr();
  initTooltip();
  // console.log('about to fire mapbox');
  toggleCollapse();
  initServiceworker();
  initMapbox();
  accidentInput();
});

document.addEventListener('turbo:submit-start', () => {
  const spinner = document.querySelector('.spinner');
  spinner.style.display = 'flex';
});

document.addEventListener('turbo:submit-end', () => {
  const spinner = document.querySelector('.spinner');
  spinner.style.display = 'none';
});
