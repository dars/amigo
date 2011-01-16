<?php
class Event extends AppModel {

	var $name = 'Event';
	var $validate = array(
		'school_id' => array('numeric'),
		'title' => array('notempty'),
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