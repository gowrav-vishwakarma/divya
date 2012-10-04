<?php
class Model_Distributor extends Model_Table{

	var $table="jos_xtreedetails";

	function init(){
		parent::init();

		$this->hasOne('Distributor','sponsor_id')->mandatory("Sponsor Id is must");
		$this->hasOne('Pin','pin_id');

		$this->hasMany('SponsoredDistributors','sponsor_id');
		$this->hasMany('Closings','distributor_id');
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

		$this->addField('Closing_1_Count')->defaultValue(0);
		$this->addField('Closing_2_Count')->defaultValue(0);
		$this->addField('Closing_3_Count')->defaultValue(0);
		$this->addField('Total_1_Count')->defaultValue(0)->system(true);
		$this->addField('Total_2_Count')->defaultValue(0)->system(true);
		$this->addField('Total_3_Count')->defaultValue(0)->system(true);
		$this->addField('is_level_1_completed')->type("boolean")->defaultValue(false)->system(true);
		$this->addField('is_level_2_completed')->type("boolean")->defaultValue(false)->system(true);
		$this->addField('is_level_3_completed')->type("boolean")->defaultValue(false)->system(true);
		$this->addField('Performance_2_Bonus')->defaultValue(0)->system(true);
		$this->addField('Performance_3_Bonus')->defaultValue(0)->system(true);
		$this->addField('Salary_1_months')->defaultValue(0)->system(true);
		$this->addField('Salary_2_months')->defaultValue(0)->system(true);
		$this->addField('Level_1_Income')->defaultValue(0)->system(true);
		$this->addField('Level_2_Income')->defaultValue(0)->system(true);
		$this->addField('Level_3_Income')->defaultValue(0)->system(true);
		$this->addField('Salary_1_Income')->defaultValue(0)->system(true);
		$this->addField('Salary_2_Income')->defaultValue(0)->system(true);
		$this->addField('TotalAmount')->defaultValue(0)->system(true);
		$this->addField('TDS')->defaultValue(0)->system(true);
		$this->addField('AdminCharge')->defaultValue(0)->system(true);
		$this->addField('NetAmount')->defaultValue(0)->system(true);
		$this->addField('JoiningDate')->defaultValue(date('Y-m-d'))->system(true);
		$this->addField('Performance_Given')->defaultValue(0)->system(true);
		$this->addField('Path')->system(true);

		$this->addExpression('name')->set('concat(fullname," (",username,")" )');
		
		$this->addHook('beforeSave',$this);
		$this->addHook('afterSave',$this);
	}

	function beforeSave(){
		if(!$this->loaded()){ //INSERTING NEW
			
			$sponsor=$this->add('Model_Distributor');
			$sponsor->tryLoad($this['sponsor_id']);
			if($sponsor->loaded()){

				$sponsor['Closing_1_Count'] = $sponsor['Closing_1_Count'] + 1;
				$sponsor['Total_1_Count'] = $sponsor['Total_1_Count'] + 1;

				$this['Path']= $sponsor['Path']. '.'.$sponsor['Total_1_Count'];

				if($sponsor['Total_1_Count'] == 12) $sponsor['is_level_1_completed']=true;

				$sponsor->save();

				$sp_sp=$this->add('Model_Distributor');
				$sp_sp->tryLoad($sponsor['sponsor_id']);
				if($sp_sp->loaded()){
					$sp_sp['Closing_2_Count'] = $sp_sp['Closing_2_Count'] + 1;
					$sp_sp['Total_2_Count'] = $sp_sp['Total_2_Count'] + 1;
					if($sp_sp['Total_2_Count'] == 144) {
						$sp_sp['is_level_2_completed']=true;
						$sp_sp['Salary_1_months']=1;
					}
					$sp_sp->save();
				

					$sp_sp_3=$this->add('Model_Distributor');
					$sp_sp_3->tryLoad($sp_sp['sponsor_id']);
					if($sp_sp_3->loaded()){
						$sp_sp_3['Closing_3_Count'] = $sp_sp_3['Closing_3_Count'] + 1;
						$sp_sp_3['Total_3_Count'] = $sp_sp_3['Total_3_Count'] + 1;
						if($sp_sp_3['Total_3_Count'] == 1728) {
							$sp_sp_3['is_level_3_completed']=true;
							$sp_sp_3['Salary_2_months']=1;
						}
						$sp_sp_3->save();
					}
				}
			}

			$this['pin_id']=$this->recall('pin_id');

			$this['is_panvarified'] = (strlen($this['pan_no'])==10)? true : false;

			

			$this->memorize('inserted',true);
			$this['is_panvarified'] = (strlen($this['pan_no'])==10)? true : false;
		}else{
			// UPDATING MY PAGE
		}	



	}

	function afterSave(){
		if($this->recall('inserted',false)){
			
			$this->forget('inserted');
		}
	}

}