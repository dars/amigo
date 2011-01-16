<?php
class SummersController extends AppController {

	var $name = 'Summers';
	var $uses = array('Summer','School');
	function index() {
		$this->Summer->recursive = 0;
		$this->set('summers', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash('資料異常');
			$this->redirect(array('action' => 'index'));
		}
		$this->set('summer', $this->Summer->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Summer->create();
			if ($this->Summer->save($this->data)) {
				$this->Session->setFlash('資料已儲存');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('資料儲存異常');
			}
		}
		$schools = $this->School->find('list');
		$this->set(compact('schools'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash('資料異常');
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Summer->save($this->data)) {
				$this->Session->setFlash('資料已儲存');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('資料儲存異常');
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Summer->read(null, $id);
			$schools = $this->School->find('list');
		$this->set(compact('schools'));
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash('資料異常');
			$this->redirect(array('action' => 'index'));
		}
		if ($this->Summer->del($id)) {
			$this->Session->setFlash('資料已刪除');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('資料刪除異常');
		$this->redirect(array('action' => 'index'));
	}

}
?>