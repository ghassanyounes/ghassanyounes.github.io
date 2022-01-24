const d = new Date();
document.getElementById("copyright").innerHTML = `&copy; Ghassan Younes ${d.getFullYear()}`;

var prevScrollpos = window.pageYOffset;
window.onscroll = function() {
  var currentScrollPos = window.pageYOffset;
  if (prevScrollpos > currentScrollPos) {
    document.getElementById("title").style.display = "flex";
  } else {
    document.getElementById("title").style.display = "none";
  }
  prevScrollpos = currentScrollPos;
  console.log(`scroll at ${currentScrollPos}\n`);
} 