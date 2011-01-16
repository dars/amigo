<?php 
/* SVN FILE: $Id$ */
/* EventsController Test cases generated on: 2010-02-09 23:09:23 : 1265728163*/
App::import('Controller', 'Events');

class TestEvents extends EventsController {
	var $autoRender = false;
}

class EventsControllerTest extends CakeTestCase {
	var $Events = null;

	function startTest() {
		$this->Events = new TestEvents();
		$this->Events->constructClasses();
	}

	function testEventsControllerInstance() {
		$this->assertTrue(is_a($this->Events, 'EventsController'));
	}

	function endTest() {
		unset($this->Events);
	}
}
?>