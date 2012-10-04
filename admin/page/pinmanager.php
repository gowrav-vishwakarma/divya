<?php

class page_pinmanager extends Page {
	function init(){
		parent::init();

		$tabs=$this->add('Tabs');

		$pin_report_tab=$tabs->addTabURL('pin_report', 'Pin Report');
		$pin_gen_tab=$tabs->addTabURL('pin_generate', 'Pin Generate');
		$pin_transfer_tab=$tabs->addTabURL('pin_transfer', 'Pin Transfer');

	}
}