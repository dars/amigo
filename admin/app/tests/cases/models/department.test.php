<?php 
/* SVN FILE: $Id$ */
/* Department Test cases generated on: 2010-01-13 21:21:42 : 1263388902*/
App::import('Model', 'Department');

class DepartmentTestCase extends CakeTestCase {
	var $Department = null;
	var $fixtures = array('app.department', 'app.school', 'app.category');

	function startTest() {
		$this->Department =& ClassRegistry::init('Department');
	}

	function testDepartmentInstance() {
		$this->assertTrue(is_a($this->Department, 'Department'));
	}

	function testDepartmentFind() {
		$this->Department->recursive = -1;
		$results = $this->Department->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('Department' => array(
			'id'  => 1,
			'name'  => 'Lorem ipsum dolor sit amet',
			'school_id'  => 1,
			'category_id'  => 1
		));
		$this->assertEqual($results, $expected);
	}
}
?>