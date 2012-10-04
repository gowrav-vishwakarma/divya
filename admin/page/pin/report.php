<?php
class page_pin_report extends Page {
	function init(){
		parent::init();
		
		$form = $this->add('Form');
		$form->addField('dropdown','filter_type')->setValueList(array("all"=>"All","used"=>"Used Pins Only","unused"=>"Un Used Pins Only"));
		// $form->addField('radio','pin_type')->setValueList(array("Pin"=>'Joining',"RePurchasePin"=>'Repurchase'));
		$form->addSubmit("Filter Pins");

		$grid=$this->add('Grid');
		$grid->addPaginator(10);
		
		if($_GET['pin_type'])
			$pinmodel=$this->add('Model_Pin');
		else
			$pinmodel=$this->add('Model_Pin');


		if($_GET['filter']){
			if($_GET['filter'] == 'used')
				$pinmodel->addCondition('is_used',true);
			if($_GET['filter'] == 'unused')
				$pinmodel->addCondition('is_used',false);
		}

		$grid->setModel($pinmodel);
		
		if($form->isSubmitted()){
			$grid->js()->reload(array('filter'=>$form->get('filter_type'),"pin_type"=>$form->get('pin_type')))->execute();
		}
		

	}
}