<?php
/*
CKEditor_upload.php
monkee
2009-11-15 16:47
*/
$config=array();
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

//文件上傳
uploadfile();

function uploadfile(){
	global $config;
	//判斷是否是非法調用
	if(empty($_GET['CKEditorFuncNum'])){
		mkhtml(1,"","錯誤的功能調用請求");
	}
	$fn=$_GET['CKEditorFuncNum'];
	if(!in_array($_GET['type'],$config['type'])){
		mkhtml(1,"","錯誤的文件調用請求");
	}
	$type=$_GET['type'];
	if(is_uploaded_file($_FILES['upload']['tmp_name'])){
		//判斷上傳文件是否允許
		$filearr=pathinfo($_FILES['upload']['name']);
		$filetype=$filearr["extension"];
		if(!in_array($filetype,$config[$type])){
			 mkhtml($fn,"","錯誤的文件類型！");
		}
		//判斷文件大小是否符合要求
		if($_FILES['upload']['size']>$config[$type."_size"]*1024){
			mkhtml($fn,"","上傳的文件不能超過".$config[$type."_size"]."KB！");
		}
		//$filearr=explode(".",$_FILES['upload']['name']);
		//$filetype=$filearr[count($filearr)-1];
		$file_abso=$config[$type."_dir"]."/".$config['name'].".".$filetype;
		$file_host=$_SERVER['DOCUMENT_ROOT'].$file_abso;
		if(move_uploaded_file($_FILES['upload']['tmp_name'],$file_host)){
			mkhtml($fn,$config['site_url'].$file_abso,$config['message']);
		}else{
			mkhtml($fn,"","文件上傳失敗，請檢查上傳目錄設置和目錄讀寫權限");
		}
	}
}
//輸出js調用
function mkhtml($fn,$fileurl,$message){
$str='<script type="text/javascript">window.parent.CKEDITOR.tools.callFunction('.$fn.', \''.$fileurl.'\', \''.$message.'\');</script>';
	exit($str);
}
?>