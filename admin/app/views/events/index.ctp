<div class="events index">
<h2>學校活動</h2>
<p class="list-nav">
<?php
echo $paginator->counter(array(
'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
));
?></p>
<table cellpadding="0" cellspacing="0">
<tr>
	<th><?php echo $paginator->sort('編號','id');?></th>
	<th><?php echo $paginator->sort('學校','school_id');?></th>
	<th><?php echo $paginator->sort('標題','title');?></th>
	<th><?php echo $paginator->sort('內容','body');?></th>
	<th><?php echo $paginator->sort('活動時間','event_time');?></th>
	<th><?php echo $paginator->sort('建立時間','created');?></th>
	<th><?php echo $paginator->sort('修改時間','modified');?></th>
	<th class="actions">&nbsp;</th>
</tr>
<?php
$i = 0;
foreach ($events as $event):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $event['Event']['id']; ?>
		</td>
		<td class="left">
			<?php echo $event['School']['name']; ?>
		</td>
		<td class="left">
			<?php echo mb_substr($event['Event']['title'],0,50,'utf8'); ?>
		</td>
		<td class="left">
			<?php echo mb_substr(strip_tags($event['Event']['body']),0,50,'utf8'); ?>
		</td>
		<td>
			<?php echo $event['Event']['event_time']; ?>
		</td>
		<td>
			<?php echo $event['Event']['created']; ?>
		</td>
		<td>
			<?php echo $event['Event']['modified']; ?>
		</td>
		<td class="actions">
			<?php echo $html->link('檢視', array('action' => 'view', $event['Event']['id'])); ?>
			<?php echo $html->link('修改', array('action' => 'edit', $event['Event']['id'])); ?>
			<?php echo $html->link('刪除', array('action' => 'delete', $event['Event']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $event['Event']['id'])); ?>
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
		<li><?php echo $html->link(__('新增校園活動', true), array('action' => 'add')); ?></li>
	</ul>
</div>
