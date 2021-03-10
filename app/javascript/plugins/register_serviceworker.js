const initServiceworker = () => {
  if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/serviceworker.js', { scope: './' })
    .then((reg) => {
      console.log('I am a service worker, and I am 200!');
      // checkInNotifications();
    });
}
}

export { initServiceworker }
