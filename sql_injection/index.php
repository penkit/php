<?php
// DB variables
$user = $_ENV["MYSQL_USER"];
$pass = $_ENV["MYSQL_PASSWORD"];
$host = $_ENV["MYSQL_HOST"];
$db = $_ENV["MYSQL_NAME"];

// Connect to DB
$mysqli = new mysqli($host, $user, $pass, $db);

// Check DB connection
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

// If the user performs a search...
if( $_GET["id"] != NULL ){

  // Increment the view_count by 1
  $query = "UPDATE animals SET view_count = view_count + 1 WHERE id = " . $_GET["id"] . ";";
  // Search for the animal
  $query .= "SELECT * FROM animals WHERE id = ". $_GET["id"] . ";";

  // Perform query
  if ($mysqli->multi_query($query)) {
    // Cycles through results
    do {
      if ($result = $mysqli->store_result()) {
        while ($row = $result->fetch_row()) {
          // Display results
          echo "Name: " . $row[1];
          echo "<br/>";
          echo "Number of times searched: " . $row[2];
        }
        $result->free();
      }
    } while ($mysqli->next_result());
  }
}

?>
<h1>ANIMAL NUMBERS!</h1>
<p>Give a number, get an animal!</p>
<form action="/" method="get">
  Name: <input type="text" name="id"><br>
  <input type="submit">
</form>