<?php 
/* SVN FILE: $Id$ */
/* Course Fixture generated on: 2010-04-01 17:51:14 : 1270115474*/

class CourseFixture extends CakeTestFixture {
	var $name = 'Course';
	var $table = 'courses';
	var $fields = array(
		'id' => array('type'=>'integer', 'null' => false, 'default' => NULL, 'key' => 'primary'),
		'school_id' => array('type'=>'integer', 'null' => true, 'default' => NULL),
		'category_id' => array('type'=>'integer', 'null' => true, 'default' => NULL),
		'summary' => array('type'=>'text', 'null' => true, 'default' => NULL),
		'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1))
	);
	var $records = array(array(
		'id' => 1,
		'school_id' => 1,
		'category_id' => 1,
		'summary' => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.'
	));
}
?>