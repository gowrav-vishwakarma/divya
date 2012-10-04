<?php

class page_index extends Page {
    function init(){
        parent::init();
        $dist=$this->add('Model_Distributor');
        $dist->addCondition('alias',$_GET['alias']);
        $dist->tryLoadAny();

        $page=$dist->ref('Page')->tryLoadAny();
		$dv=$this->add("View",null,null,array('view/webpage'));    
		$dv->template->trySet('page_matter',$page->get('matter'));   
		$dv->setModel($dist);
    }
}
