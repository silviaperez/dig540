<?php
require_once('config.php');
require_once('Composer.php');
if(isset($_POST['submit'])){
  $album = new Composer($_POST['last_name'], $_POST['name'], $_POST['date_birth'], $_POST['date_dead'], $_POST['birth_country']);
  $album->create();
}
?>

<html>
  <head>
    <title>Classical Music Database: Composers.</title><br />
	<img src="Mozart.gif" width="280" height="140"><br /><br /><br />
	<body bgcolor="#F5F6CE">
	<h1>Classical Music Database: Composers.</h1>
  </head>
  <body>
    <form method="POST" action="">
      Enter the last name of your composer:
      <input type="text" name="last_name"></input><br />
            Enter the name of your composer:
      <input type="text" name="name"></input><br />
            Enter the year of birth of your composer:
      <input type="text" name="date_birth"></input><br />
			Enter the year of death of your composer:
      <input type="text" name="date_dead"></input><br />
			Enter his country of birth:
      <input type="text" name="birth_country"></input><br />
      <input type="submit" name="submit" value="submit"></input>
    </form>

<?php if(isset($album)){ ?>
    <p>The last album entered is "<?php echo $album->last_name; ?>". With this ID <?php echo $album->id ?> in this database.</p>
<?php } else {
  $album = Composer::read(1);
  ?>
    <p>The first album entered is "<?php echo $album->last_name; ?>". With this ID <?php echo $album->id ?> in this database.</p>
<?php } ?>

  </body>

</html>