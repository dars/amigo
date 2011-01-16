<?php
class FckController extends AppController {
	var $name = 'Fck';
	var $uses=null;
	var $config=array();
	function init(){
		$this->config['type']=array("flash","img"); 				//上傳允許type值
		$this->config['img']=array("jpg","bmp","gif");			//img允許後綴
		$this->config['flash']=array("flv","swf");				//flash允許後綴
		$this->config['flash_size']=200;							//上傳flash大小上限 單位：KB
		$this->config['img_size']=500;							//上傳img大小上限 單位：KB
		$this->config['message']="上傳成功";						//上傳成功後顯示的消息，若為空則不顯示
		$this->config['name']=mktime(); 							//上傳後的文件命名規則 這裏以unix時間戳來命名
		$this->config['flash_dir']="/ckeditor/upload/flash";		//上傳flash文件地址 採用絕對地址 方便upload.php文件放在站內的任何位置 後面不加"/"
		$this->config['img_dir']="/ckeditor/upload/img";			//上傳img文件地址 採用絕對地址 採用絕對地址 方便upload.php文件放在站內的任何位置 後面不加"/"
		$this->config['site_url']="";								//網站的網址 這與圖片上傳後的地址有關 最後不加"/" 可留空
	}
	/*
	var $config = array();
	$config['type']=array("flash","img"); 				//上傳允許type值
	$config['img']=array("jpg","bmp","gif");			//img允許後綴
	$config['flash']=array("flv","swf");				//flash允許後綴
	$config['flash_size']=200;							//上傳flash大小上限 單位：KB
	$config['img_size']=500;							//上傳img大小上限 單位：KB
	$config['message']="上傳成功";						//上傳成功後顯示的消息，若為空則不顯示
	$config['name']=mktime(); 							//上傳後的文件命名規則 這裏以unix時間戳來命名
	$config['flash_dir']="/ckeditor/upload/flash";		//上傳flash文件地址 採用絕對地址 方便upload.php文件放在站內的任何位置 後面不加"/"
	$config['img_dir']="/ckeditor/upload/img";			//上傳img文件地址 採用絕對地址 採用絕對地址 方便upload.php文件放在站內的任何位置 後面不加"/"
	$config['site_url']="";								//網站的網址 這與圖片上傳後的地址有關 最後不加"/" 可留空
	*/
	//文件上傳
	//upload();
	
	function upload(){
		//判斷是否是非法調用
		if(empty($_GET['CKEditorFuncNum'])){
			$this->mkhtml(1,"","錯誤的功能調用請求");
		}
		$fn=$_GET['CKEditorFuncNum'];
		/*
		if(!in_array($_GET['type'],$this->config['type'])){
			$this->mkhtml(1,"","錯誤的文件調用請求");
		}
		*/
		if(is_uploaded_file($_FILES['upload']['tmp_name'])){
			//判斷上傳文件是否允許
			$filearr=pathinfo($_FILES['upload']['name']);
			$filetype=$filearr["extension"];
			/*
			if(!in_array($filetype,$this->config[$type])){
				 $this->mkhtml($fn,"","錯誤的文件類型！");
			}
			//判斷文件大小是否符合要求
			if($_FILES['upload']['size']>$this->config[$type."_size"]*1024){
				$this->mkhtml($fn,"","上傳的文件不能超過".$this->config[$type."_size"]."KB！");
			}
			*/
			$file_name=mktime().".".$filetype;
			$file_abso=WWW_ROOT.'files'.DS.$file_name;
			$file_host=$file_abso;
			if(move_uploaded_file($_FILES['upload']['tmp_name'],$file_host)){
				$this->mkhtml($fn,$this->webroot.DS.'files'.DS.$file_name,'上傳成功');
			}else{
				$this->mkhtml($fn,"","文件上傳失敗，請檢查上傳目錄設置和目錄讀寫權限");
			}
		}
	}
	//輸出js調用
	function mkhtml($fn,$fileurl,$message){
	$str='<script type="text/javascript">window.parent.CKEDITOR.tools.callFunction('.$fn.', \''.$fileurl.'\', \''.$message.'\');</script>';
		exit($str);
	}
}
?>