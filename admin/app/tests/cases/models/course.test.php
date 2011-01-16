<?php 
/* SVN FILE: $Id$ */
/* Course Test cases generated on: 2010-04-01 17:51:14 : 1270115474*/
App::import('Model', 'Course');

class CourseTestCase extends CakeTestCase {
	var $Course = null;
	var $fixtures = array('app.course', 'app.school', 'app.category');

	function startTest() {
		$this->Course =& ClassRegistry::init('Course');
	}

	function testCourseInstance() {
		$this->assertTrue(is_a($this->Course, 'Course'));
	}

	function testCourseFind() {
		$this->Course->recursive = -1;
		$results = $this->Course->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('Course' => array(
			'id' => 1,
			'school_id' => 1,
			'category_id' => 1,
			'summary' => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.'
		));
		$this->assertEqual($results, $expected);
	}
}
?>