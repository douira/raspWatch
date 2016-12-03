<?php
include "util.php";
setupPage("Aufgaben");
setupUser();

if (! empty($_GET["action"]) && ! empty($_GET["id"])) {
  $id = $_GET["id"];
  switch ($_GET["action"]) {
    case "delete":
      deleteTask($id);
      echo "<p class='text-success'>Nachricht mit ID {$id} wurde entfernt.</p>";
      break;
  }
}

if (userPresent()) {
  echo "<h3>Diesem Benutzer zugewiesene Aufgaben:</h3>";
  messageTable(queryToRows("SELECT * FROM messages WHERE assignee = {$userId} AND NOT statusId = 3"), ["assignee"]);
  echo "<h3>Noch nicht zugewiesene oder unvollendete Aufgaben:</h3>";
  messageTable(queryToRows("SELECT * FROM messages WHERE NOT assignee = {$userId} AND (statusId = 0 OR statusId = 4)"));
} else {
  echo "<p class='text-warning'>Kein Benutzer ausgewählt!</p>";
}

endPage();
?>
