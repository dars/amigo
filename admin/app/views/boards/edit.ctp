<?php echo $javascript->link('ckeditor/ckeditor', NULL, false);?>
<div class="boards form">
<?php echo $form->create('Board');?>
	<fieldset>
 		<legend><?php __('修改最新消息');?></legend>
	<?php
		echo $form->input('id',array('type'=>'hidden'));
		echo $form->input('subject',array('label'=>'標題','style'=>'font:12px verdana;'));
		echo $form->input('content',array('label'=>'內容'));
		echo $fck->load('Board.content');
	?>
	</fieldset>
<?php echo $form->end('確定修改');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link('刪除', array('action' => 'delete', $form->value('Board.id')), null, sprintf(__('確定刪除此筆記錄 # %s？', true), $form->value('Board.id'))); ?></li>
		<li><?php echo $html->link('最新消息列表', array('action' => 'index'));?></li>
	</ul>
</div>
