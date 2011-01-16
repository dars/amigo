<div class="summers index">
<h2>暑期課程列表</h2>
<p>
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
	<th><?php echo $paginator->sort('時間','datetime');?></th>
	<th><?php echo $paginator->sort('地點','location');?></th>
	<th class="actions">&nbsp;</th>
</tr>
<?php
$i = 0;
foreach ($summers as $summer):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $summer['Summer']['id']; ?>
		</td>
		<td class="left">
			<?php echo $summer['Summer']['name']; ?>
		</td>
		<td class="left">
			<?php echo $summer['School']['name']; ?>
		</td>
		<td class="left">
			<?php echo $summer['Summer']['datetime']; ?>
		</td>
		<td class="left">
			<?php echo $summer['Summer']['location']; ?>
		</td>
		<td class="actions">
			<?php echo $html->link('檢視', array('action' => 'view', $summer['Summer']['id'])); ?>
			<?php echo $html->link('編輯', array('action' => 'edit', $summer['Summer']['id'])); ?>
			<?php echo $html->link('刪除', array('action' => 'delete', $summer['Summer']['id']), null, sprintf('確定刪除此筆資料 %s?', $summer['Summer']['id'])); ?>
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
		<li><?php echo $html->link('新增暑期課程', array('action' => 'add')); ?></li>
	</ul>
</div>
