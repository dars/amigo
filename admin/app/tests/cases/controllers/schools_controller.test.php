<?php 
/* SVN FILE: $Id$ */
/* SchoolsController Test cases generated on: 2010-01-13 21:25:17 : 1263389117*/
App::import('Controller', 'Schools');

class TestSchools extends SchoolsController {
	var $autoRender = false;
}

class SchoolsControllerTest extends CakeTestCase {
	var $Schools = null;

	function startTest() {
		$this->Schools = new TestSchools();
		$this->Schools->constructClasses();
	}

	function testSchoolsControllerInstance() {
		$this->assertTrue(is_a($this->Schools, 'SchoolsController'));
	}

	function endTest() {
		unset($this->Schools);
	}
}
?>