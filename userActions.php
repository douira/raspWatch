<?php
include "util.php";
setupPage("Benutzeraktionen");
setupUser();
if (permIsHigh($userPerm)) {
  if (! empty($_POST["email"])) {
    $email = filter_var($_POST["email"], FILTER_SANITIZE_EMAIL);
    echo "<p>";
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
      query("UPDATE admin SET email={$email} WHERE id={$userId}");
      echo "Email zu '{$email}' geändert!";
    } else {
      echo "Email '{$email}' ungültig!";
    }
    echo "</p>";
  }
  deleteUser();
  echo "<br><h4>Email ändern</h4>";
  echo "<form action='userActions.php' method='post'><div class='form-group'>
    <label for='email'>Neue E-Mail-Adresse für diesen Benutzer</label>
    <input type='email' class='form-control' name='email' id='email' value='" . adminEmail($userId) . "'>
    <br>
    <button type='submit' class='btn btn-primary'>Ändern</button>
    </div></form>";
  echo "<h4>Benutzer löschen</h4>";
  userList("deleteUser.php?deleteUser=");
}
if (userNeedsAuth()) {
  echo "<h4><a href='" . authURL() . "'>Anmelden</a></h4>";
}
echo "<br><h4><a href='setUser.php'>Benutzer wechseln</a></h4>";
endPage();
?>