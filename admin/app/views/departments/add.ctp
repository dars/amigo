<div class="departments form">
<?php echo $form->create('Department',array('type'=>'file'));?>
	<fieldset>
 		<legend>新增各校科系簡介</legend>
	<?php
		echo $form->input('school_id',array('label'=>'學校名稱'));
		echo $form->input('category_id',array('label'=>'科系名稱'));
		echo $form->input('summary',array('label'=>'簡介說明'));
		echo $form->input('pix',array('label'=>'圖片','type'=>'file'));
		echo $form->input('weight',array('label'=>'排序'));
	?>
	</fieldset>
<?php echo $form->end('儲存');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link('返回列表', array('action' => 'index'));?></li>
	</ul>
</div>
