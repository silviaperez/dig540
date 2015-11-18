<?php
class Composer{
  private $id;
  private $last_name;
  private $name;
  private $date_birth;
  private $date_dead;
  private $birth_country;
  //creating a new artist. Note that we don't set ID
  public function __construct($_last_name, $_name='', $_active_years='', $_date_birth='', $_active_years='', $_date_dead='', $_birth_country=''){
    if(empty($_last_name)) return false;
	$this->last_name = $_last_name;
    $this->name = $_name;
	$this->date_birth = $_date_birth;
    $this->date_dead = $_date_dead;
    $this->birth_country = $_birth_country;
  }
  //read an artist from the database
  public static function read($id){
    global $db;
    if($db){
      $q = $db->prepare('SELECT * FROM `composer` WHERE id = ?');
      $q->execute(array($id));
      if($item = $q->fetch()){
        $composer = new Composer($item['last_name'], $item['name'], $item['date_birth'], $item['date_dead'], $item['birth_country']);
        $composer->setID($item['id']);
        return $item;
      }
    }
    return false;
  }
  //save to the database
  public function create(){
    global $db;
    //Make sure we have a database to talk to
    if($db){
      $db->beginTransaction();
      $q = $db->prepare('INSERT INTO `composer` (last_name, name, date_birth, date_dead, birth_country) VALUES (?, ?, ?, ?, ?)');
      try{
        $q->execute(array($this->last_name, $this->name, $this->date_birth, $this->date_dead,$this->birth_country));
      } catch(PDOException $e) {
        print_r($e);
        $db->rollback();
        return false;
      }
      $this->id = $db->lastInsertId();
      $db->commit();
      return true;
    }
    return false;
  }
 
    //fill in the blanks
	public function update($id, $last_name){
	global $db;
	if ($db){
	$db->beginTransaction();
	$q = $db->prepare('UPDATE  FROM `composer` SET last_name = :newLastName WHERE id = :$newID');
	$query->execute(array(':newLastName' => $newLastName, ':id' => $newID));
	$query->close();
	}	
}
	
	public function delete($id){
	global $db;
	if ($db){
	$db->beginTransaction();	
	$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);	
	$q = $db->prepare('DELETE FROM `composer` where id = :$id');
	$query->execute(array(':id' => $id));
	}
}
	
  //Get a list of all artist names and IDs. HINT: there is a method in PDO
  //called fetchAll that is kind of like fetch...
    
    public static function composer_list($last_name,$id){
	global $db;
	if($db){
		$q = $db->prepare('SELECT FROM `composer` WHERE last_name = ? AND id = ?');
		$q->execute (array($last_name, $id));
		if($item = $q->fechtAll()){
		$composer = new Composer ($item['last_name'], $item['id)']);
		return $item;
		}
	}
	return false;
	}
	
  
  //Find a list of artists matching a certain name. HINT: fetchAll is useful...
  public static function find($last_name){
	global $db;
	if($db){
		$q = $db->prepare('SELECT FROM `composer` WHERE last_name = $_last_name');
		$q->execute (array($last_name));
		if($item = $q->fechtAll()){
		$composer = new Composer ($item['last_name']);
		return $item;
		}
	}
	return false;
	}
		  
  
  //These are all standard getters and setters
  public function setID($newID){
    if(empty($newID)) return false;
    $this->id = $newID;
    return $this->id;
  }
  public function getID(){
    return $this->id;
  }
  public function setCountry($newCountry){
    if(empty($newCountry)) return false;
    $this->birth_country = $newCountry;
    return $this->birth_country;
  }
  public function getCountry(){
    return $this->birth_country;
  }
  public function setLastName ($newLastName){
    if(empty($newLastName)) return false;
    $this->last_name = $newLastName;
    return $this->last_name;
  }
  public function getLastName(){
    return $this->last_name;
  }
  public function setName($newName){
    if(empty($newName)) return false;
    $this->name = $newName;
    return $this->name;
  }
  public function getName(){
    return $this->name;
  }
  public function setBirth($newBirth){
    if(empty($newBirth)) return false;
    $this->date_birth = $newBirth;
    return $this->date_birth;
  }
  public function getBirth(){
    return $this->date_birth;
  }
  public function setDeath($newDeath){
    if(empty($newDeath)) return false;
    $this->date_dead = $newDeath;
    return $this->date_dead;
  }
  public function getDeath(){
    return $this->date_dead;
  }
}
?>