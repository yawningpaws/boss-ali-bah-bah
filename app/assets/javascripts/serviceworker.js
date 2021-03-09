self.addEventListener('install', (event) => {
  console.log('i got installed');
});

self.addEventListener("push", (event) => {
  let title = (event.data && event.data.text()) || "Yay a message";
  let body = "We have received a push message";
  let tag = "push-simple-demo-notification-tag";
  // let icon = '/assets/my-logo-120x120.png';

  event.waitUntil(
    self.registration.showNotification(title, { body, tag })
    )
});

// self.addEventListener('notificationclose', (e) => {
//   const notification = e.notification;
//   const primaryKey = notification.data.primaryKey;
//   alert('closed');
//   console.log('Closed notification: ' + primaryKey);
// });

// self.addEventListener('notificationclick', (e) => {
//   var notification = e.notification;
//   var primaryKey = notification.data.primaryKey;
//   var action = e.action;

//   if (action === 'close') {
//     alert('closed2');
//     notification.close();
//   } else {
//     alert('clicked');
//     clients.openWindow('https://boss-ali-bah-bah.herokuapp.com/');
//     notification.close();
//   }
// });
