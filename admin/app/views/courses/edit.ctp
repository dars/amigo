<div class="courses form">
<?php echo $form->create('Course');?>
	<fieldset>
 		<legend><?php __('修改課程資料');?></legend>
	<?php
		echo $form->input('id');
		echo $form->input('name',array('label'=>'課程名稱'));
		echo $form->input('school_id',array('label'=>'所屬學校'));
		echo $form->input('category_id',array('label'=>'所屬類別'));
		echo $form->input('content',array('label'=>'課程介紹'));
		echo $form->input('sys_city',array('label'=>'城市'));
		echo $form->input('weight',array('label'=>'排序'));
	?>
	</fieldset>
<?php echo $form->end('送出');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link('刪除', array('action' => 'delete', $form->value('Course.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('Course.id'))); ?></li>
		<li><?php echo $html->link('返回課程列表', array('action' => 'index'));?></li>
	</ul>
</div>
