<?php 
/* SVN FILE: $Id$ */
/* Fee Test cases generated on: 2010-10-27 18:25:49 : 1288175149*/
App::import('Model', 'Fee');

class FeeTestCase extends CakeTestCase {
	var $Fee = null;
	var $fixtures = array('app.fee', 'app.school', 'app.category');

	function startTest() {
		$this->Fee =& ClassRegistry::init('Fee');
	}

	function testFeeInstance() {
		$this->assertTrue(is_a($this->Fee, 'Fee'));
	}

	function testFeeFind() {
		$this->Fee->recursive = -1;
		$results = $this->Fee->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('Fee' => array(
			'id' => 1,
			'school_id' => 1,
			'category_id' => 1,
			'fee' => 'Lorem ipsum dolor sit amet',
			'lang' => 'Lorem ipsum dolor sit amet',
			'datetime' => 'Lorem ipsum dolor sit amet',
			'created' => '2010-10-27 18:25:49',
			'modified' => '2010-10-27 18:25:49'
		));
		$this->assertEqual($results, $expected);
	}
}
?>