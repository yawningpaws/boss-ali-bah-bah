let width = 320;
let height = 0;
let streaming = false;
let video = null;
let canvas = null;
let photo = null;
let startbutton = null;
let currentDeviceId = null;
const initWebrtcPhoto = () => {

  video = document.getElementById('video');
  if (video) {
    bindSwitchCamera(video);
    canvas = document.getElementById('canvas');
    photo = document.getElementById('photo');
    startbutton = document.getElementById('startbutton');
    navigator.mediaDevices.getUserMedia({video: true, audio: false})
    .then((stream) => {
      video.srcObject = stream;
      video.play();
      currentDeviceId = video.srcObject.getVideoTracks()[0].getSettings().deviceId;
      console.log(currentDeviceId);
    })
    .catch( (err) => {
      console.log("An error occurred: " + err);
    });
    video.addEventListener('canplay', (ev) => {
      if (!streaming) {
        height = video.videoHeight / (video.videoWidth/width);
        // Firefox currently has a bug where the height can't be read from
        // the video, so we will make assumptions if this happens.
        if (isNaN(height)) {
          height = width / (4/3);
        }
        video.setAttribute('width', width);
        video.setAttribute('height', height);
        canvas.setAttribute('width', width);
        canvas.setAttribute('height', height);
        streaming = true;
      }
    }, false);
    startbutton.addEventListener('click', (ev) => {
      ev.preventDefault();
      takepicture();
    }, false);
    clearphoto();
  }
}
const takepicture = () => {
  const context = canvas.getContext('2d');
  if (width && height) {
    canvas.width = width;
    canvas.height = height;
    context.drawImage(video, 0, 0, width, height);
    const data = canvas.toDataURL('image/png');
    photo.setAttribute('src', data);
    const ipa_input = document.querySelector('#user_ipa_photo');
    ipa_input.value = data
  }
}
const clearphoto = () => {
  const context = canvas.getContext('2d');
  context.fillStyle = "#AAA";
  context.fillRect(0, 0, canvas.width, canvas.height);
  const data = canvas.toDataURL('image/png');
  photo.setAttribute('src', data);
}
const bindSwitchCamera = (video) => {
    // select a button to switch
  // video.srcObject.getTracks().forEach((track) => console.log(track))
  const switchButton = document.querySelector('.switch-camera');
  switchButton.addEventListener('click', () => {
    // Stop the Camera
    video.srcObject.getTracks().forEach((track) => track.stop())
    video.srcObject = null;
    // Find next possible videosource
    navigator
      .mediaDevices
      .enumerateDevices()
      .then((devices) => {
        nextCamera = getNextAvailableCamera(devices)
        plugCamera(nextCamera)
      })
    })
  }
 const getNextAvailableCamera = (devices) => {
  let nextAvailable = devices.some((device) => {
    return device.deviceId !== currentDeviceId && device.kind === 'videoinput'
  })
  if (nextAvailable) {
    const nextCamera = devices.find((device) => {
      return device.deviceId !== currentDeviceId && device.kind === 'videoinput'
    })
    currentDeviceId = nextCamera.deviceId;
  }
  return currentDeviceId;
 }
 const plugCamera = (cameraId) => {
  let constraints = {
      video: { deviceId: {exact: cameraId } }
  }
  navigator.mediaDevices.getUserMedia(constraints).
    then((stream) => {
      video.srcObject = stream
      video.play() });
 }
export { initWebrtcPhoto };
