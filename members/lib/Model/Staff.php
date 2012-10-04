<?php
class Model_Staff extends Model_Table{
	var $table="jos_xstaff";
	function init(){
		parent::init();
		$this->addField('username');
		$this->addField('password');
		$this->addField('AccessLevel');
		
	}
}