<?php
include "util.php";
setupPage("Benutzer");

$useUserId = $userId;
$useUserName = $userName;
if (! empty($_GET["id"])) {
  $useUserId = $_GET["id"];
  $useUserName = adminName($useUserId);
}
echo "<p>von Benutzer: {$useUserName} ID: {$useUserId}</p>";
echo "<h3>Alle Aufgaben für diesen Benutzer:</h3>";
messageTable(queryToRows("SELECT * FROM messages WHERE assignee={$useUserId}"), ["assignee"], ["statusId", "ip", "time", "typeId"]);
endPage();
?>
