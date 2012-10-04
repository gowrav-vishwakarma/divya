<?php

class page_temp extends Page {
	function init(){
		parent::init();

		$m=$this->add('Model_Distributor');
		$grid=$this->add('Grid');
		$m->addExpression('my_points')->set('
			(
				closing_age * (TotalDirectSales/1000) * ((ClosingDirectSales+1000)/1000) * (closing_agents_in_down+1) * ((TotalSelfRepurchase+1000)/1000)
				)
			')->type('money');

		$grid->setModel($m,array('id','name', 'closing_age','TotalDirectSales','ClosingDirectSales','closing_agents_in_down','TotalSelfRepurchase','my_points'));

	}
}