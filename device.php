<?php
include "util.php";
if (! empty($_GET["ip"])) {
  $ip = $_GET["ip"];
  setupPage("Gerät in " . roomNameSimple($ip));
  setupUser();
  getRooms();
  if (array_key_exists($_GET["ip"], $rooms)) {
    $memQuery = queryToRows("SELECT memory FROM status WHERE ip={$ip} ORDER BY time DESC LIMIT 1");
    if (count($memQuery) > 0) {
      echo "<div class='row'>";
      echo "<div class='col-md-6'>";
      echo "<h3>Belegter(?) Speicher</h3>";
      echo "<table class='table table-bordered'>";
      echo "<tr><td>Aktuell</td><td>" . formatBytes($memQuery[0]["memory"]) . "</td></tr>";
      $mem = queryToRows("SELECT time, MAX(memory) AS highest FROM status WHERE ip={$ip}")[0];
      echo "<tr><td>Maximum</td><td>" . formatBytes($mem["highest"]) . " - " . formatTime($mem["time"]) . "</td></tr>";
      $mem = queryToRows("SELECT time, MIN(memory) AS lowest FROM status WHERE ip={$ip}")[0];
      echo "<tr><td>Minimum</td><td>" . formatBytes($mem["lowest"]) . " - " . formatTime($mem["time"]) . "</td></tr>";
      $mem = queryToRows("SELECT time, AVG(memory) AS avrg FROM status WHERE ip={$ip}")[0]["avrg"];
      echo "<tr><td>Durchschnitt</td><td>" . formatBytes(round($mem)) . "</td></tr>";
      echo "</table></div></div><br>";
    }
  }
  if (! empty($_GET["all"]) && $_GET["all"] > 0) {
    echo "<p><a href='device.php?ip={$ip}'>Alle nicht fertigen Aufgaben für dieses Gerät</a></p>";
    echo "<h3>Alle Aufgaben für dieses Gerät:</h3>";
    messageTable(queryToRows("SELECT * FROM messages WHERE ip={$ip}"), ["ip"], ["statusId", "time", "assignee", "typeId"]);
  } else {
    echo "<p><a href='device.php?ip={$ip}&all=1'>Alle Aufgaben für dieses Gerät</a></p>";
    echo "<h3>Alle nicht fertigen Aufgaben für dieses Gerät:</h3>";
    messageTable(queryToRows("SELECT * FROM messages WHERE ip={$ip} AND NOT statusId=3"), ["ip"], ["statusId", "time", "assignee", "typeId"]);
  }
} else {
  setupPage("<h1>Unbekanntes Gerät</h1>Fehler: Keine IP-Adresse gesendet!");
}
endPage();
?>