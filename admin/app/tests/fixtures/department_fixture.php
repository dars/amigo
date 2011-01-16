<?php 
/* SVN FILE: $Id$ */
/* Department Fixture generated on: 2010-01-13 21:21:41 : 1263388901*/

class DepartmentFixture extends CakeTestFixture {
	var $name = 'Department';
	var $table = 'departments';
	var $fields = array(
		'id' => array('type'=>'integer', 'null' => false, 'default' => NULL, 'key' => 'primary'),
		'name' => array('type'=>'string', 'null' => false, 'default' => NULL, 'length' => 50),
		'school_id' => array('type'=>'integer', 'null' => false, 'default' => NULL, 'key' => 'index'),
		'category_id' => array('type'=>'integer', 'null' => false, 'default' => NULL, 'key' => 'index'),
		'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1), 'newfk' => array('column' => 'category_id', 'unique' => 0), 'newfk2' => array('column' => 'school_id', 'unique' => 0))
	);
	var $records = array(array(
		'id'  => 1,
		'name'  => 'Lorem ipsum dolor sit amet',
		'school_id'  => 1,
		'category_id'  => 1
	));
}
?>