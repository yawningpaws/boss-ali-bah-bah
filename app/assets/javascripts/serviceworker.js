self.addEventListener('install', (event) => {
  console.log('i got installed');
});

self.addEventListener('notificationclose', (e) => {
  const notification = e.notification;
  const primaryKey = notification.data.primaryKey;
  alert('closed');
  console.log('Closed notification: ' + primaryKey);
});

self.addEventListener('notificationclick', (e) => {
  var notification = e.notification;
  var primaryKey = notification.data.primaryKey;
  var action = e.action;

  if (action === 'close') {
    alert('closed2');
    notification.close();
  } else {
    alert('clicked');
    clients.openWindow('https://boss-ali-bah-bah.herokuapp.com/');
    notification.close();
  }
});
