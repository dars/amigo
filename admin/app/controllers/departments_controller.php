<?php
class DepartmentsController extends AppController {
	var $name = 'Departments';
	var $uses = array('Department','School','Category');
	function index() {
		$this->Department->recursive = 0;
		$conditions=array();
		if(!empty($this->params['url']['school'])){
			$conditions['School.id']=$this->params['url']['school'];
		}
		if(!empty($this->params['url']['category'])){
			$conditions['Category.id']=$this->params['url']['category'];
		}
		$this->paginate=array('conditions'=>$conditions,'order'=>'Department.school_id ASC,Department.weight DESC');
		$this->set('departments', $this->paginate());
		$this->set('school',$this->School->find('list'));
		$this->set('category',$this->Category->find('list'));
	}

	function add() {
		if (!empty($this->data)) {
			App::import('vendor','phpthumb',array('file'=>'phpthumb'.DS.'ThumbLib.inc.php'));
			$this->Department->create();
			if(!empty($this->data['Department']['pix'])){
				if(is_uploaded_file($this->data['Department']['pix']['tmp_name'])){
					$thumb=PhpThumbFactory::create($this->data['Department']['pix']['tmp_name']);
					$thumb->resize(375,200)->save(WWW_ROOT.'files'.DS.$this->data['Department']['pix']['name']);
					$this->data['Department']['pix']=$this->data['Department']['pix']['name'];
				}else{
					unset($this->data['Department']['pix']);
				}
			}else{
				unset($this->data['Department']['pix']);
			}
			if ($this->Department->save($this->data)) {
				$this->Session->setFlash('資料已新增');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('資料儲存異常');
			}
		}
		$schools = $this->School->find('list');
		$categories = $this->Category->find('list');
		$this->set(compact('schools', 'categories'));
	}

	function edit($id = null) {
		App::import('vendor','phpthumb',array('file'=>'phpthumb'.DS.'ThumbLib.inc.php'));
		if (!$id && empty($this->data)) {
			$this->Session->setFlash('儲存資料異常');
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if(!empty($this->data['Department']['pix'])){
				if(is_uploaded_file($this->data['Department']['pix']['tmp_name'])){
					$thumb=PhpThumbFactory::create($this->data['Department']['pix']['tmp_name']);
					$thumb->resize(375,200)->save(WWW_ROOT.'files'.DS.$this->data['Department']['pix']['name']);
					$this->data['Department']['pix']=$this->data['Department']['pix']['name'];
				}else{
					unset($this->data['Department']['pix']);
				}
			}else{
				unset($this->data['Department']['pix']);
			}
			if ($this->Department->save($this->data)) {
				$this->Session->setFlash('資料已儲存');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('儲存資料失敗');
			}
		}
		if (empty($this->data)) {
			$schools = $this->School->find('list');
			$categories = $this->Category->find('list');
			$this->set(compact('schools', 'categories'));
			$this->data = $this->Department->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash('參數異常');
			$this->redirect(array('action' => 'index'));
		}
		if ($this->Department->del($id)) {
			$this->Session->setFlash('資料已刪除');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('刪除異常');
		$this->redirect(array('action' => 'index'));
	}

}
?>