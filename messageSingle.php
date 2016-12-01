<?php
include "util.php";
setupPage("Nachricht");
setupUser();
if (empty($_GET["id"])) {
  echo "<p class='text-danger'>Keine message id gesendet!</p>";
} else {
  $id = $_GET["id"];

  if (! empty($_GET["action"])) {
    switch ($_GET["action"]) {
      case "statusUpdate":
        if (isset($_GET["statusId"])) {
          setTaskStatus($id, $_GET["statusId"], $userId);
          echo "<p class='text-success'>Status wurde geändert.</p>";
        }
        break;
      case "assign":
        if (! empty($_GET["assignee"])) {
          assignTask($id, $_GET["assignee"]);
          echo "<p class='text-success'>Beauftrager wurde geändert.</p>";
        }
        break;
      case "unassign":
        unassignTask($id);
        echo "<p class='text-success'>Beauftrager wurde hiervon entfernt.</p>";
        break;
    }
  }

  echo "<div class='row'>";
  query("SELECT * FROM messages WHERE id = '{$id}'");
  $message = mysqli_fetch_assoc($queryResult);

  echo "<div class='col-md-4'>";
  echo "<h3>Info</h3>";
  echo "<table class='table table-bordered'>";
  echo "<tr><td>Gerät</td><td>in <a href='device.php?ip={$message["ip"]}'>" . roomName($message["ip"]) . "</a></td></tr>";
  echo "<tr><td>Beauftragter</td><td><a href='user.php?id={$message["assignee"]}'>" . adminName($message["assignee"]) . "</a></td></tr>";
  echo "<tr><td>Zeitstempel</td><td>" . messageTime($message) . "</td></tr>";
  echo "<tr><td>Art</td><td>" . typeName($message["typeId"]) . "</td></tr>";
  echo "<tr class='" . statusBName($message["statusId"]) . "'><td>Status</td><td>" . statusName($message["statusId"]) . "</td></tr>";
  echo "<tr><td>Modul</td><td><a href='module.php?id={$message["moduleId"]}'>" . moduleName($message["moduleId"]) . "</a></td></tr>";
  echo "<tr><td>ID</td><td>{$message["id"]}</td></tr>";
  echo "</table>";
  echo "</div>";

  echo "<div class='col-md-8'>";
  echo "<h3>Beschreibung</h3>";
  echo "<p><samp>{$message["message"]}</samp></p>";
  
  
  echo "<h3>Kommentare</h3>";
  if (permIsHigh($userPerm)) {
    echo "<p hidden id='msgId'>{$id}</p>";
    echo "<textarea class='form-control' rows='11' id='comment'>{$message["comment"]}</textarea>";
    echo "<script src='https://cdn.jsdelivr.net/jquery/3.0.0/jquery.min.js'></script><script src='editComment.js'></script>";
  } else {
    echo "<p>{$message["comment"]}</p>";
  }
  echo "</div>";
  echo "</div>";

  $linkPrefix = "messageSingle.php?id={$id}&";
  echo "<div class='row'><div class='col-md-4'><h3>Aktionen</h3>";
  if (permIsHigh($userPerm) || ! adminGetPerm($userId)) {
    echo "<div class='list-group'>";
    $statusId = $message["statusId"];

    echo "<a class='list-group-item list-group-item-action list-group-item-info' href='{$linkPrefix}action=assign&assignee={$userId}'>Selbst zuweisen</a>";
    if (permIsHigh($userPerm)) {
      echo "<a class='list-group-item list-group-item-action yellow-item' href='{$linkPrefix}action=unassign'>Niemandem zuweisen</a>";
    }
    if ($statusId != 4) {
      echo "<a class='list-group-item list-group-item-action table-assigned table-assigned-color-text' href='{$linkPrefix}action=statusUpdate&statusId=2'>Bearbeitung starten</a>";
    }
    echo "<a class='list-group-item list-group-item-action list-group-item-success' href='{$linkPrefix}action=statusUpdate&statusId=3'>Fertigstellen</a>";
    if (permIsHigh($userPerm)) {
      echo "<a class='list-group-item list-group-item-action list-group-item-danger' href='messages.php?id={$id}&action=delete'>Löschen</a>";
    }
    echo "<a class='list-group-item list-group-item-action list-group-item-danger' href='{$linkPrefix}action=statusUpdate&statusId=4'>Als unvollendet markieren</a>";
    echo "</div>";

  } else {
    loginPlease();
  }
  echo "</div>";
  if (permIsHigh($userPerm)) {
    assignList($linkPrefix);
  }
  echo "</div>";
}
endPage();
?>
