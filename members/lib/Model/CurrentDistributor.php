<?php
class Model_CurrentDistributor extends Model_Distributor{
	function init(){
		parent::init();
		$this->addCondition('id',$this->api->auth->model->id);


		$this->tryLoadAny();
	}
}