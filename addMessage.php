<?php
include "util.php";
setupPage("Nachricht hinzufügen");
setupUser();
if (! empty($_POST["message"])) {
  $ip = roomIpFromName($_POST["room"]);
  if (! $ip) {
    $ip = 0; //will be 'unknown room'
  }
  $typeId = typeIdFromName($_POST["type"]);
  if (! $typeId) {
    $typeId = 0;
  }
  $moduleId = moduleId($_POST["module"]);
  if (! $moduleId) {
    $moduleId = 0;
  }
  query("INSERT INTO messages VALUES (0," . $ip . "," . time() . "," . $typeId . "," . $moduleId . ",'" . mysqli_real_escape_string($dbConn, $_POST["message"]) . "',0,1," . mysqli_real_escape_string($dbConn, $_POST["comment"]) . ")");
}
?>
<h3>Dateneingabe</h3>
<p>Werte nicht verändern, wenn darüber nichts bekannt ist.</p>
<div class="container">
  <form action="addMessage.php" method="post">
    <div class="form-group row">
      <label class="col-sm-1 col-form-label" for="room">Raum</label>
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
      <label class="col-sm-1 col-form-label" for="type">Art</label>
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
      <label class="col-sm-1 col-form-label" for="module">Modul</label>
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
      <label class="col-sm-1 col-form-label" for="message">Nachricht</label>
      <div class="col-sm-6">
        <textarea name="message" class="form-control" id="message" rows="3"></textarea>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-1 col-form-label" for="comment">Kommentar</label>
      <div class="col-sm-6">
        <textarea name="comment" class="form-control" id="comment" rows="3"></textarea>
      </div>
    </div>
    <div class="form-group row">
      <div class="offset-sm-1 col-sm-6">
        <button type="submit" class="btn btn-primary" aria-describedby="info">Absenden</button>
        <small id="info" class="form-text text-muted">Alle Werte außer der Kommentartext können nicht verändert werden.</small>
      </div>
    </div>
  </form>
</div>
<?php
endPage();
?>
