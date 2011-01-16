<?php
class SchoolsController extends AppController {

	var $name = 'Schools';
	function index() {
		$this->School->recursive = 0;
		$this->paginate=array(
			'order'=>'School.weight DESC'
		);
		$this->set('schools', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash('不正確的參數');
			$this->redirect(array('action'=>'index'));
		}
		//$this->set('school', $this->School->read(null, $id));
		$this->set('school', $this->School->find('first',array(
			'conditions'=>array('School.id'=>$id),
			'recursive'=>2
		)));
	}

	function add() {
		if (!empty($this->data)) {
			App::import('vendor','phpthumb',array('file'=>'phpthumb'.DS.'ThumbLib.inc.php'));
			$this->School->create();
			if(!empty($this->data['School']['pix'])){
				if(is_uploaded_file($this->data['School']['pix']['tmp_name'])){
					$thumb=PhpThumbFactory::create($this->data['School']['pix']['tmp_name']);
					$thumb->resize(375,200)->save(WWW_ROOT.'files'.DS.$this->data['School']['pix']['name']);
					$this->data['School']['pix']=$this->data['School']['pix']['name'];
				}else{
					unset($this->data['School']['pix']);
				}
			}else{
				unset($this->data['School']['pix']);
			}
			if ($this->School->save($this->data)) {
				$this->Session->setFlash('資料已新增');
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The School could not be saved. Please, try again.', true));
			}
		}
		$types = $this->School->Type->find('list');
		$this->set(compact('types'));
	}

	function edit($id = null) {
		App::import('vendor','phpthumb',array('file'=>'phpthumb'.DS.'ThumbLib.inc.php'));
		if (!$id && empty($this->data)) {
			$this->Session->setFlash('不正確的參數');
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if(!empty($this->data['School']['pix'])){
				if(is_uploaded_file($this->data['School']['pix']['tmp_name'])){
					$thumb=PhpThumbFactory::create($this->data['School']['pix']['tmp_name']);
					$thumb->resize(375,200)->save(WWW_ROOT.'files'.DS.$this->data['School']['pix']['name']);
					$this->data['School']['pix']=$this->data['School']['pix']['name'];
				}else{
					unset($this->data['School']['pix']);
				}
			}else{
				unset($this->data['School']['pix']);
			}
			if ($this->School->save($this->data)) {
				$this->Session->setFlash('資料已儲存');
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The School could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->School->read(null, $id);
		}
		$types = $this->School->Type->find('list');
		$this->set(compact('types'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash('不正確的參數');
			$this->redirect(array('action'=>'index'));
		}
		if ($this->School->del($id)) {
			$this->Session->setFlash('資料已刪除');
			$this->redirect(array('action'=>'index'));
		}
	}
}
?>