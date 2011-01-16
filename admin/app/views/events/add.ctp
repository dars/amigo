<div class="events form">
<?php echo $form->create('Event');?>
	<fieldset>
 		<legend>新增學校活動</legend>
	<?php
		echo $form->input('school_id',array('label'=>'學校名稱'));
		echo $form->input('title',array('label'=>'活動名稱'));
		echo $form->input('body',array('label'=>'活動內容'));
		echo $fck->load('Event.body');
		echo $form->input('event_time',array('label'=>'活動時間'));
	?>
	</fieldset>
<?php echo $form->end('送出');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link('返回活動列表', array('action' => 'index'));?></li>
	</ul>
</div>
