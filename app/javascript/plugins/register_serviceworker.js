import $ from 'jquery';

if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/serviceworker.js', { scope: './' })
  .then((reg) => {
    console.log('I am a service worker, and I am 200!');
      // checkInNotifications();
    });

  // subscribe to push notifications
  navigator.serviceWorker.ready.then((serviceWorkerRegistration) => {
    serviceWorkerRegistration.pushManager
    .subscribe({
      userVisibleOnly: true,
      applicationServerKey: window.vapidPublicKey
    });

    serviceWorkerRegistration.pushManager
    .getSubscription()
    .then((subscription) => {
      console.log(subscription);
      $.post("/serviceworker/subscribe", { subscription: subscription.toJSON() });
    });;
  });
}

$("#webpush-btn").on("click", (e) => {
  console.log('test');
  navigator.serviceWorker.ready
  .then((serviceWorkerRegistration) => {
    serviceWorkerRegistration.pushManager.getSubscription()
    .then((subscription) => {
      console.log(subscription);
      $.post("/workdays/notification", { subscription: subscription.toJSON(), message: "Time for check in today!" });
    });
  });
});

const checkInNotifications = () => {
  // fetch('/workday_notification.json')
  // .then(data => data.json())
  // .then(check => {
  //   if (!check.checked_in) {
  //     buildNotification(check);
  //   }
  //     // first, the controller needs to figure out
  //     // if there are any new notifications for this user

  //     // The controller will give back the right
  //     // information

  //     // the service worker is going to parse that infor
  //     // if there are any notifications
  //     // call a function that pushes them to the mobile phone
  //   })
}

const askForNotificationsPermission = () => {
  Notification.requestPermission(function(status) {
    console.log('Notification permission status:', status);
  });
}

const buildNotification = (check) => {
  if (Notification.permission === 'denied') {
    askForNotificationsPermission();
  }

  if (Notification.permission == 'granted') {
    navigator.serviceWorker.getRegistration()
    .then((reg) => {
      const options = {
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

