<div class="courses index">
<h2>課程列表</h2>
<div class="filter_div">
<?php
	echo $form->create('courses',array('action'=>'index','type'=>'get'));
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
	<th><?php echo $paginator->sort('課程名稱','name');?></th>
	<th><?php echo $paginator->sort('學校名稱','school_id');?></th>
	<th><?php echo $paginator->sort('所屬類別','category_id');?></th>
	<th class="actions">&nbsp;</th>
</tr>
<?php
$i = 0;
foreach ($courses as $course):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $course['Course']['id']; ?>
		</td>
		<td class="left">
			<?php echo $course['Course']['name']; ?>
		</td>
		<td class="left">
			<?php echo  $html->link($course['School']['name'],array('action'=>'index','?'=>array('school'=>$course['Course']['school_id'])))?>
		</td>
		<td class="left">
			<?php echo $html->link($course['Category']['name'],array('action'=>'index','?'=>array('category'=>$course['Course']['category_id']))); ?>
		</td>
		<td class="actions">
			<?php echo $html->link('修改', array('action' => 'edit', $course['Course']['id'])); ?>
			<?php echo $html->link('刪除', array('action' => 'delete', $course['Course']['id']), null, sprintf('確定刪除此比資料 # %s?', $course['Course']['id'])); ?>
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
		<li><?php echo $html->link('新增課程', array('action' => 'add')); ?></li>
	</ul>
</div>
