<div class="schools form">
<?php echo $form->create('School',array('type'=>'file'));?>
	<fieldset>
 		<legend>新增學校</legend>
	<?php
		echo $form->input('name',array('label'=>'學校名稱'));
		echo $form->input('type_id',array('label'=>'分類'));
		echo $form->input('pix',array('label'=>'列表圖片','type'=>'file'));
		echo $form->input('summary2',array('label'=>'列表簡介','type'=>'textarea'));
		echo $form->input('summart',array('label'=>'簡介'));
		echo $fck->load('School.summart');
		echo $form->input('weight',array('label'=>'排序'));
	?>
	</fieldset>
<?php echo $form->end('送出');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link('學校列表', array('action' => 'index'));?></li>
	</ul>
</div>
