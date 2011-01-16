<script type="text/javascript">
$(document).ready(function(){
	$('.pix').fancybox();
});
</script>
<div class="schools form">
<?php echo $form->create('School',array('type'=>'file'));?>
	<fieldset>
 		<legend>學校資料修改</legend>
	<?php
		echo $form->input('id',array('label'=>'編號'));
		echo $form->input('name',array('label'=>'學校名稱'));
		echo $form->input('type_id',array('label'=>'分類'));
		echo $html->link($this->data['School']['pix'],"../files/".$this->data['School']['pix'],array('class'=>'pix'));
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
		<li><?php echo $html->link('刪除', array('action' => 'delete', $form->value('School.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('School.id'))); ?></li>
		<li><?php echo $html->link('學校清單', array('action' => 'index'));?></li>
		<li><?php echo $html->link('新增科系', array('controller' => 'departments', 'action' => 'add/'.$this->params['pass'][0])); ?> </li>
	</ul>
</div>
