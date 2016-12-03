<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="author" content="Christopher Walther">
  <meta name="editor" content="brackets">
</head>
<body>
  <p>RaspWatch data device interface page</p>
  <p>See <a href="testData.json">testData.json</a> for format of JSON protocol.</p>
  <?php
  include "util.php";
  
  $_POST["data"] = file_get_contents("testData.json");
  if (empty($_POST["data"])) {
    endWithError("No status data received!");
  }
  $testData = false;
  if (! empty($_GET["test"]) && $_GET["test"] > 0) {
    $testData = true;
  }
  
  $data = json_decode($_POST["data"]);
  if ($testData) {
    $data->ip = 1;
    $data->memory = rand(0, 100000);
  } else {
    $data->ip = ip2long($_SERVER['REMOTE_ADDR']);
    if ($data->ip == -1 || $data->ip === false) {
      endWithError("IP address '{$data->ip}' '{$_SERVER['REMOTE_ADDR']}' faulty.");
    }
  }
  $data->time = time();
  $moduleNameIdMap = [];
  query("SELECT * FROM module");
  while($row = mysqli_fetch_assoc($queryResult)) {
    $moduleIdNameMap[$row["name"]] = $row["id"];
  }
  query("INSERT INTO status VALUES (" . $data->ip . "," . $data->time . "," . $data->memory . ")");
  $moduleId = 0;
  foreach ($data->messages as $moduleName => $moduleData) {
    $moduleId = $moduleIdNameMap[$moduleName];
    foreach ($moduleData as $message) {
      if ($testData) {
        //insert test data
        $status = rand(0, 4);
        query("INSERT INTO messages VALUES (0," . rand(1, 10) . "," . $message->time . "," . $message->typeId . "," . $moduleId . ",'" . mysqli_real_escape_string($dbConn, $message->text) . "'," . $status . "," . ($status == 0 ? 1 : rand(2, 4)) . ",'')");
      } else {
        //insert all of the received data
        query("INSERT INTO messages VALUES (0," . $data->ip . "," . $message->time . "," . $message->typeId . "," . $moduleId . ",'" . mysqli_real_escape_string($dbConn, $message->text) . "',0,1,'')"); //status 0 and no assignee (id 1)
      }
    }
  }
  endPage();
  ?>
