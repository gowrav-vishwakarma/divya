<?php
class page_pinmanagement extends Page{
	function init(){
		parent::init();
		$tabs = $this->add('Tabs');

		$unusedpinstab=$tabs->addTab("My Available Pins");
		$usedpinstab=$tabs->addTab("My Used Pins");
		$pinmanagertab=$tabs->addTab("Pin Transfer management");


		$usedpins_model=$this->add('Model_Pin');
		$usedpins_model->addCondition('assigned_to',$this->api->auth->model->id);
		$usedpins_model->addCondition('is_used',true);

		$un_usedpins_model=$this->add('Model_Pin');
		$un_usedpins_model->addCondition('assigned_to',$this->api->auth->model->id);
		$un_usedpins_model->addCondition('is_used',false);

		$available_grid=$unusedpinstab->add('Grid');
		$available_grid->setModel($un_usedpins_model);
		$available_grid->addQuickSearch(array('Pin','For'));
		
		$usedpinstab->add('Grid')->setModel($usedpins_model);


		$form= $pinmanagertab->add('Form');
		$form->addField('line','no_of_pins');
		$form->addField('password','password');
		$form->addField('dropdown','to_distributor')->validateNotNull()->setEmptyText("Transfer Pins To")->setModel('Distributor');

		$form->addSubmit('Transfer');

		if($form->isSubmitted()){
			$cd= $this->add('Model_CurrentDistributor');
			if($cd['password'] != $form->get('password'))
				$form->displayError("password","Password looks wrong");

			$pin=$this->add('Model_Pin');
			try{
				$pin->transferPins($cd->id,$form->get('to_distributor'),$form->get('no_of_pins'));

				$form->js(null,array(
						$form->js()->univ()->successMessage("Pin transfered"),
						$form->js()->reload()
					))->execute();

			}catch(Exception $e){
				$form->js()->univ()->errorMessage($e->getMessage())->execute();
			}

		}


	}
}