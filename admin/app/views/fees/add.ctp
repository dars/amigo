<div class="fees form">
<?php echo $form->create('Fee');?>
	<fieldset>
 		<legend>新增開課日期與費用</legend>
	<?php
		echo $form->input('school_id',array('label'=>'學校名稱'));
		echo $form->input('category_id',array('label'=>'科系類別'));
		echo $form->input('fee',array('label'=>'課程費用'));
		echo $form->input('lang',array('label'=>'授課語言'));
		echo $form->input('datetime',array('label'=>'開課日期'));
		echo $form->input('all_category',array('label'=>'適用全類別？','type'=>'checkbox'));
	?>
	</fieldset>
<?php echo $form->end('送出');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link('返回列表', array('action' => 'index'));?></li>
	</ul>
</div>
