<?php
class page_pin_generate extends Page {
	function init(){
		parent::init();
		$form = $this->add('Form');
		$form->addField('line','no_of_pins');
		// $form->addField('radio','pin_type')->setValueList(array("Pin"=>'Joining',"RePurchasePin"=>'Repurchase'));
		$form->addSubmit('Generate');

		if($form->isSubmitted()){
			$pin=$this->add('Model_Pin');
			$pin->generatePins($form->get('no_of_pins'));
			$form->js(null,array(
				$form->js()->univ()->successMessage("Pins Generated"),
				$form->js()->reload()
				))->execute();
		}
	}
}