<?php
if (__FILE__ == realpath($_SERVER['SCRIPT_FILENAME'])) {
  header("Location: index.php", true, 301);
  die("untilphp is not to be acessed directly!");
}
session_start();
$userId = 1;
$userName;
$userPerm = 0;
$userPermName;
$queryResult;
$pageLength = 25;
$pageNum = 0;

//called at the start of all pages, sets up the html of pages
function setupPage($pageName, $pageTitle = false, $insertBefore = "") {
  if (! $pageTitle) {
    $pageTitle = $pageName;
  }
  echo "<!DOCTYPE html>
<html>
<head>
  <title>{$pageName} | RaspWatch</title>
  <meta charset='utf-8'>
  <meta name='author' content='Christopher Walther'>
  <meta name='editor' content='brackets'>
  <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css' integrity='sha384-2hfp1SzUoho7/TsGGGDaFdsuuDL0LX2hnUp6VkX3CUQ2K4K+xjboZdsXyp4oUHZj' crossorigin='anonymous'>
  <link rel='stylesheet' type='text/css' href='style.css'>
</head>
<body>
  {$insertBefore}<h1>{$pageName}</h1><a href='index.php'>Startseite</a>";
}

//called at end of all pages to end the html and do cloaing actions
function endPage() {
  global $dbConn;
  echo "</body></html>";
  mysqli_close($dbConn);
}

//prints the user info string given back by setupUserData
function setupUser() {
  echo setupUserData();
}

//sets up the user in session and glbal variables
function setupUserData() {
  global $userId;
  global $userName;
  global $userPermName;
  global $userPerm;
  
  //sets user wiwth ids given in get or post
  if (! empty($_GET["userId"])) {
    setUser($_GET["userId"]);
  } else if (! empty($_POST["userName"])) {
    setUser($_POST["userName"], true);
  } else if (! empty($_SESSION["userId"])) {
    setUser($_SESSION["userId"], false, true);
  } else {
    setUser(1);
  }
  
  //authenticates users that entered their password and are high permission admins
  if (permIsHigh(adminGetPerm($userId)) && ! empty($_POST["pswd"])) {
    global $queryResult;
    query("SELECT password FROM admin WHERE id={$userId}");
    $userPswd = mysqli_fetch_assoc($queryResult)["password"];
    if (count($userPswd) > 0) {
      if ($userPswd == $_POST["pswd"]) {
        authUser();
      } else {
        echo "<h3>Passwort falsch!</h3>";
      }
    }
  }
  
  //copy permission name string to local variable
  $userPermName = permName($userPerm);
  
  //create user info and a few short actions
  $str = "<div style='flow: right; text-align:right;'>";
  if ($userId == 1) {
    $str .= "<a href='setUser.php'>Benutzer wählen</a>";
  } else {
    $str .= "{$userPermName}: <a href='user.php'>{$userName}</a> |";
    $str .= " <a href='userActions.php'>Aktionen</a>";
  }
  if (userNeedsAuth($userId)) {
    $str .= " | <a href='" . authURL() . "'>anmelden</a>";
  }
  $str .= "</div>";
  
  //return that string, to be printed in setupUser or printed sometime else when necessary
  return $str;
}

//connect to the database and print errors if there are any
$dbConn = mysqli_connect("localhost", "raspWatch", "jUrk9mlKNdG0upfz", "rasp_watch");
if (mysqli_connect_errno()) {
  echo "<br>Failed to connect to MySQL: " . mysqli_connect_error();
}
mysqli_set_charset($dbConn, "utf8");

//query puts result into this
$queryResult = false;

//sends a database query to the database server and puts it into queryResult
function query($queryString, $logQuerySuccess = false) {
  global $dbConn;
  global $queryResult;
  $queryResult = mysqli_query($dbConn, $queryString);
  if ($queryResult) {
    if ($logQuerySuccess) {
      echo "<br>Sucessfully executed {$queryString}";
    }
  } else {
    exit("<br>MySQL query error: " . mysqli_error($dbConn));
  }
}

//returns true if the user can be authenticated but hasn't yet (is high perm user)
function userNeedsAuth() {
  global $userId;
  global $userPerm;
  return permIsHigh(adminGetPerm($userId)) && ! permIsHigh($userPerm);
}

