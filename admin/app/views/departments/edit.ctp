<script type="text/javascript">
$(document).ready(function(){
	$('.pix').fancybox();
});
</script>
<div class="departments form">
<?php echo $form->create('Department',array('type'=>'file'));?>
	<fieldset>
 		<legend>修改各校科系簡介</legend>
	<?php
		echo $form->input('id',array('label'=>'編號'));
		echo $form->input('school_id',array('label'=>'學校名稱'));
		echo $form->input('category_id',array('label'=>'科系名稱'));
		echo $form->input('summary',array('label'=>'簡介說明'));
		echo $form->input('pix',array('label'=>'圖片','type'=>'file'));
		echo $html->link($this->data['Department']['pix'],"../files/".$this->data['Department']['pix'],array('class'=>'pix'));
		echo $form->input('weight',array('label'=>'排序'));
	?>
	</fieldset>
<?php echo $form->end('儲存');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link('刪除', array('action' => 'delete', $form->value('Department.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('Department.id'))); ?></li>
		<li><?php echo $html->link('返回列表', array('action' => 'index'));?></li>
	</ul>
</div>
