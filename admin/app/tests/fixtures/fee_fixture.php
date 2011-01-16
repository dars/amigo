<?php 
/* SVN FILE: $Id$ */
/* Fee Fixture generated on: 2010-10-27 18:25:49 : 1288175149*/

class FeeFixture extends CakeTestFixture {
	var $name = 'Fee';
	var $table = 'fees';
	var $fields = array(
		'id' => array('type'=>'integer', 'null' => true, 'default' => NULL, 'key' => 'primary'),
		'school_id' => array('type'=>'integer', 'null' => true, 'default' => NULL),
		'category_id' => array('type'=>'integer', 'null' => true, 'default' => NULL),
		'fee' => array('type'=>'string', 'null' => true, 'default' => NULL),
		'lang' => array('type'=>'string', 'null' => true, 'default' => NULL),
		'datetime' => array('type'=>'string', 'null' => true, 'default' => NULL),
		'created' => array('type'=>'datetime', 'null' => true, 'default' => NULL),
		'modified' => array('type'=>'datetime', 'null' => true, 'default' => NULL),
		'indexes' => array()
	);
	var $records = array(array(
		'id' => 1,
		'school_id' => 1,
		'category_id' => 1,
		'fee' => 'Lorem ipsum dolor sit amet',
		'lang' => 'Lorem ipsum dolor sit amet',
		'datetime' => 'Lorem ipsum dolor sit amet',
		'created' => '2010-10-27 18:25:49',
		'modified' => '2010-10-27 18:25:49'
	));
}
?>