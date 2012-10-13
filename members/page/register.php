<?php
class page_register extends Page {
	function init(){
		parent::init();

		$this->add('H1')->set('New Registration Page');
		
		$form = $this->add('Form');

		$form->addClass('stacked atk-row');
        $form->template->trySet('fieldset','span4');

		// if($_GET['new_id']){
		// 	$d=$this->add('Model_Distributor');
		// 	$d->load($_GET['new_id']);
		// 	$form->add('View_Info')->set("New Member ". $d['fullname'] ." is registered now with id ". $_GET['new_id']. ", please save this id to login");
		// }

		$form->setModel('Distributor',array('fullname','fathers_name','address','mobile_no','pan_no','bank_name','bank_branch','bank_account_no','bank_IFSC','username', 'password','alias'));

		$form->addField('line','sponsor_username')->setNotNull();

		// $form->addField('dropdown','leg')->setValueList(array(null=>"Select Leg", 'A' => 'Leg A', 'B' => 'Leg B', 'C'=>'Leg C','D'=>'Leg D'))->setNotNull();
		$form->addField('password','repassword')->validateNotNull("Re Password is must");
		$form->addField('line','pin')->validateNotNull();
		$form->addField('checkbox','TNC','I Agree with Companies Terms & Conditions');
		$form->addSubmit('Register');

		$form->getElement('address')->setAttr('rows',3);

		// FORM RE ORDERING
		$form->add('Order')
				->move('repassword','after','password')
				->move('sponsor_username','before','fullname')
				->move($form->addSeparator('span4'),'after','address')
				->move($form->addSeparator('span4'),'before','password')
				->now();

		if($form->isSubmitted()){
			try{
			$this->api->db->beginTransaction();
			
			if(!preg_match('/^[a-z0-9]*$/',$form->get('username')))
				$form->displayError('username','Only small (lower case) alphabets and numbers are allowed');

			$su=$this->add('Model_Distributor');
			$su->addCondition('username',$form->get('sponsor_username'));
			$su->tryLoadAny();

			if(!$su->loaded()) $form->displayError('sponsor_username',"This Sponsor Username is not valid");
			$form->model['sponsor_id']=$su->id;


			$uc=$this->add('Model_Distributor');
			$uc->addCondition('username',$form->get('username'));
			$uc->tryLoadAny();
			if($uc->loaded()){
				$form->displayError('username',"This username is already taken, try different one");
			}
 
			if($form->get('TNC') != 1)
				$form->displayError('TNC','You must Agree with Terms and Conditions');

			if($form->get('password') != $form->get('repassword'))
				$formorm->displayError('repassword',"Pasword must match");

			$sponsor=$this->add('Model_Distributor');
			$sponsor->load($su->id);
			if($sponsor['Total_members_in_down'] == 4)
				$form->displayError('sponsor_username',"There is no space available under this user");

			// $aliascheck=$this->add('Model_Distributor');
			// $aliascheck->addCondition('alias',$form->get('alias'));
			// $aliascheck->tryLoadAny();
			// if($aliascheck->loaded())
			// 	$form->displayError('alias',"This page name is already taken, try different one");

			if(! ($pinid=$this->add('Model_Pin')->usePin($form->get('pin'))))
				$form->displayError('pin','Pin Error, try again or another pin.');


			$form->getModel()->memorize('pin_id',$pinid);
				$form->update();
			}catch(Exception $e){
				$this->api->db->rollback();
				throw $e;
				$form->js()->univ()->errorMessage($e->getMessage())->execute();
			}

			$this->api->db->commit();

			$form->js(null,$form->js()->reload())->univ()->successMessage("Member sucessfuly registered")->execute();

		}


	}
}