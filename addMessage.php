<?php
include "util.php";
setupPage("Neue Nachricht");

if (! empty($_POST["message"])) {
  //get type id, reverse lookup
  if (empty($_POST["room"])) {
    $ip = 1; //room with ip 1, ip 0 is now shown
  } else {
    $ip = roomIpFromName($_POST["room"]);
  }

  //get type id, reverse lookup
  if (empty($_POST["type"])) {
    $typeId = 0;
  } else {
    $typeId = typeIdFromName($_POST["type"]);
  }

  //get module id, reverse lookup
  if (empty($_POST["module"])) {
    $moduleId = 0;
  } else {
    $moduleId = moduleId($_POST["module"]);
  }

  //fill with empty string if actually empty
  if (empty($_POST["comment"])) {
    $_POST["comment"] = "";
  }

  //query index of next inserted message
  query("
    SELECT `AUTO_INCREMENT`
    FROM  INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'rasp_watch'
    AND   TABLE_NAME   = 'messages';
  ");

  //get index at which the message will be inserted for displaying a link to the added message
  $insertIndex = mysqli_fetch_assoc($queryResult)["AUTO_INCREMENT"];

  //add message with auto increment index (0), status 0 (unassigned) and assignee 1 (none), escape strings where necessary
  query("INSERT INTO messages VALUES (0," . $ip . "," . time() . "," . $typeId . "," . $moduleId . ",'" . mysqli_real_escape_string($dbConn, $_POST["message"]) . "',0,1,'" . mysqli_real_escape_string($dbConn, $_POST["comment"]) . "')");
  makeAlert("<a href='messageSingle.php?id={$insertIndex}'>Nachricht</a> wurde hinzugefügt", "sucess", "Erfolg!");
}
?>
<h3>Dateneingabe</h3>
<p>Werte nicht verändern, wenn darüber nichts bekannt ist.</p>
<div class="container">
  <form action="addMessage.php" method="post">
    <div class="form-group row">
      <label class="col-sm-2 col-form-label" for="room">Raum</label>
      <div class="col-sm-6">
        <select name="room" class="form-control" id="room">
          <?php
          getRooms();
          foreach ($rooms as $roomName) {
            echo "<option>{$roomName}</option>";
          }
          ?>
        </select>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label" for="type">Art</label>
      <div class="col-sm-6">
        <select name="type" class="form-control" id="type">
          <?php
          getTypes();
          foreach ($types as $typeName) {
            echo "<option>{$typeName}</option>";
          }
          ?>
        </select>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label" for="module">Modul</label>
      <div class="col-sm-6">
        <select name="module" class="form-control" id="module">
          <?php
          getModules();
          foreach ($modules as $moduleName) {
            echo "<option>{$moduleName}</option>";
          }
          ?>
        </select>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label" for="message">Nachricht</label>
      <div class="col-sm-6">
        <textarea name="message" class="form-control" id="message" rows="3"></textarea>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label" for="comment">Kommentar</label>
      <div class="col-sm-6">
        <textarea name="comment" class="form-control" id="comment" rows="3"></textarea>
      </div>
    </div>
    <div class="form-group row">
      <div class="offset-sm-2 col-sm-6">
        <button type="submit" class="btn btn-primary" aria-describedby="info">Absenden</button>
        <small id="info" class="form-text text-muted">Alle Werte außer der Kommentartext können nicht verändert werden.</small>
      </div>
    </div>
  </form>
</div>
<?php
endPage();
?>
