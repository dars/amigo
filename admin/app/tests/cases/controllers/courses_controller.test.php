<?php 
/* SVN FILE: $Id$ */
/* CoursesController Test cases generated on: 2010-04-01 17:51:40 : 1270115500*/
App::import('Controller', 'Courses');

class TestCourses extends CoursesController {
	var $autoRender = false;
}

class CoursesControllerTest extends CakeTestCase {
	var $Courses = null;

	function startTest() {
		$this->Courses = new TestCourses();
		$this->Courses->constructClasses();
	}

	function testCoursesControllerInstance() {
		$this->assertTrue(is_a($this->Courses, 'CoursesController'));
	}

	function endTest() {
		unset($this->Courses);
	}
}
?>