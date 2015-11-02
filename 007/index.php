<!DOCTYPE HTML>

<html>

<head>
		<title>PHP exercise.</title><br />
		<img src="PHP2.gif" width="280" height="140"><br /><br /><br />
<body bgcolor="#F5F6CE">
<h1>Record Info</h1>

</head>
<br>
<br>

<body>
<form method="POST" action="">

	<p>
		<label for="name">Name:</label>
		<input type="text" name="name" id="name">
	</p>
	<p>
		<label for="title">Title:</label>
		<input type="text" name="title" id="title">
	</p>
	<p>
		<label for="description">Description:</label>
		<textarea name="description" id="description"></textarea>
	</p>
	<p>
		<input type="submit" name="send" id="send" value="Send">
	</p>
</form>


<pre>
	
	<?php
	require_once('Record.php');
	if(isset($_POST['name']) && $_POST['name'] != ''){
      		$myRecord = new Record();
      		$myRecord->setName($_POST['name']);
      	echo "The name of this record  is: ";
      		$myRecord->getName();
    } else {
      echo "Please enter the name of your record!";
    }
  
?>
</pre>

</body>
</html>