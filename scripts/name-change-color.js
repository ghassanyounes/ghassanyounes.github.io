var text = document.getElementById("name");
var str = text.innerHTML;

var colours = [
  "#d8117d", //pink
  "#d9362d", //red
  "#e5712a", //orange
  "#f8be23", //yellow
  "#069743", //green
  "#00a3da", //blue
  "#773e85"  //purple
];
colours = colours.reverse();
var j = "";
var k = 0;
setInterval(function (){
  //k++; 
  j = "";
  str = "Ghassan Younes";
//no interval calls, they run all the time and cause a stack overflow

  for (var i = 0; i < str.length; i++) {
    if (str[i] != " ") {
      k++;
      j += `<span style="color:${
        colours[colours.length - ((k % colours.length)) - 1]
      };">${str[i]}</span>`;
    }
    if (str[i] == " ") {
      j += " ";
    }
  }

  document.getElementById("name").innerHTML = j;
  if (k == 91) { k = 0; };
}, 1000);