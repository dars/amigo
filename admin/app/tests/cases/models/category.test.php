<?php 
/* SVN FILE: $Id$ */
/* Category Test cases generated on: 2010-01-13 21:21:13 : 1263388873*/
App::import('Model', 'Category');

class CategoryTestCase extends CakeTestCase {
	var $Category = null;
	var $fixtures = array('app.category', 'app.department', 'app.department');

	function startTest() {
		$this->Category =& ClassRegistry::init('Category');
	}

	function testCategoryInstance() {
		$this->assertTrue(is_a($this->Category, 'Category'));
	}

	function testCategoryFind() {
		$this->Category->recursive = -1;
		$results = $this->Category->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('Category' => array(
			'id'  => 1,
			'name'  => 'Lorem ipsum dolor '
		));
		$this->assertEqual($results, $expected);
	}
}
?>