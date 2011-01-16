<?php 
/* SVN FILE: $Id$ */
/* School Test cases generated on: 2010-01-13 21:22:09 : 1263388929*/
App::import('Model', 'School');

class SchoolTestCase extends CakeTestCase {
	var $School = null;
	var $fixtures = array('app.school', 'app.type', 'app.department', 'app.department');

	function startTest() {
		$this->School =& ClassRegistry::init('School');
	}

	function testSchoolInstance() {
		$this->assertTrue(is_a($this->School, 'School'));
	}

	function testSchoolFind() {
		$this->School->recursive = -1;
		$results = $this->School->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('School' => array(
			'id'  => 1,
			'name'  => 'Lorem ipsum dolor sit amet',
			'summart'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
			'type_id'  => 1
		));
		$this->assertEqual($results, $expected);
	}
}
?>