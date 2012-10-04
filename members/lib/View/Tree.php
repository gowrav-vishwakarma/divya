<?php
class View_Tree extends View{
	var $start_id;
	var $depth=10;
	function init(){
		parent::init();
	}

	function drawNode($parent_id,$id,$depth){
		if($depth == 0 ) return;

		$m=$this->add('Model_Distributor');
		$m->load($id);
		$this->js(true,"addNode($id,$parent_id,'".$m['name']."')");

		$downline=$this->add('Model_Distributor');
		$downline->addCondition('sponsor_id',$id);

		foreach($downline as $dist){
			$this->drawNode($id,$dist['id'],$depth-1);
		}

		$m->unload();
		$m->destroy();
	}

	function render(){
		// $this->js(true,"addNode(-1,0,'".$a['name']."')");
		$this->drawNode(-1,$this->start_id,$this->depth);
		$this->js(true,"displayTree()");
		
		$a=$this->add('Model_Distributor');
		$a->load($this->start_id);
		$this->template->trySet('sponsor_id',$a['sponsor_id']);

		parent::render();
	}

	function defaultTemplate(){
		return array('view/tree');
	}
}