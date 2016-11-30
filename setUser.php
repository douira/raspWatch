<?php
include "util.php";
setupPage("Benutzer wählen");
setupUser();
echo "<p>Als Benutzer verwenden:</p>";
userList("messages.php?userId=");
endPage();
?>