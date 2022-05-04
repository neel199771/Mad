if('serviceWorker' in navigator)
{
    navigator.serviceWorker.register("/js/sw1.js").then((registeration) => {
        console.log("Harsh's Service Worker is registered !!!")
    });
    
}

else
{
    console.log("Unsupported Browser for PWAs and Service Workers !!!!!")
}
self.addEventListener('install', (event) => {
    event.waitUntil(
      caches.open('myCache').then((cache) => {
        return cache.addAll(
          [
            '/index.html',
            '/css/style.css',
            '/js/script.js'
          ]
        );
      })
    );
});
// Notification.requestPermission(function(status) {
//     console.log('Notification permission status:', status);
// });
// function displayNotification() {
//     if (Notification.permission == 'granted') {
//       navigator.serviceWorker.getRegistration().then(function(reg) {
//         reg.showNotification('Hello world!');
//       });
//     }
//   }