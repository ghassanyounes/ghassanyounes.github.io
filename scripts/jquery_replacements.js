$.post("scripts/listProgressDir.php", function(progressDirList) {
  console.log(progressDirList); //"progressDirList" contains whatever listProgressDir.php returned
});
$('#projupdate').load('../progress_reports/20220331.html #report');
