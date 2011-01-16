<?php
class FckHelper extends Helper{
	var $helpers=Array('Html','Javascript');
	function load($id){
		$did='';
		foreach(explode('.',$id) as $v){
			$did.=ucfirst($v);
		}
		$code="CKEDITOR.replace('".$did."',{
        toolbar :[
			['Cut','Copy','Paste','PasteText','PasteFromWord'],
    		['Undo','Redo','-','SelectAll','RemoveFormat'],
    		['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
    		['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
    		['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],'/',
    		['Link','Unlink','Anchor'],
    		['Image','Table','HorizontalRule','SpecialChar'],
    		['Styles','Format','Font','FontSize'],
    		['TextColor','BGColor'],
		    ['Maximize']],
		width:750,
        filebrowserUploadUrl : '".$this->webroot."fck/upload'
		});";
		return $this->Javascript->codeBlock($code);
	}
}
?>