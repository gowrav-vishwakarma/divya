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
		//calculate LevelIncome from 1st to 3rd level
		
		$this->query("UPDATE
						jos_xtreedetails
					SET
						Level_1_Income = Closing_1_Count * 500,
						Level_2_Income = Closing_2_Count * 1000,
						Level_3_Income = Closing_3_Count * 600
			");

		//calculate performance bonus income (2 and 3rd) 

		$this->query("UPDATE
						jos_xtreedetails
					SET
						Performance_2_Bonus = 250000,
						Performance_Given = 2
					WHERE
						is_level_2_completed=1 and Performance_Given = 0
					");

		$this->query("UPDATE
						jos_xtreedetails
					SET
						Performance_2_Bonus = 1000000,
						Performance_Given = 3
					WHERE
						is_level_3_completed=1 and Performance_Given <> 3
					");

		  //salary income
		if($is_monthly){
			$this->query("UPDATE
							jos_xtreedetails
						SET
							Salary_1_Income = CASE 
												WHEN Salary_1_months = 1 THEN 18000
												WHEN Salary_1_months > 1 AND Salary_1_months < 11 THEN 9000
												WHEN Salary_1_months = 11 THEN 11500
											END,
							Salary_1_months = Salary_1_months + 1

						WHERE
							is_level_2_completed = 1 AND
							Salary_1_months between 1 and 11
						");


			$this->query("UPDATE
							jos_xtreedetails
						SET
							Salary_2_Income = CASE 
												WHEN Salary_2_months = 1 THEN 24000
												WHEN Salary_2_months = 2 THEN 13500
												WHEN Salary_2_months = 3 THEN 14500
												WHEN Salary_2_months = 4 THEN 15500
												WHEN Salary_2_months = 5 THEN 16500
												WHEN Salary_2_months = 6 THEN 17500
												WHEN Salary_2_months = 7 THEN 18500
												WHEN Salary_2_months = 8 THEN 19500
												WHEN Salary_2_months = 9 THEN 20500
												WHEN Salary_2_months = 10 THEN 21500
												WHEN Salary_2_months = 11 THEN 22500
												WHEN Salary_2_months = 12 THEN 23500
												WHEN Salary_2_months = 13 THEN 24500
												WHEN Salary_2_months = 14 THEN 25500
												WHEN Salary_2_months = 15 THEN 26500
												WHEN Salary_2_months = 16 THEN 27500
												WHEN Salary_2_months = 17 THEN 28500
												WHEN Salary_2_months = 18 THEN 29500
												WHEN Salary_2_months = 19 THEN 30500
												WHEN Salary_2_months = 20 THEN 31500
												WHEN Salary_2_months = 21 THEN 32500
												WHEN Salary_2_months = 22 THEN 33500
												WHEN Salary_2_months = 23 THEN 35700
											END,
							Salary_2_months = Salary_2_months + 1

						WHERE
							is_level_3_completed = 1 AND
							Salary_2_months between 1 and 23
						");

			}
		  //Total income
	
			$this->query("UPDATE
							jos_xtreedetails
						SET
							TotalAmount = Level_1_Income + Level_2_Income + Level_3_Income + Performance_2_Bonus + Performance_3_Bonus + Salary_1_Income + Salary_2_Income 
						");

		//calculate TDS
			$this->query("UPDATE
							jos_xtreedetails
						SET
							TDS = TotalAmount * 10 /100.0
						WHERE
							is_panvarified=1
						");
			
			$this->query("UPDATE
							jos_xtreedetails
						SET
							TDS = TotalAmount * 20 /100.0
						WHERE
							is_panvarified=0
						");


		// calculate Admin Charge
			$this->query("UPDATE
							jos_xtreedetails
						SET
							AdminCharge = TotalAmount * 5 /100.0
						");

		// calculate Net Amount
			$this->query("UPDATE
							jos_xtreedetails
						SET
							NetAmount = TotalAmount - (TDS + AdminCharge)
						");
		//save closing

			$this->query("
					INSERT into jos_xclosings
					(
						SELECT
						0,
						id,
						Closing_1_Count,
						Closing_2_Count,
						Closing_3_Count,
						Level_1_Income,
						Level_2_Income,
						Level_3_Income,
						Performance_2_Bonus,
						Performance_3_Bonus,
						Salary_1_Income,
						Salary_2_Income,
						TotalAmount,
						TDS,
						AdminCharge,
						NetAmount,
						'$closing_name'
						FROM 
						jos_xtreedetails
					)
				");

		//closing zeros
			$this->query("UPDATE
							jos_xtreedetails
						SET
							Closing_1_Count = 0,
							Closing_2_Count = 0,
							Closing_3_Count = 0,
							Level_1_Income = 0,
							Level_2_Income = 0,
							Level_3_Income = 0,
							Performance_2_Bonus = 0,
							Performance_3_Bonus = 0,
							Salary_1_Income = 0,
							Salary_2_Income = 0,
							TotalAmount = 0,
							TDS = 0,
							AdminCharge = 0,
							NetAmount = 0
				");

		}

	function query($q){
		$this->api->db->dsql()->expr($q)->execute();
	}
}