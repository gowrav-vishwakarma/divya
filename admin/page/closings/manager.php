<?php
class page_closings_manager extends Page{

	function init(){
		parent::init();

		$tabs=$this->add('Tabs');
		$tabs->addTabURL('closings_report',"Report");
		$tabs->addTabURL('closings_main',"Perform Closing");


	}
}