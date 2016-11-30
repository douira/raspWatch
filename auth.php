<?php
include "util.php";
setupPage("Authentifizierung");
setupUser();
if (permIsHigh($userPerm)) {
  echo "<h3>Schon authentifiziert.</h3>";
} else if (! permIsHigh(adminGetPerm($userId))) {
  echo "<h3>Benutzer ist nicht Administrator.</h3>";
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