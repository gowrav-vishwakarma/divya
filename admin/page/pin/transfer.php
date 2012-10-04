<?php
class page_pin_transfer extends Page {
	function init(){
		parent::init();
		$form = $this->add('Form');
		$form->addField('line','no_of_pins');
		// $form->addField('radio','pin_type')->setValueList(array("Pin"=>'Joining',"RePurchasePin"=>'Repurchase'));
		$form->addField('dropdown','from_distributor')->setEmptyText("Take pins From Distributor id")->validateNotNull()->setModel('Distributor');
		$form->addField('dropdown','to_distributor')->setEmptyText("Give pins to distributor ")->validateNotNull()->setModel('Distributor');
		$form->addSubmit('Transfer');


		if($form->isSubmitted()){
			$pin= $this->add('Model_Pin');
			try{
				$pin->transferPins($form->get('from_distributor'),$form->get('to_distributor'),$form->get('no_of_pins'), $form->get('pin_type'));
				$form->js(null,array(
						$form->js()->univ()->successMessage("Pin Successfully Transfer"),
						$form->js()->reload()
					))->execute();
			}catch(Exception $e){
				$form->js()->univ()->errorMessage($e->getMessage())->execute();
			}
		}
	}
}