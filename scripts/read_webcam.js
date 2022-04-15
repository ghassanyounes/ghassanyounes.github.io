function hasGetUserMedia() {
    return !!(navigator.mediaDevices && navigator.mediaDevices.getUserMedia);
  }
  if (hasGetUserMedia()) {
    // Good to go!
  } else {
    alert("getUserMedia() is not supported by your browser");
  }

  
const constraints = {
    video: { width: { min: 1280 }, height: { min: 720 } },
};

const video = document.querySelector("video");

navigator.mediaDevices.getUserMedia(constraints).then((stream) => {
    video.srcObject = stream;
});
