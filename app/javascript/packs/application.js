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

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initFlatpickr } from '../plugins/init_flatpickr';
//import { initCamera} from '../plugins/init_camera.js';

//import { initWebrtcPhoto } from '../plugins/init_webrtc_photo.js';
import { initTooltip } from '../plugins/init_tooltip';
import { initMapbox } from '../plugins/init_mapbox';
import "controllers";
import { initServiceworker } from '../plugins/register_serviceworker';

document.addEventListener('turbo:load', () => {
  console.log('fired load!');
  // Call your functions here, e.g:
  // initSelect2();
  initFlatpickr();
  //initWebrtcPhoto();
  //initCamera();
  initTooltip();
  initServiceworker();
  initMapbox();
  const spinner = document.querySelector('.spinner');
  spinner.style.display = 'none';
});

document.addEventListener('turbo:submit-start', () => {
  const spinner = document.querySelector('.spinner');
  console.log('definitely working!');
  spinner.style.display = 'flex';
});

document.addEventListener('turbo:before-fetch-response', () => {
  console.log('fired fetch response!');
});


document.addEventListener('turbo:submit-end', () => {
  console.log('fired submit end!');
  document.querySelectorAll('.spinner').forEach((el => el.style.display = 'none' ));
});

document.addEventListener('turbo:before-cache', () => {

  console.log('fired before cache!');
});


document.addEventListener('turbo:before-render', () => {
  console.log('fired before render!');
});

document.addEventListener('turbo:before-stream-render', () => {
  console.log('fired before stream render!');
});


