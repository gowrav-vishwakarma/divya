<?php
class Model_Distributor extends Model_Table{

	var $table="jos_xtreedetails";

	function init(){
		parent::init();

		$this->hasOne('Distributor','sponsor_id')->mandatory("Sponsor Id is must");
		$this->hasOne('Pin','pin_id');

		$this->hasMany('SponsoredDistributors','sponsor_id');
		// $this->hasMany('Closings','distributor_id');
		$this->hasMany('Page','alias_for_id');

		$details = $this->join('jos_xpersonaldetails.distributor_id');

        $details->addField('fullname')->mandatory("Name is must to give");
        $details->addField('address')->type('text');
        $details->addField('mobile_no');
        // $details->addField('page_alias')->mandatory('You must give a name to your page');
        $details->addField('fathers_name')->mandatory('You must give a fathername to your page');
        $details->addField('pan_no');
        $details->addField('bank_name')->mandatory('You must give a bank name to your page');
        $details->addField('bank_branch')->mandatory('You must give a bank branch to your page');
        $details->addField('bank_account_no')->mandatory('You must give a bank account number to your page');
        $details->addField('bank_IFSC')->mandatory('You must give a bank IFSC to your page');

        $details->addField('username')->mandatory("Username is must to give");
        $details->addField('password')->display(array('form'=> 'password'))->mandatory("Password is must to give");

        $page=$this->join('jos_xpages.alias_for_id');
        $page->addField('alias')->mandatory('You must give a name to your page');

		$this->addField('is_panvarified')->type('boolean')->defaultValue(false);//m->system(true);

		$this->addField('Total_members_in_down');
		$this->addField('Closing_1_agent_count');
		$this->addField('Closing_2_agent_count');
		$this->addField('Total_2_agent_count');
		$this->addField('Closing_3_agent_count');
		$this->addField('salary_month');
		$this->addField('is_level_2_agents_completed');
		$this->addField('Self_Agent_Income');
		$this->addField('Level_1_Agent_Income');
		$this->addField('Level_2_Agent_Income');
		$this->addField('Level_3_Agent_Income');
		$this->addField('Salary_Income');
		$this->addField('Royalty_Income');
		$this->addField('Total_Income');
		$this->addField('TDS');
		$this->addField('Admin_Charge');
		$this->addField('Net_Amount');
		$this->addField('is_new');
		$this->addField('Joining_Date');
		$this->addField('is_panvarified');

		$this->addExpression('name')->set('concat(fullname," (",username,")" )');
		
		$this->addHook('beforeSave',$this);
		$this->addHook('afterSave',$this);
	}

	function beforeSave(){
		if(!$this->loaded()){ //INSERTING NEW
			
			$sponsor=$this->add('Model_Distributor');
			$sponsor->tryLoad($this['sponsor_id']);
			if($sponsor->loaded()){

				$sponsor['Total_members_in_down'] = $sponsor['Total_members_in_down'] + 1;
				// @TODO@ -- path
				if($sponsor['Total_members_in_down']==4){
					$sponsor['is_agent']=true;
					$sponsor['Self_Agent_Income']= 5000;
					$sponsor->save();

					// IF This sponsor is made agent right now then update ansesstors agent count and further working
					$agent=$sponsor;

					$agent_sp = $this->add('Model_Distributor')->tryLoad($agent['sponsor_id']);
					if($agent_sp->loaded()){
						$agent_sp['Closing_1_agent_count'] = $agent_sp['Closing_1_agent_count'] + 1;
						$agent_sp->save();

						$agent_sp_sp =$this->add('Model_Distributor')->tryLoad($agent_sp['sponsor_id']);
						if($agent_sp_sp->loaded()){
							$agent_sp_sp['Closing_2_agent_count'] = $agent_sp_sp['Closing_2_agent_count'] + 1;
							$agent_sp_sp['Total_2_agent_count'] = $agent_sp_sp['Total_2_agent_count'] + 1;
							if($agent_sp_sp['Total_2_agent_count'] == 16 ) 
								$agent_sp_sp['salary_month']=1;
							$agent_sp_sp->save();

							$agent_sp_sp_sp=$this->add('Model_Distributor')->tryLoad($agent_sp_sp['sponsor_id']);
							if($agent_sp_sp_sp->loaded()){
								$agent_sp_sp_sp['Closing_3_agent_count'] = $agent_sp_sp_sp['Closing_3_agent_count'] + 1;
								$agent_sp_sp_sp->save();
							}

						}

					}

				}
			}

		}
	}

	function afterSave(){
		if($this->recall('inserted',false)){
			
			$this->forget('inserted');
		}
	}
}
