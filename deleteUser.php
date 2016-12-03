<?php
include "util.php";
setupPage("Benutzer löschen");
setupUser();
if (permIsHigh($userPerm)) {
  if (! empty($_GET["deleteUser"])) {
    getAdmins();
    $id = $_GET["deleteUser"];
    if (array_key_exists($id, $admins)) {
      echo "<p class='text-danger'>Willst du Benutzer " . adminName($id) . " wirklich löschen?</p>";
      echo "<form action='userActions.php' method='post'>";
      echo "<input type='hidden' name='deleteUser' value='{$id}'>";
      echo "<button type='submit' class='btn btn-danger'>Benutzer löschen</button></form>";
    } else {
      makeAlert("Benuzter mit ID {$id} gibt es nicht.", "info", "Information:");
    }
  } else {
    makeAlert("Kein Benutzer angegeben", "danger", "Fehler!");
  }
} else {
  makeAlert("Nicht berechtigt", "danger", "Fehler!");
}

endPage();
?>
