Notification.requestPermission(function(status) {
    console.log('Notification permission status:', status);
});


const initNotif = () => {
  const btn = document.querySelector('#btn');
  btn.addEventListener('click', () => {
    displayNotification();
  })
}

export default initNotif;
