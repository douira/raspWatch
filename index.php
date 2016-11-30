<?php
include "util.php";
setupPage("Überblick");
setupUser();
if ($userId > 1) {
  echo "<h4><a href='messages.php'>Aufgaben</a></h4>";
  echo "<h4><a href='setPswd.php'>Passwort ändern</a></h4>";
}
echo "<h4><a href='addMessage.php'>Nachricht hinzufügen</a></h4>";
echo "<h4><a href='setUser.php'>Benutzer auswählen</a></h4>";
query("SELECT * FROM messages");
$roomCounts = [];
$countedTypes = [];
//getStatusNames();
while ($message = mysqli_fetch_assoc($queryResult)) {
  if (! array_key_exists($message["ip"], $roomCounts)) {
    $roomCounts[$message["ip"]] = [];
  }
  if (! array_key_exists($message["typeId"], $roomCounts[$message["ip"]])) {
    $roomCounts[$message["ip"]][$message["typeId"]] = [0, 0, 0, 0, 0]; //array_fill(0, count($statusNames), 0);
    $countedTypes[$message["typeId"]] = true;
  }
  /*if (! array_key_exists($message["statusId"], $roomCounts[$message["ip"]][$message["typeId"]])) {
    $roomCounts[$message["ip"]][$message["typeId"]][$message["statusId"]] = [];
  }*/
  $roomCounts[$message["ip"]][$message["typeId"]][$message["statusId"]] ++;
}
echo "<br><h3>Geräte mit Aufgaben</h3>";
echo "<div class='roomTable row'><table class='table-responsive table table-sm table-hover'>";
echo "<thead class='thead-default'><tr><th>Nachrichtenart</th>";
foreach ($countedTypes as $typeId => $x) {
  echo "<th>" . typeName($typeId) . "</th>";
}
echo "</tr></thead><tbody>";
foreach ($roomCounts as $ip => $typeCounts) {
  echo "<tr onclick='document.location = \"device.php?ip={$ip}&all=1\"'>";
  echo "<td>" . roomName($ip) . "</td>";
  foreach ($typeCounts as $type => $statusCounts) {
    echo "<td>";
    foreach ($statusCounts as $statusId => $count) {
      //if ($count > 0) {
        echo "<span class='tag text-right " . ($count > 0 ? statusTagName($statusId) : "tag-default") . "'>$count</span>&nbsp;";
      //}
    }
    echo "</td>";
  }
  echo "</tr>";
}
echo "</tbody></table></div>";
endPage();
?>
