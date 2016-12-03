<?php
include "util.php";
setupPage("Modul");
setupUser();
$moduleId = 0;
if (empty($_GET["id"])) {
  makeAlert("Keine Modul ID gesendet", "danger", "Fehler!");
} else {
  $moduleId = $_GET["id"];
}
$moduleN = moduleName($moduleId);
echo "<h3>Aufgaben für Modul {$moduleN}:</h3>";
messageTable(queryToRows("SELECT * FROM messages WHERE moduleId={$moduleId}"), ["moduleId"], ["statusId", "ip", "time", "typeId", "assignee"]);
endPage();
?>