//returns a url to authenticate and then go back to the current page
function authURL() {
  //auth page will send user back to url given in backto
  return "auth.php?backto={$_SERVER['REQUEST_URI']}";
}

//stops page execution with an error, also closes database
function endWithError($errorString) {
  global $dbConn;
  mysqli_close($dbConn);
  exit("<br>ERROR: " . $errorString);
}

//sets the current user (and attributes such as name and perm) for the page in session and global variables
function setUser($value, $isName = false, $keepAuth = false) {
  global $userId;
  global $userName;
  if ($isName) {
    $userName = $value;
    $userId = adminId($userName);
  } else {
    $userId = $value;
    $userName = adminName($userId);
  }
  $_SESSION["userId"] = $userId;
  if ($keepAuth && ! empty($_SESSION["auth"]) && $_SESSION["auth"]) {
    authUser();
  } else {
    $_SESSION["auth"] = false;
  }
}

//sets the user as authenticated, called after password verification
function authUser() {
  global $userPerm;
  global $userPermName;
  global $userId;
  $userPerm = adminGetPerm($userId);
  $userPermName = permName($userPerm);
  $_SESSION["auth"] = true;
}

//returns a 2D array from a query
function queryToRows($queryString) {
  $rows = [];
  global $queryResult;
  query($queryString);
  while($row = mysqli_fetch_assoc($queryResult)) {
    array_push($rows, $row);
  }
  return $rows;
}

//returns string to be displayed to user in tables for given value and datatype
function getAttribText($message, $name, $textShorten = 0) {
  $str = $message[$name];
  switch ($name) {
    case "ip":
      $str = makeNonBreaking(roomName($message[$name]));
      break;
    case "assignee":
      $str = makeNonBreaking(adminName($message[$name]));
      break;
    case "typeId":
      $str = typeName($message[$name]);
      break;
    case "moduleId":
      $str = moduleName($message[$name]);
      break;
    case "statusId":
      $str = makeNonBreaking(statusName($message[$name]));
      break;
    case "time":
      $str = makeNonBreaking(messageTime($message));
      break;
    case "message":
      $str = $textShorten > 0 ? mb_strimwidth($message["message"], 0, 200, "...") : $message["message"];
      $str = htmlspecialchars($str);
      break;
  }
  return $str;
}

