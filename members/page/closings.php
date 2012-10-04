<?php 
class page_closings extends Page{
	function init(){
		parent::init();
		$grid=$this->add('Grid');

		// $cd=$this->add('Model_CurrentDistributor');

		$grid->setModel($this->api->auth->model->ref('Closings'),
			array(
				'name','Closing_1_Count','Closing_2_Count','Closing_3_Count','Level_1_Income','Level_2_Income','Level_3_Income','Performance_2_Bonus','Performance_3_Bonus','Salary_1_Income','Salary_2_Income','TotalAmount','TDS','AdminCharge','NetAmount'
				)
			);
	}
}