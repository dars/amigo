<?php echo $javascript->link('ckeditor/ckeditor', NULL, false);?>
<div class="boards form">
<?php echo $form->create('Board');?>
	<fieldset>
 		<legend>新增最新消息</legend>
	<?php
		echo $form->input('subject',array('label'=>'標題','style'=>'font:12px verdana;'));
		echo $form->input('content',array('label'=>'內容'));
		echo $fck->load('Board.content');
	?>
	</fieldset>
<?php echo $form->end('確定送出');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link('最新消息列表', array('action' => 'index'));?></li>
	</ul>
</div>
