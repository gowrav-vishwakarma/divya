<?php

class View_PageList extends CompleteLister{

	function formatRow(){
		parent::formatRow();
		$this->current_row['editlink']= $this->api->url('./editpage',array('pid'=>$this->model->id));
		$this->current_row['viewlink']= "../my/?alias=".$this->model['alias'];
	}
	
	function defaultTemplate(){
		return array('list/pages');
	}
}