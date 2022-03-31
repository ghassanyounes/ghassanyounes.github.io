var recent_prj_update = "";

$.post("scripts/listProgressDir.php", function(progressDirList) {
  let text = progressDirList.split("\n");
  for (var i = 0; i < text.length; i++) {
    text[i] = text[i].slice(0, text[i].indexOf(".html"));
  } 
  recent_prj_update = text.reduce((a,b) => (a >= b) ? a : b );
  $('#projupdate').load(`${recent_prj_update}.html #report`);
});
