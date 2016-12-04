<?php
include "util.php";
setupPage("Passwort ändern");

if (! permIsHigh($userPerm)) {
  loginPlease();
} else {
  $pswdSetSuccess = false;
  if (! empty($_POST["pswdSet"]) && ! empty($_POST["pswdRep"])) {
    $newPswd = $_POST["pswdSet"];
    if ($newPswd === $_POST["pswdRep"]) {
      if (strlen($newPswd) >= 8) {
        $pswdSetSuccess = true;
        query("UPDATE admin SET password={$newPswd} WHERE id={$userId}");
        makeAlert("Passwort geändert", "success", "Erfolg!");
      } else {
        makeAlert("Das Passwort ist zu kurz. Passwörter müssen mindestens 8 Zeichen lang sein.", "warning", "Warnung:");
      }
    } else {
      makeAlert("Passwörter stimmen nicht überein", "warning", "Warnung:");
    }
  }
  if (! $pswdSetSuccess) {
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
