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
			INSERT INTO `divya`.`jos_xtreedetails` (`id`, `sponsor_id`, `Closing_1_agent_count`, `Total_members_in_down`, `Closing_2_agent_count`, `Total_2_agent_count`, `Closing_3_agent_count`, `salary_month`, `is_level_2_agents_completed`, `Self_Agent_Income`, `Level_1_Agent_Income`, `Level_2_Agent_Income`, `Level_3_Agent_Income`, `Salary_Income`, `Royalty_Income`, `Total_Income`, `TDS`, `Admin_Charge`, `Net_Amount`, `is_new`, `JoiningDate`, `is_panvarified`, `is_agent`, `LastCarryAmount`, `ClosingCarryAmount`) VALUES (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2012-10-01', 0, 0,0,0);
			");

		$this->query("
			INSERT INTO `divya`.`jos_xpersonaldetails` (`id`, `fullname`, `address`, `mobile_no`, `distributor_id`, `username`, `password`, `page_alias`, `fathers_name`, `pan_no`, `bank_name`, `bank_branch`, `bank_account_no`) VALUES (0, 'root', 'address', '1234567890', 1, 'root', 'root', 'root', 'fname', '1234567890', 'a', 'b', 'c');
			");

$this->query("
			INSERT INTO `divya`.`jos_xpages` (`id`, `alias_for_id`, `alias`, `template`) VALUES (0, 1, 'root', 1);
			');
			");
		// $this->query("INSERT INTO jos_xpages (id,distributor_id,alias) VALUES(0,1,'root')");

		$staff=$this->add('Model_Staff');
		$staff['username']="admin";
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