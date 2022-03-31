var recent_prj_update = "";

$.post("scripts/listProgressDir.php", function(progressDirList) {
  //console.log(progressDirList); //"progressDirList" contains whatever listProgressDir.php returned
  let text = progressDirList.split("\n");
  for (var i = 0; i < text.length; i++) {
    text[i] = text[i].slice(text[i].substr(20), text[i].indexOf(".html"));
  }
  console.log(text);
  recent_prj_update = text.reduce((a,b) => (a >= b) ? a : b );
  console.log(`Most recent file is ${recent_prj_update}\n`);
});
$('#projupdate').load('../progress_reports/20220331.html #report');
