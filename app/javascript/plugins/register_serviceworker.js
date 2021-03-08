if (navigator.serviceWorker) {
      navigator.serviceWorker.register('/serviceworker.js', { scope: './' })
      .then((reg) => {
        console.log('I am a service worker, and I am 200!');
        checkInNotifications()
    });
}


const checkInNotifications = () => {

  fetch('/workday_notification.json')
    .then(data => data.json())
    .then(check => {
      if (!check.checked_in) {
        buildNotification(check);
      }
      // first, the controller needs to figure out
      // if there are any new notifications for this user

      // The controller will give back the right
      // information

      // the service worker is going to parse that infor
      // if there are any notifications
      // call a function that pushes them to the mobile phone
    })
}


const askForNotificationsPermission = () => {
  Notification.requestPermission(function(status) {
    console.log('my permission pwease')
    console.log('Notification permission status:', status);
  });
}

const buildNotification = (check) => {
  if (Notification.permission === 'denied') {
    askForNotificationsPermission()
  }
  //console.log({notification_access: Notification.permission} )
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

