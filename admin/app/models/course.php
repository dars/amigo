<?php
class Course extends AppModel {

	var $name = 'Course';
	var $validate = array(
		'name' => array('notempty'),
		'school_id' => array('numeric'),
		'category_id' => array('numeric')
	);

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $belongsTo = array(
		'School' => array(
			'className' => 'School',
			'foreignKey' => 'school_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Category' => array(
			'className' => 'Category',
			'foreignKey' => 'category_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

}
?>