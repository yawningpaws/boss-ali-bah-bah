import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import * as turf from '@turf/turf';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const buildMap = (mapElement) => {
    //currentPosition();
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
      const elem = document.createElement('div');
      elem.className = 'marker';
      new mapboxgl.Marker(elem)
      .setLngLat([ data.coords.longitude, data.coords.latitude ])
      .addTo(map);
      const bounds = new mapboxgl.LngLatBounds();
      bounds.extend([ data.coords.longitude, data.coords.latitude ]);
      map.fitBounds(bounds, { padding: 70, maxZoom: 14 });
    });
  };

  const sortItems = (organisations, ddMenu) => {
    const compare = (a, b) => {
      if (a.distance > b.distance) {
        return 1;
      }
      if (a.distance < b.distance) {
        return -1;
      }
      return 0;
    };
    organisations.sort(compare);
    organisations.forEach(organisation => {
      ddMenu.innerHTML += `<li class="list-group-item" data-longitude="${organisation.longitude}" data-latitude="${organisation.latitude}"><a class="listing"><div><strong>${organisation.name}</strong><span class="badge badge-dark badge-map ml-2" style="font-weight: lighter; background-color:#262737">${ organisation.distance} km away</span></div><div class="font-size-add">📍${organisation.address}</div><div class="font-size-add">📞${organisation.phone_number}</div></a>`
    });
  };


  const dropdownPopulate = new Promise((resolve, reject) => {
    const newElement = document.createElement('div');
    newElement.innerHTML = "<div class=\"spinner-border\" role=\"status\"> <span class=\"sr-only\">Loading...</span> </div>"
    const listings = document.querySelector('.listings');
    if (listings){
      listings.appendChild(newElement);
      const ddMenu = document.querySelector('.listings');
      const organisations = JSON.parse(ddMenu.dataset.organisations);
        navigator.geolocation.getCurrentPosition((data) => {
          const orgArray =  organisations.map(organisation => {
          const from = turf.point([ data.coords.longitude, data.coords.latitude]);
          const to = turf.point([organisation.longitude, organisation.latitude]);
          const options = {units: 'kilometers'};

          Object.defineProperty(organisation, 'distance', {
            value: Number(turf.distance(from, to, options).toFixed(2)),
            writable: true,
            enumerable: true,
            configurable: true
          });
          return organisation;
          // const distance = turf.distance(from, to, options);
          // ddMenu.insertAdjacentHTML('beforeend', `<li class="list-group-item"><a class="listing" data-longitude="${organisation.longitude}" data-latitude="${organisation.latitude}"> <strong>${organisation.name}</strong><div class="font-size-add">📍${organisation.address}</div><div class="font-size-add">📞${organisation.phone_number}</div><div class="font-size"> ${ distance.toFixed(2)}km away</div></a>`);

        });

        sortItems(orgArray, ddMenu);
      });
      resolve(newElement)
      // delete the rendering of getting your data
      // newElement.remove()
    }})
  const flyToMap = (map) => {
    document.querySelectorAll('.list-group-item').forEach(item => {
      item.addEventListener("click", (event) => {
        map.flyTo({
          center: [parseFloat(item.dataset.longitude), parseFloat(item.dataset.latitude)],
          zoom: 15
        })
      })
    });
  };

  const initMapbox = () => {
    const mapElement = document.getElementById('map');
    if (mapElement) {
      const map = buildMap(mapElement);
      map.addControl(
        new mapboxgl.GeolocateControl({
          positionOptions: {
            enableHighAccuracy: true
          },
          trackUserLocation: true
        })
        );
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
    dropdownPopulate
    .then( spinner => {
      spinner.remove();
    })
    const listingsContainer = document.querySelector('.list-group.list-group-flush.listings')
    const config = { attributes: true, childList: true, subtree: true }
    const observer = new MutationObserver((mutationsList) => {
      mutationsList.forEach((mutation) => {
        if (mutation.type === 'childList') {
          flyToMap(map);
        }
      })
    })
    observer.observe(listingsContainer, config)
    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //                                   mapboxgl: mapboxgl }));
  }
}
export { initMapbox };


