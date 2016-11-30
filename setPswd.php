<?php
include "util.php";
setupPage("Passwort ändern");
setupUser();
if (! permIsHigh($userPerm)) {
  loginPlease();
} else {
  $pswdSetSucess = false;
  if (! empty($_POST["pswdSet"]) && ! empty($_POST["pswdRep"])) {
    if ($_POST["pswdSet"] === $_POST["pswdRep"]) {
      $pswdSetSucess = true;
      query("UPDATE admin SET password={$_POST["pswdSet"]} WHERE id={$userId}");
      echo "<h3>Passwort geändert!</h3>";
    } else {
      echo "<h3>Passwörter stimmen nicht überein!</h3>";
    }
  }
  if (! $pswdSetSucess) {
    if (empty($_GET["backto"])) {
      $_GET["backto"] = "messages.php";
    }
    echo "<p><a href='https://www.bsi-fuer-buerger.de/BSIFB/DE/Empfehlungen/Passwoerter/passwoerter_node.html'>Tips für sichere Passwörter</a></p>";
    echo "<form action='setPswd.php' method='post'><div class='form-group'>
      <label for='pswdSet'>Neues Passwort</label>
      <input type='password' class='form-control' name='pswdSet' id='pswdSet' placeholder='passwort'>
      <label for='pswdRep'>Passwort wiederholen</label>
      <input type='password' class='form-control' name='pswdRep' id='pswdRep' placeholder='nochmal eingeben'>
      <br>
      <button type='submit' class='btn btn-primary'>Senden</button>
      </div></form>";
  }
}
endPage();
?>