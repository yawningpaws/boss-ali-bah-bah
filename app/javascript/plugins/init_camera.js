const initCamera = () => {
  const startbutton = document.getElementById('startbutton');
  console.log(startbutton)
  if(startbutton) {
    startbutton.addEventListener('click', startCamera)
  }
}

const startCamera = (event) => {
  event.preventDefault();
  document.getElementById('off').id = ('video');
  document.getElementById('video').style.display = '';

}

export { initCamera }


