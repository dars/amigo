<?php
class Summer extends AppModel {

	var $name = 'Summer';
	var $validate = array(
		'school_id' => array('numeric')
	);

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $belongsTo = array(
		'School' => array(
			'className' => 'School',
			'foreignKey' => 'school_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

}
?>