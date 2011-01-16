<?php
class School extends AppModel {

	var $name = 'School';
	var $validate = array(
		'name' => array('notempty'),
		'type_id' => array('numeric')
	);

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $belongsTo = array(
		'Type' => array(
			'className' => 'Type',
			'foreignKey' => 'type_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
	var $hasMany = array(
		'Course' => array(
			'className' => 'Course',
			'foreignKey' => 'school_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		)
	);

}
?>