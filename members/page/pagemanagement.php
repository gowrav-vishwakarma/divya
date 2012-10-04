<?php
class page_pagemanagement extends Page {
	function page_index(){
		parent::init();
		$cols=$this->add('Columns');
		
		$main=$cols->addColumn(10);
		$side=$cols->addColumn(2);
		
		$cd=$this->add('Model_CurrentDistributor');

		$main->add('View_Error')->set('This section is under construction, we are developing intractive section to manage your page');
		// $side->add('View_Info')->setHTML("You can make <strong><font size='+3'>". (($cd['TotalSelfRepurchase']- $cd['UsedRepurchase'])/1000) . "</font></strong> more eindian names");

		$main->add('H3')->set('Your Current Pages');
		$main->add('View_PageList')->setModel($cd->ref('Page'));

		// $form=$main->add('Form');
		// $form->add("H3")->set("Add New Page");
		// $form->addField('line','alias')->setNotNull();

		// $form->addSubmit('Submit');

	// 	if($form->isSubmitted()){

	// 		$cd=$this->add('Model_CurrentDistributor');
	// 		if($cd['TotalSelfRepurchase']-$cd['UsedRepurchase']  <  JOINING_AMOUNT)
	// 			$form->displayError('alias',"You Dont Have Sufficient Repurchase Point,Go For Repurchase First");


	// 		$m=$this->add('Model_Page');
	// 		$m->addCondition('alias',$form->get('alias'));
	// 		$m->tryLoadAny();
	// 		if($m->loaded())
	// 			$form->js()->univ()->errorMessage("This alias is already exists")->execute();

	// 		$m['alias']=$form->get('alias');
	// 		$m['distributor_id']=$this->api->auth->model->id;
	// 		$m->save();

	// 		$cd['UsedRepurchase']=$cd['UsedRepurchase']+JOINING_AMOUNT;
	// 		$cd->save();

	// 		$this->js()->reload()->execute();


	// 	}
	}

	function page_editpage(){
		$this->api->stickyGET('pid');

		$m=$this->add('Model_Page');
		$m->load($_GET['pid']);

		$form=$this->add('Form');
		$form->setModel($m,array('matter'));
		$form->addField('checkbox','continue_save_mode');
		$form->addSubmit("Update");

		if($form->isSubmitted()){
			$form->update();
			if($form->get('continue_save_mode'))
				$form->js()->univ()->successMessage("Page Saved")->execute();
			else
				$form->js(null,$this->js()->univ()->redirect('pagemanagement'))->univ()->successMessage("Page Saved")->execute();
		}
	}

}
