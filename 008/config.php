<?php
$dsn = 'mysql:dbname=spanishi_classicalmusic;host=localhost;port=3306';
$name = 'spanishi_silvia';
$pass = 'xxxxxxx5';
$db=false;
//Connect to the database
try {
    $db = new PDO($dsn, $name, $pass);
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    die('Could not connect to the database:<br/>' . $e);
}
?>