<?php 
class Model_UsedPin extends Model_Pin{
	function init(){
		parent::init(){
			$this->hasMany('Distributor','pin_id');
			$this->addCondition('is_used',true);
		}
	}
}