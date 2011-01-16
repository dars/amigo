<?php 
/* SVN FILE: $Id$ */
/* FeesController Test cases generated on: 2010-10-27 18:26:19 : 1288175179*/
App::import('Controller', 'Fees');

class TestFees extends FeesController {
	var $autoRender = false;
}

class FeesControllerTest extends CakeTestCase {
	var $Fees = null;

	function startTest() {
		$this->Fees = new TestFees();
		$this->Fees->constructClasses();
	}

	function testFeesControllerInstance() {
		$this->assertTrue(is_a($this->Fees, 'FeesController'));
	}

	function endTest() {
		unset($this->Fees);
	}
}
?>