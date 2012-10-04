<?php
class page_closings_report extends Page{
	function init(){
		parent::init();

		$tm=$this->api->db->dsql()->table('jos_xclosings')->field('distinct(name)')->getAll();
		$closings=array("select Closing for Details");

		foreach($tm as $t){
			$closings[]=$t['name'];
		}


		$form=$this->add('Form');
		$grid=$this->add('Grid');

		$form->addField('dropdown','closing')->setValueList($closings);
		$form->addSubmit('Get Details');

		if($form->isSubmitted()){
			$grid->js()->reload(array(
									"closing_name"=>$form->get('closing')
										))->execute();
		}

		$m=$this->add('Model_Closings');

		if($_GET['closing_name']){
			$m->addCondition('name',$_GET['closing_name']);
		}else{
			$m->addCondition('name','ramlal');
		}

		$grid->setModel($m);

	}
}