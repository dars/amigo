<?php
class FeesController extends AppController {
	var $name = 'Fees';
	var $uses = array('Fee','School','Category');

	function index() {
		$this->Fee->recursive = 0;
		$this->set('fees', $this->paginate());
		$conditions=array();
		if(!empty($this->params['url']['school'])){
			$conditions['School.id']=$this->params['url']['school'];
		}
		if(!empty($this->params['url']['category'])){
			$conditions['Category.id']=$this->params['url']['category'];
		}
		$this->paginate=array('conditions'=>$conditions,'order'=>'Fee.school_id DESC');
		$this->set('fees', $this->paginate());
		$this->set('school',$this->School->find('list'));
		$this->set('category',$this->Category->find('list'));
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid Fee', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('fee', $this->Fee->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			if($this->data['Fee']['all_category']==1){
				//$this->Fee->deleteAll(array('Fee.school_id'=>array($this->data['Fee']['school_id'])));
				$list = $this->Category->find('list');
				$keys = array_keys($list);
				$err = 0;
				foreach($keys as $k){
					$this->Fee->create();
					$tmp=$this->data;
					$tmp['Fee']['category_id']=$k;
					if (!$this->Fee->save($tmp)) {
						$this->Session->setFlash('資料儲存異常');
						break;
					}
				}
				if($err == 0){
					$this->Session->setFlash('資料已新增');
					$this->redirect(array('action' => 'index'));
				}
			}else{
				$this->Fee->create();
				if ($this->Fee->save($this->data)) {
					$this->Session->setFlash('資料已新增');
					$this->redirect(array('action' => 'index'));
				} else {
					$this->Session->setFlash('資料儲存異常');
				}
			}
		}
		$schools = $this->School->find('list');
		$categories = $this->Category->find('list');
		$this->set(compact('schools', 'categories'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid Fee', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Fee->save($this->data)) {
				$this->Session->setFlash('資料已儲存');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('資料儲存異常');
			}
		}
		if (empty($this->data)) {
			$schools = $this->School->find('list');
			$categories = $this->Category->find('list');
			$this->set(compact('schools', 'categories'));
			$this->data = $this->Fee->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for Fee', true));
			$this->redirect(array('action' => 'index'));
		}
		if ($this->Fee->del($id)) {
			$this->Session->setFlash('資料已刪除');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('資料處理異常');
		$this->redirect(array('action' => 'index'));
	}

}
?>