//names of databse attribs for user
$attribNames = [
  "id" => "#",
  "ip" => "Raum",
  "typeId" => "Art",
  "moduleId" => "Modul",
  "statusId" => "Status",
  "assignee" => "Beauftragter",
  "time" => "Zeitstempel",
  "message" => "Nachricht"
];
function messageCmpAttribValue($message, $cmpAttrib) {
  switch ($cmpAttrib) {
    case "assignee":
      return adminName($message[$cmpAttrib]);
      break;
    case "typeId":
      return typeName($message[$cmpAttrib]);
      break;
    case "moduleId":
      return moduleName($message[$cmpAttrib]);
      break;
    case "ip":
      global $rooms;
      if (empty($rooms)) {
        getRooms();
      }
      if (array_key_exists($message["ip"], $rooms)) {
        return $rooms[$message["ip"]];
      } else {
        return "a" . $message["ip"];
      }
      break;
    default:
      return $message[$cmpAttrib];
  }
}
function getMessageAttribCmp($cmpAttribs, $directions) {
  return function($message1, $message2) use ($cmpAttribs, $directions) {
    $attribIndex = 0;
    $attribLength = count($cmpAttribs);
    while ($attribIndex < $attribLength && messageCmpAttribValue($message1, $cmpAttribs[$attribIndex]) == messageCmpAttribValue($message2, $cmpAttribs[$attribIndex])) {
      $attribIndex ++;
    }
    if ($attribIndex === $attribLength) {
      return 0;
    } else {
      return strnatcmp(messageCmpAttribValue($message1, $cmpAttribs[$attribIndex]), messageCmpAttribValue($message2, $cmpAttribs[$attribIndex])) * $directions[$cmpAttribs[$attribIndex]];
    }
  };
}
function pageUrl($page) {
  $urlQuery = $_GET;
  $urlQuery["page"] = $page;
  return $_SERVER['PHP_SELF'] . "?" . http_build_query($urlQuery);
}
function messageTable($messageArray, $hideAttribs = [],  $orderByAttribs = ["ip", "statusId", "time", "assignee", "typeId"]) {
  global $attribNames;
  $directions = [];
  foreach ($orderByAttribs as $index => $attrib) {
    if (mb_substr($attrib, -1) === "D") {
      $orderByAttribs[$index] = mb_substr($attrib, 0, -1);
      $directions[$orderByAttribs[$index]] = -1;
    } else {
      $directions[$attrib] = 1;
    }
  }
  $orderByAttribs = array_values(array_diff($orderByAttribs, $hideAttribs));
  array_push($hideAttribs, $orderByAttribs[0]);

  usort($messageArray, getMessageAttribCmp($orderByAttribs, $directions));
  global $pageLength;
  global $pageNum;
  if (! empty($_GET["page"])) {
    $pageNum = $_GET["page"];
  }
  if (! empty($_GET["pageL"])) {
    $pageLength = $_GET["pageL"];
  }
  $origMessageLength = count($messageArray);
  $messageArray = array_slice($messageArray, $pageNum * $pageLength, $pageLength);
  
  if (count($messageArray) == 0) {
    echo "<p><em>Keine</em></p>";
  } else {
    echo "<table class='table table-sm messageTable'><thead class='thead-default'><tr>";
    foreach ($attribNames as $attrib => $name) {
      if (! in_array($attrib, $hideAttribs)) {
        echo "<th>" . $name . "</th>";
      }
    }
    echo "</tr></thead><tbody class='table-hover'>";
    $lastGroupValue = "";
    foreach ($messageArray as $message) {
      if ($message[$orderByAttribs[0]] != $lastGroupValue) {
        $lastGroupValue = $message[$orderByAttribs[0]];
        echo "<tr><td colspan='7'><b>" . getAttribText($message, $orderByAttribs[0], 40) . "</b></td></tr>";
      }
      echo "<tr class='" . statusBName($message["statusId"]) . "' onclick='document.location = \"messageSingle.php?id={$message["id"]}\";'>";
      foreach ($attribNames as $attrib => $value) {
        if (! in_array($attrib, $hideAttribs)) {
          echo "<td>" . getAttribText($message, $attrib, 100) . "</td>";
        }
      }
      echo "</tr>";
    }
    echo "</tbody></table>";
  }
  global $pageNum;
  echo "<p class='text-xs-center'><b>";
  $startArrows = false;
  if ($pageNum > 0) {
    if ($pageNum > 1) {
      echo "<a href='" . pageUrl(0) . "'>&lt;&lt;</a> ";
    }
    echo "<a href='" . pageUrl($pageNum - 1) . "'>&lt;</a>";
    echo " | ";
  }
  echo "Seite {$pageNum}";
  if ($origMessageLength > ($pageNum + 1) * $pageLength) {
    echo " | ";
    echo "<a href='" . pageUrl($pageNum + 1) . "'>&gt;</a>";
    if ($origMessageLength > ($pageNum + 2) * $pageLength) {
      echo " <a href='" . pageUrl(floor($origMessageLength / $pageLength)) . "'>&gt;&gt;</a>";
    }
  }
  echo "</b></p>";
}
function makeNonBreaking($str) {
  return str_replace(" ", "&nbsp;", $str);
}
function getModules() {
  global $modules;
  global $queryResult;
  $modules = [];
  query("SELECT * FROM module");
  while ($row = mysqli_fetch_assoc($queryResult)) {
    $modules[$row["id"]] = $row["name"];
  }
}
function moduleName($moduleId) {
  global $modules;
  if (empty($modules)) {
    getModules();
  }
  return $modules[$moduleId];
}
function getTypes() {
  global $types;
  global $queryResult;
  $types = [];
  query("SELECT * FROM type");
  while ($row = mysqli_fetch_assoc($queryResult)) {
    $types[$row["id"]] = $row["name"];
  }
}
function typeName($typeId) {
  global $types;
  if (empty($types)) {
    getTypes();
  }
  return $types[$typeId];
}
function getStatusNames() {
  global $statusNames;
  global $queryResult;
  $statusNames = [];
  query("SELECT * FROM messagestatus");
  while ($row = mysqli_fetch_assoc($queryResult)) {
    $statusNames[$row["id"]] = (object) [
      "name" => $row["name"],
      "bName" => $row["bootstrapName"],
      "tagName" => $row["tagName"]
    ];
  }
}
function statusName($statusId) {
  global $statusNames;
  if (empty($statusNames)) {
    getStatusNames();
  }
  return $statusNames[$statusId] -> name;
}
function statusBName($statusId) {
  global $statusNames;
  if (empty($statusNames)) {
    getStatusNames();
  }
  return $statusNames[$statusId] -> bName;
}
function statusTagName($statusId) {
  global $statusNames;
  if (empty($statusNames)) {
    getStatusNames();
  }
  return $statusNames[$statusId] -> tagName;
}
function getRooms() {
  global $rooms;
  global $queryResult;
  $rooms = [];
  query("SELECT * FROM room");
  while ($row = mysqli_fetch_assoc($queryResult)) {
    $rooms[$row["ip"]] = $row["number"];
  }
}
function roomName($ip) {
  global $rooms;
  if (empty($rooms)) {
    getRooms();
  }
  if (array_key_exists($ip, $rooms)) {
    return "Raum {$rooms[$ip]}";
  } else {
    return "<em>unbekannter Raum IP: </em>" . long2ip($ip);
  }
}
function roomNameSimple($ip) {
  global $rooms;
  if (empty($rooms)) {
    getRooms();
  }
  if (array_key_exists($ip, $rooms)) {
    return "Raum {$rooms[$ip]}";
  } else {
    return "unbekannter Raum IP: " . long2ip($ip);
  }
}
function roomIpFromName($number) {
  global $rooms;
  if (empty($rooms)) {
    getRooms();
  }
  $ip = false;
  if (! empty($number)) {
    $ip = array_search($number, $rooms);
  }
  return $ip; //returns false on error
}
function typeId($name) {
  global $types;
  if (empty($types)) {
    getTypes();
  }
  $id = false;
  if (! empty($name)) {
    $id = array_search($name, $types);
  }
  return $id; //returns false on error
}
function moduleId($name) {
  global $modules;
  if (empty($modules)) {
    getModules();
  }
  $id = false;
  if (! empty($name)) {
    $id = array_search($name, $modules);
  }
  return $id; //returns false on error
}
function getAdmins() {
  global $admins;
  global $queryResult;
  global $perms;
  global $emails;
  $admins = [];
  query("SELECT id, name, perm, email FROM admin");
  while ($row = mysqli_fetch_assoc($queryResult)) {
    $admins[$row["id"]] = $row["name"];
    $perms[$row["id"]] = $row["perm"];
    if (permIsHigh($row["perm"])) {
      $emails[$row["id"]] = $row["email"];
    }
  }
}
function adminName($id) {
  global $admins;
  if (empty($admins)) {
    getAdmins();
  }
  if ($id == 1) {
    return "<em>keiner</em>";
  } else {
    return array_key_exists($id, $admins) ? $admins[$id] : "<em>unbekannt</em>";
  }
}
function adminId($name) {
  global $admins;
  if (empty($admins)) {
    getAdmins();
  }
  $id = false;
  if (! empty($name)) {
    $id = array_search($name, $admins);
  }
  return $id ? $id : 1; //1 as default
}
function adminGetPerm($id) {
  global $perms;
  if (empty($perms)) {
    getAdmins();
  }
  return array_key_exists($id, $perms) ? $perms[$id] : 0;
}
function adminEmail($id) {
  global $emails;
  if (empty($emails)) {
    getAdmins();
  }
  return array_key_exists($id, $emails) ? $emails[$id] : "";
}
function permIsHigh($permLevel) {
  return $permLevel > 0;
}
function permName($permLevel) {
  return permIsHigh($permLevel) ? "Administrator" : "Benutzer";
}
function adminGetPermName($id) {
  return permName(adminGetPerm($id));
}
function permTag($permLevel) {
  return "<span class='tag tag-pill " . (permIsHigh($permLevel) ? "tag-success" : "tag-default") . "'>" . permName($permLevel) . "</span>";
}
function formatDate($unixTime) {
  return date("D d.m.Y", $unixTime);
}
function formatTime($unixTime) {
  return date("D d.m.Y H:i:s", $unixTime);
}
function messageTime($message) {
  return formatTime($message["time"]);
}
function formatBytes($bytes, $precision = 2) { //from php.net
  $units = array('B', 'KB', 'MB', 'GB', 'TB');
  $bytes = max($bytes, 0);
  $pow = floor(($bytes ? log($bytes) : 0) / log(1024));
  $pow = min($pow, count($units) - 1);
  //alternatives
  $bytes /= pow(1024, $pow);
  //$bytes /= (1 << (10 * $pow));
  
  return round($bytes, $precision) . ' ' . $units[$pow];
}
function idsToWhere($ids) {
  $str = " WHERE ";
  if (is_array($ids)) {
    $first = true;
    foreach ($ids as $id) {
      if ($first) {
        $first = false;
      } else {
        $str .= " OR ";
      }
      $str .= "id={$id}";
    }
  } else {
    $str .= "id={$ids}";
  }
  return $str;
}
function updateTask($id, $attribValues, $whereClause = null) {
  $str = "UPDATE messages SET ";
  $first = true;
  foreach ($attribValues as $attrib => $newValue) {
    if ($first) {
      $first = false;
    } else {
      $str .= ",";
    }
    $str .= "{$attrib}='{$newValue}'";
  }
  if (is_null($whereClause)) {
    $str .= idsToWhere($id);
  } else {
    $str .= $whereClause;
  }
  //echo $str;
  query($str);
}
function bound($x, $min, $max) {
  return min(max($x, $min), $max);
} 
function getMessage($id) {
  global $queryResult;
  query("SELECT * FROM messages WHERE id='{$id}'");
  return mysqli_fetch_assoc($queryResult);
}
function unassignTask($id) {
  updateTask($id, ["assignee" => 1, "statusId" => 0]);
}
function assignTask($id, $toAdmin) {
  updateTask($id, ["assignee" => $toAdmin, "statusId" => max(1, getMessage($id)["statusId"])]);
}
function setTaskStatus($id, $newStatus, $useAdmin = null) {
  $newStatus = bound($newStatus, 0, 4);
  if ($newStatus == 0) {
    updateTask($id, ["statusId" => $newStatus, "assignee" => 1]);
  } else if (! is_null($useAdmin) && getMessage($id)["assignee"] == 1) {
    updateTask($id, ["statusId" => $newStatus, "assignee" => $useAdmin]);
  } else {
    updateTask($id, ["statusId" => $newStatus]);
  }
}
function deleteTask($id) {
  query("DELETE FROM messages WHERE id='{$id}'");
}
function userList($linkPrefix, $showAdmins = true, $showNormal = true) {
  getAdmins();
  global $admins;
  global $userId;
  echo "<div class='list-group'>";
  foreach ($admins as $adminId => $adminName) {
    $highPerm = permIsHigh(adminGetPerm($adminId));
    if ($adminId > 1 && $userId != $adminId && ($showAdmins || ! $highPerm) && ($showNormal || $highPerm)) {
      echo "<a class='list-group-item list-group-item-action' href='{$linkPrefix}{$adminId}'>";
      echo "<p class='list-group-item-text'>{$adminName} " . permTag(adminGetPerm($adminId)) . "</p>";
      echo "</a>";
    }
  }
  echo "</div>";
}
function assignList($linkPrefix, $showAdmins = true) {
  echo "<div class='col-md-4'><h3>Benutzer zuweisen</h3>";
  userList($linkPrefix . "action=assign&assignee=", $showAdmins);
  echo "</div>";
}
function loginPlease() {
  echo "Fehler: <a href='" . authURL() . "'>Authentifizierung</a> erforderlich!";
}
function deleteUser() {
  if (! empty($_POST["deleteUser"]) && $_POST["deleteUser"] > 0) {
    $id = $_POST["deleteUser"];
    echo "<p>Benutzer " . adminName($id) . " wurde gelöscht</p>";
    query("DELETE FROM admin WHERE id={$id}");
    query("UPDATE messages SET assignee=1,statusId=0 WHERE assignee={$id}");
  }
}
?>
