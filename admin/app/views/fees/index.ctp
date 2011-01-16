<div class="fees index">
<h2>開課日期與費用</h2>
<div class="filter_div">
<?php
	echo $form->create('departments',array('action'=>'index','type'=>'get'));
	echo $form->input('school',array('type'=>'select','options'=>$school,'label'=>'學校名稱','empty'=>true,'selected'=>@$this->params['url']['school']));
	echo $form->input('category',array('type'=>'select','options'=>$category,'label'=>'科系類別','empty'=>true,'selected'=>@$this->params['url']['category']));
	echo $form->end('過濾');
?>
</div>
<p class='list-nav'>
<?php
echo $paginator->counter(array(
'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
));
?></p>
<table cellpadding="0" cellspacing="0">
<tr>
	<th><?php echo $paginator->sort('編號','id');?></th>
	<th><?php echo $paginator->sort('學校名稱','school_id');?></th>
	<th><?php echo $paginator->sort('科系類別','category_id');?></th>
	<th><?php echo $paginator->sort('課程費用','fee');?></th>
	<th><?php echo $paginator->sort('授課語言','lang');?></th>
	<th><?php echo $paginator->sort('開課日期','datetime');?></th>
	<th class="actions">&nbsp;</th>
</tr>
<?php
$i = 0;
foreach ($fees as $fee):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $fee['Fee']['id']; ?>
		</td>
		<td class="left">
			<?php echo $fee['School']['name']; ?>
		</td>
		<td>
			<?php echo $fee['Category']['name']; ?>
		</td>
		<td class="left">
			<?php echo $fee['Fee']['fee']; ?>
		</td>
		<td class="left">
			<?php echo $fee['Fee']['lang']; ?>
		</td>
		<td class="left">
			<?php echo $fee['Fee']['datetime']; ?>
		</td>
		<td class="actions">
			<?php echo $html->link('修改', array('action' => 'edit', $fee['Fee']['id'])); ?>
			<?php echo $html->link('刪除', array('action' => 'delete', $fee['Fee']['id']), null, sprintf('您確定要刪除此比資料 # %s?', $fee['Fee']['id'])); ?>
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
		<li><?php echo $html->link('新增開課日期與費用', array('action' => 'add')); ?></li>
	</ul>
</div>
