<?php
include "util.php";
setupUserData();
if (! empty($_POST["id"]) && ! empty($_POST["data"]) && permIsHigh($userPerm)) {
  query("UPDATE messages SET comment='" . mysqli_real_escape_string($dbConn, $_POST["data"]) . " WHERE id={$_POST["id"]}");
  echo "OK";
}
?>