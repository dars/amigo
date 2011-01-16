<?php
class CoursesController extends AppController {

	var $name = 'Courses';
	var $uses=array('Course','School','Category');
	
	function index() {
		$this->Course->recursive = 0;
		$conditions=array();
		if(!empty($this->params['url']['school'])){
			$conditions['School.id']=$this->params['url']['school'];
		}
		if(!empty($this->params['url']['category'])){
			$conditions['Category.id']=$this->params['url']['category'];
		}
		$this->paginate=array('conditions'=>$conditions,'order'=>'Course.school_id ASC,Course.category_id ASC,Course.weight DESC');
		$this->set('courses', $this->paginate());
		$this->set('school',$this->School->find('list'));
		$this->set('category',$this->Category->find('list'));
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash('資料異常');
			$this->redirect(array('action'=>'index'));
		}
		$this->set('course', $this->Course->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Course->create();
			if ($this->Course->save($this->data)) {
				$this->Session->setFlash('資料已儲存');
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The Course could not be saved. Please, try again.', true));
			}
		}
		$schools = $this->School->find('list');
		$categories = $this->Category->find('list');
		$this->set(compact('schools', 'categories'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash('資料異常');
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ($this->Course->save($this->data)) {
				$this->Session->setFlash('資料已儲存');
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The Course could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Course->read(null, $id);
		}
		$schools = $this->Course->School->find('list');
		$categories = $this->Course->Category->find('list');
		$this->set(compact('schools','categories'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash('資料異常');
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Course->del($id)) {
			$this->Session->setFlash('資料已刪除');
			$this->redirect(array('action'=>'index'));
		}
	}

}
?>