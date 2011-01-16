<?php 
/* SVN FILE: $Id$ */
/* Event Fixture generated on: 2010-02-09 23:09:01 : 1265728141*/

class EventFixture extends CakeTestFixture {
	var $name = 'Event';
	var $table = 'events';
	var $fields = array(
		'id' => array('type'=>'integer', 'null' => false, 'default' => NULL, 'key' => 'primary'),
		'school_id' => array('type'=>'integer', 'null' => false, 'default' => NULL),
		'title' => array('type'=>'string', 'null' => false, 'default' => NULL),
		'body' => array('type'=>'text', 'null' => false, 'default' => NULL),
		'event_time' => array('type'=>'datetime', 'null' => false, 'default' => NULL),
		'created' => array('type'=>'datetime', 'null' => false, 'default' => NULL),
		'modified' => array('type'=>'datetime', 'null' => false, 'default' => NULL),
		'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1))
	);
	var $records = array(array(
		'id'  => 1,
		'school_id'  => 1,
		'title'  => 'Lorem ipsum dolor sit amet',
		'body'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
		'event_time'  => '2010-02-09 23:09:01',
		'created'  => '2010-02-09 23:09:01',
		'modified'  => '2010-02-09 23:09:01'
	));
}
?>