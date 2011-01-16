<?php 
/* SVN FILE: $Id$ */
/* Event Test cases generated on: 2010-02-09 23:09:01 : 1265728141*/
App::import('Model', 'Event');

class EventTestCase extends CakeTestCase {
	var $Event = null;
	var $fixtures = array('app.event', 'app.school');

	function startTest() {
		$this->Event =& ClassRegistry::init('Event');
	}

	function testEventInstance() {
		$this->assertTrue(is_a($this->Event, 'Event'));
	}

	function testEventFind() {
		$this->Event->recursive = -1;
		$results = $this->Event->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('Event' => array(
			'id'  => 1,
			'school_id'  => 1,
			'title'  => 'Lorem ipsum dolor sit amet',
			'body'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
			'event_time'  => '2010-02-09 23:09:01',
			'created'  => '2010-02-09 23:09:01',
			'modified'  => '2010-02-09 23:09:01'
		));
		$this->assertEqual($results, $expected);
	}
}
?>