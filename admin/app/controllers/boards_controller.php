<?php
class BoardsController extends AppController {

	var $name = 'Boards';
	var $helpers = array('Html', 'Form');

	function index() {
		$this->pageTitle="最新消息";
		$this->Board->recursive = 0;
		$this->paginate=array('order'=>'Board.id DESC');
		$this->set('boards', $this->paginate());
	}

	function view($id = null) {
		$this->pageTitle="預覽";
		if (!$id) {
			$this->Session->setFlash(__('資料不存在，可能已被刪除或其他原因異常.', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->set('board', $this->Board->read(null, $id));
	}

	function add() {
		$this->pageTitle="新增最新消息";
		if (!empty($this->data)) {
			$this->Board->create();
			if ($this->Board->save($this->data)) {
				$this->Session->setFlash(__('最新消息資料已新增', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('資料新增失敗，請重新再試.', true));
			}
		}
	}

	function edit($id = null) {
		$this->pageTitle="修改消息";
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('資料不存在，可能已被刪除或其他原因異常.', true));
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ($this->Board->save($this->data)) {
				$this->Session->setFlash(__('您修改的資料已儲存', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('資料儲存失敗，請重新再試.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Board->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('資料不存在，可能已被刪除或其他原因異常.', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Board->del($id)) {
			$this->Session->setFlash(__('最新消息資料已刪除', true));
			$this->redirect(array('action'=>'index'));
		}
	}

}
?>