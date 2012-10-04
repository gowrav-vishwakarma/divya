<?php
class page_downlineview extends Page {
	function init(){
		parent::init();

		$myPath=$this->api->auth->model['Path'];

		$m=$this->add('Model_Distributor');
		$m->_dsql()->where($m->dsql()->expr("Path like '$myPath%' "));
		// $m->addCondition('Path',$this->api->auth->model['Path']);

		$grid=$this->add('Grid');
		$grid->setModel($m,array('id','fullname','sponsor_id','introducer_id'));

	}
}