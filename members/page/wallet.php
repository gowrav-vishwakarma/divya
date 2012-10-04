<?php
class page_wallet extends Page {
	function init(){
		parent::init();

		$tabs=$this->add('Tabs');

		$mywallet_tab=$tabs->addTab("My Wallet");
		$mywallet_tab->add('View_Error')->set("Under construction");

		$repurchase_pin_tab=$tabs->addTabURL('repurchase_bypin',"Repurchase By Pin");
		$repurchase_wallet_tab=$tabs->addTabURL('repurchase_bywallet',"Repurchase From Wallet");

	}
}