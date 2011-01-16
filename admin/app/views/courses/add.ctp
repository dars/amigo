<div class="courses form">
<?php echo $form->create('Course');?>
	<fieldset>
 		<legend><?php __('新增課程');?></legend>
	<?php
		echo $form->input('name',array('label'=>'課程名稱'));
		echo $form->input('school_id',array('label'=>'所屬學校','selected'=>@$this->params['pass'][0]));
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
		<li><?php echo $html->link('返回課程列表', array('action' => 'index'));?></li>
	</ul>
</div>
