import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import * as turf from '@turf/turf';

const buildMap = (mapElement) => {
  currentPosition();
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    center: [103.85261535644531, 1.2929801940917969],
    zoom: 12
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    new mapboxgl.Marker()
    .setLngLat([ marker.lng, marker.lat ])
    .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ currentP.lng, currentP.lat ]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const currentPosition = (map) => {
  navigator.geolocation.getCurrentPosition((data) => {
    new mapboxgl.Marker()
    .setLngLat([ data.coords.longitude, data.coords.latitude ])
    .addTo(map);
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([ data.coords.longitude, data.coords.latitude ]);
    map.fitBounds(bounds, { padding: 70, maxZoom: 14 });
  });
};

const dropdownPopulate = (map) => {

  const ddMenu = document.querySelector('.dropdown-menu');
  const organisations = JSON.parse(ddMenu.dataset.organisations);

  organisations.forEach(organisation =>{
    navigator.geolocation.getCurrentPosition((data) => {
      const from = turf.point([ data.coords.longitude, data.coords.latitude]);
      const to = turf.point([organisation.longitude, organisation.latitude]);
      const options = {units: 'kilometers'};
      const distance = turf.distance(from, to, options);

      ddMenu.insertAdjacentHTML('beforeend', `<a class="dropdown-item" data-longitude="${organisation.longitude}" data-latitude="${organisation.latitude}"> ${organisation.name} (${distance.toFixed(2)} km away)</a>`);
    });
  });

  const flyToMap = () => {
    const ddItems = document.querySelectorAll('.dropdown-item');

    ddItems.forEach(item => {
      item.addEventListener("click", event => {
        map.flyTo({
          center: [item.dataset.longitude, item.dataset.latitude],
          zoom: 15
        })
      })
    });
  };

setTimeout(flyToMap, 3000);


};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    currentPosition(map);
    // fitMapToMarkers(map);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

  // Create a HTML element for your custom marker
  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url('${marker.image_url}')`;
  element.style.backgroundSize = 'contain';
  element.style.width = '25px';
  element.style.height = '25px';

    // Pass the element as an argument to the new marker
    new mapboxgl.Marker(element)
    .setLngLat([marker.lng, marker.lat])
    .setPopup(popup)
    .addTo(map);
  });

    dropdownPopulate(map);
  }
};


export { initMapbox};
