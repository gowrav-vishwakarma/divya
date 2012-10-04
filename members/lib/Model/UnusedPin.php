<?php
class Model_UnusedPin extends Model_Pin{
	function init(){
		parent::init(){
			$this->addCondition('is_used',false);
		}
	}
}