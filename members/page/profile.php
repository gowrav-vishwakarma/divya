<?php
class page_profile extends Page {
	function init(){
		parent::init();

		$this->add('H2')->set("Update your personal information here");

		$form=$this->add('Form');
		$form->setModel($this->add('Model_CurrentDistributor'),
			array(
					'address','mobile_no','pan_no','bank_name','bank_branch','bank_account_no','bank_IFSC','password'
				));
		$form->addField("password","repassword");

		$form->addSubmit("Update");

		$form->add("Order")->move('repassword','after','password')->now();

		if($form->issubmitted()){
			if($form->get('password') != $form->get('repassword'))
					$form->displayError('repassword',"Password must match");
				
			$form->update();
			$form->js(null,$form->js()->univ()->successMessage("Information Updated"))->reload()->execute();
		}
	}
}