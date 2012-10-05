<?php 
class Model_Closings extends Model_Table{
		var $table="jos_xclosings";
		function init(){
			parent::init();

			$this->hasOne('Distributor','distributor_id');

			$this->addField('name');
			$this->addField('Level_1_Income');
			$this->addField('Level_2_Income');
			$this->addField('Level_3_Income');
			$this->addField('Closing_1_Count');
			$this->addField('Closing_2_Count');
			$this->addField('Closing_3_Count');
			$this->addField('Salary_Income');
			$this->addField('Royalty_Income');
			$this->addField('TotalAmount');
			$this->addField('TDS');
			$this->addField('AdminCharge');
			$this->addField('NetAmount');
		}
}