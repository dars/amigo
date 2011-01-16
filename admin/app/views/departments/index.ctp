<script type="text/javascript">
$(document).ready(function(){
	$('.pix').fancybox();
});
</script>
<div class="departments index">
<h2>各校科系簡介</h2>
<div class="filter_div">
<?php
	echo $form->create('department',array('action'=>'index','type'=>'get'));
	echo $form->input('school',array('type'=>'select','options'=>$school,'label'=>'學校名稱','empty'=>true,'selected'=>@$this->params['url']['school']));
	echo $form->input('category',array('type'=>'select','options'=>$category,'label'=>'科系類別','empty'=>true,'selected'=>@$this->params['url']['category']));
	echo $form->end('過濾');
?>
</div>
<p class="list-nav">
<?php
echo $paginator->counter(array(
'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
));
?></p>
<table cellpadding="0" cellspacing="0">
<tr>
	<th><?php echo $paginator->sort('','id');?></th>
	<th><?php echo $paginator->sort('學校名稱','school_id');?></th>
	<th><?php echo $paginator->sort('科系類別','category_id');?></th>
	<th><?php echo $paginator->sort('簡介','summary');?></th>
	<th><?php echo $paginator->sort('圖片','pix');?></th>
	<th class="actions">&nbsp;</th>
</tr>
<?php
$i = 0;
foreach ($departments as $department):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $department['Department']['id']; ?>
		</td>
		<td class="left">
			<?php echo $department['School']['name']; ?>
		</td>
		<td class="left">
			<?php echo $department['Category']['name']; ?>
		</td>
		<td class="left">
			<?php echo mb_substr(strip_tags($department['Department']['summary']),0,50,'utf8'); ?>
		</td>
		<td>
			<a href="<?php echo $this->webroot?>files/<?php echo $department['Department']['pix']; ?>" class="pix"><?php echo $department['Department']['pix']; ?></a>
		</td>
		<td class="actions">
			<?php echo $html->link('修改', array('action' => 'edit', $department['Department']['id'])); ?>
			<?php echo $html->link('刪除', array('action' => 'delete', $department['Department']['id']), null, sprintf('確定要刪除此筆資料 # %s?', $department['Department']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
</table>
</div>
<div class="paging">
	<?php echo $paginator->prev('<< 上一頁', array(), null, array('class'=>'disabled'));?>
 | 	<?php echo $paginator->numbers();?>
	<?php echo $paginator->next('下一頁 >>', array(), null, array('class' => 'disabled'));?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link('新增各校科系簡介', array('action' => 'add')); ?></li>
	</ul>
</div>
