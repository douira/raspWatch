<?php
include "util.php";
setupPage("Benutzeraktionen");

if (permIsHigh($userPerm)) {
  if (! empty($_POST["email"])) {
    $email = filter_var($_POST["email"], FILTER_SANITIZE_EMAIL);
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
      query("UPDATE admin SET email={$email} WHERE id={$userId}");
      makeAlert("Email zu '{$email}' geändert", "sucess", "Erfolg!");
    } else {
      makeAlert("Email '{$email}' ungültig", "danger", "Fehler!");
    }
  }
  deleteUser();
  echo "<h4>Email ändern</h4>";
  echo "<form action='userActions.php' method='post'><div class='form-group'>
    <label for='email'>Neue E-Mail-Adresse für diesen Benutzer</label>
    <input type='email' class='form-control' name='email' id='email' value='" . adminEmail($userId) . "'>
    <br>
    <button type='submit' class='btn btn-primary'>Ändern</button>
    </div></form>";
  echo "<h4 class='text-danger'>Benutzer löschen</h4>";
  userList("deleteUser.php?deleteUser=");
} else {
  makeAlert("<a href='" . authURL() . "'>Authentifizierung</a> erforderlich", "info", "Info:");
}
endPage();
?>
