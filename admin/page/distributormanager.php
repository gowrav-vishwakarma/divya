<?php
class page_distributormanager extends Page{

	function page_index(){
	

		$grid=$this->add('Grid');
		$grid->addClass("reloadable");
		$grid->js('myreload')->reload();
		
		if($_GET['varifypan']){

			$m=$this->add('Model_Distributor');
			$m->load($_GET['varifypan']);
			$m['is_panvarified'] = !$m['is_panvarified'];
			if(strlen($m['pan_no']) !=10 and $m['is_panvarified']) 
				$grid->js()->univ()->errorMessage("Pan no is not 10 digit, cannot varify")->execute();
			$m->save();
			$grid->js(null,$grid->js()->univ()->successMessage("Pan Status Updated"))->reload()->execute();
		}

		$grid->setModel('Distributor',array('name','address','mobile_no','fathers_name','pan_no','is_panvarified','username','password'));
		$grid->addColumn('Button','varifypan');
		$grid->addQuickSearch(array('name','mobile_no','pan_no'));
		$grid->addColumn('expander','edit');

	}
function page_edit(){
		$this->api->stickyGET('id');
		// $this->add('H3')->set($_GET['id']);
		
		$m=$this->add('Model_Distributor');
		$m->load($_GET['id']);

		$form=$this->add('Form');

		$form->addClass('ui-state-highlight');
		$form->addStyle('padding','20px');

		$form->setModel($m,array('fullname','address','mobile_no','fathers_name','pan_no','is_panvarified','username','password'));
		$form->addSubmit('Update');

		if($form->isSubmitted()){

			$uc=$this->add('Model_Distributor');
			$uc->addCondition('username',$form->get('username'));
			$uc->addCondition('id','<>', $form->model->id);
			$uc->tryLoadAny();
			if($uc->loaded())
				$form->displayError('username','This is used username, try another');

			// $ac=$this->add('Model_Page');
			// $ac->addCondition('alias',$form->get('alias'));
			// $ac->addCondition('alias_for_id','<>',$form->model->id);

			// $ac->tryLoadAny();
			// if($ac->loaded())
			// 	$form->displayError('alias','This is a used alias, use another');

			$form->update();

			$form->js()->closest('.reloadable')->trigger('myreload')->execute();

			$form->js()->univ()->successMessage('information Updated, press the F5 button to reload grid')->execute();

		}

}	}