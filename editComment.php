<?php
include "util.php";
setupUserData();

//check if usr is allowed to edit comments
if (permIsHigh($userPerm)) {
  //edit comment if id and data given
  if (! empty($_POST["id"]) && ! empty($_POST["data"])) {
    //send comment to database
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
