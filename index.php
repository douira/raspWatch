<?php
include "util.php";
setupPage("Überblick");

$roomCounts = [];
getTypes();
getStatusNames();
query("SELECT * FROM messages");
while ($message = mysqli_fetch_assoc($queryResult)) {
  if ($message["ip"]) {
    if (! array_key_exists($message["ip"], $roomCounts)) {
      $roomCounts[$message["ip"]] = [];
      foreach ($types as $typeIndex => $typeName) {
        $roomCounts[$message["ip"]][$typeIndex] = array_fill(0, count($statusNames), 0);
      }
    }
    $roomCounts[$message["ip"]][$message["typeId"]][$message["statusId"]] ++;
  }
}
$maximum = 0;
$average = 0;
$counter = 0;
function addToAverage($item) {
  global $maximum;
  global $average;
  global $counter;
  $counter ++;
  $average += $item;
  $maximum = max($maximum, $item);
}
array_walk_recursive($roomCounts, "addToAverage");
$thresh = ($maximum + $average / $counter) / 2;
echo "<br><h3>Geräte mit Aufgaben</h3>";
echo "<div class='roomTable row'><table class='table-responsive table table-sm table-hover'>";
echo "<thead class='thead-default'><tr><th>Nachrichtenart</th>";
getTypes();
foreach ($types as $typeName) {
  echo "<th>" . $typeName . "</th>";
}
echo "</tr></thead><tbody>";
foreach ($roomCounts as $ip => $typeCounts) {
  echo "<tr onclick='document.location = \"device.php?ip={$ip}&all=1\"'>";
  echo "<td>" . roomName($ip) . "</td>";
  foreach ($typeCounts as $type => $statusCounts) {
    echo "<td>";
    $displayPart = array_sum($statusCounts);
    foreach ($statusCounts as $statusId => $count) {
      echo "<span class='tag text-right " . ($count > 0 ? statusTagName($statusId) : "tag-default") . "' style='font-family:Monospace;";
      if ($count >= $thresh) {
        echo "border-color:black; border-style:solid; border-width:3px; margin:0.4px;";
      } else {
        if (! $count) {
          echo "background-color:lightgrey;";
        }
        echo "margin:3.4px;";
      }
      echo "padding:5px;";
      if (! $displayPart) {
        echo "visibility:hidden;";
      }

      echo "'>" . ($count ? $count : "&nbsp");
      echo "</span>";
    }
    echo "</td>";
  }
  echo "</tr>";
}
echo "</tbody></table></div>";
endPage();
?>
