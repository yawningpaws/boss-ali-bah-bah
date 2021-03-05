Notification.requestPermission(function(status) {
    console.log('Notification permission status:', status);
});

const displayNotification = () => {
  if (Notification.permission == 'granted') {
    navigator.serviceWorker.getRegistration().then((reg) => {
      var options = {
        body: 'Have a great day :)',
        data: {
          dateOfArrival: Date.now(),
          primaryKey: 1
        },
      };
      reg.showNotification('Log your work hours today!', options);
    });
  }
}


const initNotif = () => {
  const btn = document.querySelector('#btn');
  alert('hi');
  btn.addEventListener('click', () => {
    displayNotification();
  })
}

export default initNotif;
