<?php
class page_resetall extends Page {
	function init(){
		parent::init();

		$this->query("
				SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
                SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
                SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';
                "
			);


		$this->query("truncate jos_xpersonaldetails");
		$this->query("truncate jos_xtreedetails");
		$this->query("truncate jos_xpin");
		$this->query("truncate jos_xclosings");
		$this->query("truncate jos_xstaff");
		$this->query("truncate jos_xpages");



		$pin=$this->add('Model_Pin');
		$pin['Pin']="0000-0000-0000-0000";
		$pin['assigned_to']=1;
		$pin['is_used']=1;
		$pin->save();

		$this->query("
			INSERT INTO `eindian`.`jos_xtreedetails` (`id`, `sponsor_id`, `Closing_1_Count`, `Closing_2_Count`, `Closing_3_Count`, `Total_1_Count`, `Total_2_Count`, `Total_3_Count`, `is_level_1_completed`, `is_level_2_completed`, `is_level_3_completed`, `Salary_1_months`, `Salary_2_months`, `Level_2_Income`, `Level_1_Income`, `Level_3_Income`, `Performance_2_Bonus`, `Salary_1_Income`, `Salary_2_Income`, `TotalAmount`, `TDS`, `AdminCharge`, `NetAmount`, `JoiningDate`, `pin_id`, `Performance_3_Bonus`, `is_panvarified`, `Performance_Given`, `Path`) VALUES (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-01', 1, 0, 0, 0,'0');
			");

		$this->query("
			INSERT INTO `eindian`.`jos_xpersonaldetails` (`id`, `fullname`, `address`, `mobile_no`, `distributor_id`, `username`, `password`, `page_alias`, `fathers_name`, `pan_no`, `bank_name`, `bank_branch`, `bank_account_no`) VALUES (0, 'root', 'root', '123', 1, 'root', 'root', 'root', 'root', '', '', '', '');
			");

		$this->query("INSERT INTO jos_xpages (id,distributor_id,alias) VALUES(0,1,'root')");

		$staff=$this->add('Model_Staff');
		$staff['username']="root";
		$staff['password']='admin';
		$staff->save();

		// $dist=$this->add('Model_Distributor');
		// $dist['sponsor_id']=0;
		// $dist['introducer_id']=0;
		// $dist['introducer_id']=0;

		$this->query("
            SET SQL_MODE=@OLD_SQL_MODE;
            SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
            SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
        ");


	}

	function query($q){
		$this->api->db->dsql()->expr($q)->execute();
	}
}