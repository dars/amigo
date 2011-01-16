<?php 
/* SVN FILE: $Id$ */
/* Category Fixture generated on: 2010-01-13 21:20:50 : 1263388850*/

class CategoryFixture extends CakeTestFixture {
	var $name = 'Category';
	var $table = 'categories';
	var $fields = array(
		'id' => array('type'=>'integer', 'null' => false, 'default' => NULL, 'key' => 'primary'),
		'name' => array('type'=>'string', 'null' => true, 'default' => NULL, 'length' => 20),
		'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1))
	);
	var $records = array(array(
		'id'  => 1,
		'name'  => 'Lorem ipsum dolor '
	));
}
?>