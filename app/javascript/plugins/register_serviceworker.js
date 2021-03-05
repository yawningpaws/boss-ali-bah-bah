if (navigator.serviceWorker) {
      navigator.serviceWorker.register('/serviceworker.js', { scope: './' })
      .then((reg) => {
        console.log('[Page] Service worker registered!');
    });
}
