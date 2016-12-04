<?php
include "util.php";
setupPage("Benutzer wählen");

echo "<p>Als Benutzer verwenden:</p>";
userList("messages.php?userId=");
endPage();
?>
