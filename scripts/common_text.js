const d = new Date();
document.getElementById("footer").innerHTML = `<a target=blank href="http://github.com/ghassanyounes" id=github ><i class="fab fa-github fa-1x"></i></a>
<a target=blank href="http://instagram.com/the__ghassan" id=instagram ><i class="fab fa-instagram fa-1x"></i></a>\n
<a target=blank id=linkedin href="http://linkedin.com/in/ghassanyounes" target=blank><i class="fab fa-linkedin fa-1x"></i></a>\n
<a target=blank href="http://twitter.com/the__ghassan" id=twitter><i class="fab fa-twitter fa-1x"></i></a> \n
<a target=blank href="mailto:ghassan@ghassanyounes.com" id=email><i class="fas fa-at fa-1x"></i></a>\n
<p id="copyright"></p>`;
document.getElementById("copyright").innerHTML = `&copy; Ghassan Younes ${d.getFullYear()}`;

if (document.getElementById("home") != null)
  document.getElementById("home").innerHTML = `Home`;
  if (document.getElementById("shophome") != null)
    document.getElementById("shophome").innerHTML = `Shop Main Page`;
if (document.getElementById("contact") != null)
  document.getElementById("contact").innerHTML = `Resumé &amp; Contact`;
if (document.getElementById("projs") != null)
  document.getElementById("projs").innerHTML = `Professional Life &amp; Work`;
if (document.getElementById("blog") != null)
  document.getElementById("blog").innerHTML = `Food Blog`;
if (document.getElementById("store") != null)
  document.getElementById("store").innerHTML = `Store`;
if (document.getElementById("about") != null)
  document.getElementById("about").innerHTML = `About Me`;
if (document.getElementById("order") != null)
  document.getElementById("order").innerHTML = `Order Here!`;
if (document.getElementById("highlights") != null)
  document.getElementById("highlights").innerHTML = `Highlights`;
if (document.getElementById("reviews") != null)
  document.getElementById("reviews").innerHTML = `Reviews`;
if (document.getElementById("bloghome") != null)
  document.getElementById("bloghome").innerHTML = `Blog Main Page`;
if (document.getElementById("newestpost") != null)
  document.getElementById("newestpost").innerHTML = `Latest Posts`;
if (document.getElementById("highlights") != null)
  document.getElementById("highlights").innerHTML = `Highlights`;
if (document.getElementById("recipes") != null)
  document.getElementById("recipes").innerHTML = `Recipes`;

var prevScrollpos = window.pageYOffset;
window.onscroll = function() {
  var currentScrollPos = window.pageYOffset;
  if (prevScrollpos > currentScrollPos) {
    document.getElementById("name").style.display = "flex";
  } else {
    document.getElementById("name").style.display = "none";
  }
  prevScrollpos = currentScrollPos;
  //console.log(`scroll at ${currentScrollPos}\n`);
} 

const darkThemeMq = window.matchMedia("(prefers-color-scheme: dark)");
darkThemeMq.addEventListener('change', e => {
  if (e.matches) {
    if (document.getElementById("logo_title") != null) {
      document.getElementById("logo_title").src = "images/logo_header.svg";
      console.log("dark mode detected");
    }
  } else {
    if (document.getElementById("logo_title") != null) {
      document.getElementById("logo_title").src = "images/logo_header_light.svg";
      console.log("light mode detected");
    }
  }
});