<?php
include "util.php";
setupPage("Benutzer löschen");
setupUser();
if (permIsHigh($userPerm)) {
  if (! empty($_GET["deleteUser"])) {
    getAdmins();
    $id = $_GET["deleteUser"];
    if (array_key_exists($id, $admins)) {
      echo "<p style='color: red;'>Willst du wirklich Benutzer " . adminName($id) . " löschen?</p>";
      echo "<form action='userActions.php' method='post'>";
      echo "<input type='hidden' name='deleteUser' value='{$id}'>";
      echo "<button type='submit' class='btn btn-danger'>Benutzer löschen</button></form>";
    } else {
      echo "Benuzter mit ID {$id} gibt es nicht.";
    }
  } else {
    echo "Kein Benutzer angegeben.";
  }
} else {
  echo "Nicht berechtigt!";
}

endPage();
?>
