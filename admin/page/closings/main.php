<?php

class page_closings_main extends Page {
	
	function init(){

		parent::init();

		$form=$this->add('Form');
		$form->addField('line','closing_name')->set(date('Y-m-d'));
		$form->addField('checkBox','is_monthly');
		$form->addSubmit('Do Closing');
		if($form->isSubmitted()){

			$c=$this->add('Model_Closings');
			$c->addCondition('name',$form->get('closing_name'));
			$c->tryLoadAny();
			if($c->loaded())
				$form->displayError('closing_name','This Closing name is already used');
			try{
				$this->api->db->beginTransaction();
				$this->doClosing($form->get('closing_name'),$form->get('is_monthly'));
			}catch(Exception $e){
				$this->api->db->rollback();
				throw $e;
				$form->js()->univ()->errorMessage($e->getMessage())->execute();
			}
			$this->api->db->commit();
			$form->js()->univ()->successMessage('Closing Done')->execute();
		}
	}

	function doClosing($closing_name,$is_monthly){
		//initialize//

		$this->query("UPDATE jos_xtreedetails SET CarryAmount= 0");

		//calculate LevelIncome from 1st to 3rd level
		
		$this->query("UPDATE
						jos_xtreedetails
					SET
						Level_1_Agent_Income = Closing_1_agent_count * 3000,
						Level_2_Agent_Income = Closing_2_agent_count * 3000,
						Level_3_Agent_Income = Closing_3_agent_count * 3000
			");


		  //salary income
		if($is_monthly){
			$this->query("UPDATE
							jos_xtreedetails
						SET
							Salary_Income = 8000,
							salary_month = salary_month  + 1
						WHERE
							Total_2_agent_count = 16 AND
							salary_month between 1 and 12
						");
			// Royalty @TODO@ --

			$new_dists=$this->add('Model_Distributor');
			$new_dists->addCondition('is_new',true);
			$new_count=$new_dists->count()->do_getOne();

			$royaltyachievers = $this->add('Model_Distributor');
			$royaltyachievers->addCondition('Total_2_agent_count',16);
			$royaltyachievers_count = $royaltyachievers->count()->do_getOne();

			if($royaltyachievers_count > 0)
				$fundAmount=$new_count * 500 / $royaltyachievers_count;
			else
				$fundAmount=0;

			$this->query("UPDATE
							jos_xtreedetails
						SET
							Royalty_Income = $fundAmount
						WHERE
							Total_2_agent_count = 16
				");

			$this->query("UPDATE
							jos_xtreedetails
						SET
							is_new = 0
				");

			}
		  //Total income
	
			$this->query("UPDATE
							jos_xtreedetails
						SET
							TotalAmount = 	LastCarryAmount + Level_1_Agent_Income + Level_2_Agent_Income + Level_3_Agent_Income + Self_Agent_Income + 	Salary_Income + Royalty_Income  
						");

		//calculate TDS
			$this->query("UPDATE
							jos_xtreedetails
						SET
							TDS = TotalAmount * 10 /100.0
						WHERE
							is_panvarified=1 AND
							is_agent = 1
						");
			
			$this->query("UPDATE
							jos_xtreedetails
						SET
							TDS = TotalAmount * 20 /100.0
						WHERE
							is_panvarified=0 AND
							is_agent = 1
						");


		// calculate Admin Charge
			$this->query("UPDATE
							jos_xtreedetails
						SET
							AdminCharge = TotalAmount * 5 /100.0 
						WHERE
							is_agent = 1
						");

		// calculate Net Amount
			$this->query("UPDATE
							jos_xtreedetails
						SET
							NetAmount = TotalAmount - (TDS + AdminCharge)
						WHERE
							is_agent = 1
						");
		// Calculate Carry
			$this->query("UPDATE
							jos_xtreedetails
						SET
							CarryAmount = TotalAmount,
							TotalAmount = 0,
						WHERE
							is_agent = 0
						");

		//save closing

			$this->query("
					INSERT into jos_xclosings
					(
						SELECT
						0,
						id,
						Closing_1_agent_count,
						Closing_2_agent_count,
						Closing_3_agent_count,
						Level_1_Agent_Income,
						Level_2_Agent_Income,
						Level_3_Agent_Income,
						Salary_Income,
						Royalty_Income,
						TotalAmount,
						TDS,
						AdminCharge,
						NetAmount,
						'$closing_name',
						LastCarryAmount,
						ClosingCarryAmount
						FROM 
						jos_xtreedetails
					)
				");

		//closing zeros
			$this->query("UPDATE
							jos_xtreedetails
						SET
							LastCarryAmount = CarryAmount
						");
			$this->query("UPDATE
							jos_xtreedetails
						SET
							Closing_1_agent_count = 0,
							Closing_2_agent_count = 0,
							Closing_3_agent_count = 0,
							Level_1_Agent_Income = 0,
							Level_2_Agent_Income = 0,
							Level_3_Agent_Income = 0,
							Salary_Income = 0,
							Royalty_Income = 0,
							TotalAmount = 0,
							TDS = 0,
							AdminCharge = 0,
							NetAmount = 0,
							CarryAmount=0
				");

		}

	function query($q){
		$this->api->db->dsql()->expr($q)->execute();
	}
}