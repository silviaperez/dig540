<?php
	class Record{
		private $name;
		private $title;
		private $description;
		public function setName ($name){
			//error checking happens here
			$this->name = $name;
		}
		public function getName(){
		
    		echo $this->name;
  }	
	}
?>