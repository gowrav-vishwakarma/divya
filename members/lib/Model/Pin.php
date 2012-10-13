<?php
class Model_Pin extends Model_Table{
	var $table="jos_xpin";
	function init(){
		parent::init();
		$this->addField('Pin');
		$this->hasOne('Distributor', 'assigned_to');
		$this->addField('is_used')->type('boolean')->defaultValue(false);

		// $this->addExpression('Used_For')->set(function ($m,$q){
		// 	return $m->_dsql()->del('field')->field('GROUP_CONCAT("name")')->where('pin_id',$m->getField('id'));
		// });

	}

	function generatePins($no_of_pins){
		$i=1;
		
		$pin=$this->add('Model_Pin');

		while($i<= $no_of_pins){
			$new_no=rand(1000,9999). "-". rand(1000,9999) . "-" . rand(1000,9999). "-". rand(1000,9999);
			$pin->addCondition('Pin',$new_no);
			$pin->tryLoadAny();
			if($pin->loaded()){

			}else{
				$this['Pin']=$new_no;
				$this['assigned_to']=1;
				$this->saveAndUnload();
				$i++;
			}

			$pin->unload();
		}
	}


	function transferPins($from,$to,$no_of_pins){
		$temp=$this->add('Model_Pin');
		$temp->addCondition('assigned_to',$from);
		$temp->addCondition('is_used',false);

		if( $temp->count()->do_getone() < $no_of_pins)
			throw $this->exception("There are not sufficient unused pins to transfer");

		// $temp->_dsql()->set('assigned_to',$to)->limit($no_of_pins)->do_update();
		$t_m=$this->add('Model_Pin');
		
		for($i=1;$i<=$no_of_pins;$i++){
			$t_m->addCondition('assigned_to',$from);
			$t_m->addCondition('is_used',false);
			$t_m->loadAny();

			$t_m['assigned_to']=$to;
			$t_m->saveAndUnload();

		}

	}

	function usePin($pin){
		
		$this->addCondition('Pin',$pin);

		$this->tryLoadAny();
		if(!$this->loaded()){
			return false;
		}

		if($this['is_used']==true OR $this['assigned_to'] != $this->api->auth->model->id)
			return false;

		$this['is_used']=true;
		$this->save();

		return $this->id;
	}


}