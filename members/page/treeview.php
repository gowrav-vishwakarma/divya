<?php
class page_treeview extends Page {
	function init(){
		parent::init();
		$tv=$this->add('View_Tree');
		if($_GET['Start']){
			$demanded = $this->add('Model_Distributor')->tryLoad($_GET['Start']);
			if(strpos($demanded['Path'], $this->api->auth->model['Path']) === false or !$demanded->loaded())
	        	$tv->start_id = $this->api->auth->model->id;
			else
	        	$tv->start_id = $_GET['Start'];
        }
        else
        	$tv->start_id = $this->api->auth->model->id;

        // echo $tv->start_id;
	}
}