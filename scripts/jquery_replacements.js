$.post("scripts/listProgressDir.php", function(progressDirList) {
  //console.log(progressDirList); //"progressDirList" contains whatever listProgressDir.php returned
  let text = progressDirList.split("\n");
  text.forEach(i => {
    i = i.substr(21);
    console.log(i);
  });
});
$('#projupdate').load('../progress_reports/20220331.html #report');
