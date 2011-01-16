<div class="summers form">
<?php echo $form->create('Summer');?>
	<fieldset>
 		<legend>新增暑期課程</legend>
	<?php
		echo $form->input('school_id',array('label'=>'學校名稱'));
		echo $form->input('name',array('label'=>'課程名稱'));
		echo $form->input('datetime',array('label'=>'時間'));
		echo $form->input('location',array('label'=>'地點'));
		echo $form->input('remark',array('label'=>'備註'));
	?>
	</fieldset>
<?php echo $form->end('送出');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link('返回列表', array('action' => 'index'));?></li>
	</ul>
</div>
