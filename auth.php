<?php
include "util.php";
setupPage("Authentifizierung");
setupUser();
if (permIsHigh($userPerm)) {
  makeAlert("Schon authentifiziert", "info", "Info:");
} else if (! permIsHigh(adminGetPerm($userId))) {
  makeAlert("Benutzer ist nicht Administrator und kann nicht authentifiziert werden.", "warning", "Warnung:");
} else {
  echo "<h3>Anmelden:</h3>";
  if (empty($_GET["backto"])) {
    $_GET["backto"] = "messages.php";
  }
  echo "<form action='{$_GET["backto"]}' method='post'><div class='form-group'>
    <label for='userName'>Benuztername</label>
    <input type='text' class='form-control' name='userName' id='userName' value='{$userName}'>
    <label for='pswd'>Passwort</label>
    <input type='password' class='form-control' name='pswd' id='pswd' placeholder='Administratorpasswort'>
    <br>
    <button type='submit' class='btn btn-primary'>Anmelden</button>
    </div></form>";
}
endPage();
?>
