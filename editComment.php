<?php
include "util.php";
setupUserData();
if (permIsHigh($userPerm)) {
  if (! empty($_POST["id"]) && ! empty($_POST["data"])) {
    query("UPDATE messages SET comment='" . mysqli_real_escape_string($dbConn, $_POST["data"]) . " WHERE id={$_POST["id"]}");
    echo "OK";
  } else {
    echo "EROOR: Data faulty/now given!";
  }
} else {
  echo "ERROR: Not authenticated!".
}
endPage();
?>
