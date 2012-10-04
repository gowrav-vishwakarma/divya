<?php

class Model_Page extends Model_Table {
	var $table= "jos_xpages";
	// var $title_field='alias';
	function init(){
		parent::init();
		$this->hasOne('Distributor','alias_for_id');
		$this->addField('alias');
		$this->addField('matter')->display(array('form'=>'text','grid'=>'shorttext'));

		$this->addExpression('intro')->set('concat(LEFT(matter,30),"...")');

	}
}