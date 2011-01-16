<div class="boards index">
<h2><?php __('最新消息');?></h2>
<p style='text-align:right;' class='list-nav'>
<?php
echo $paginator->counter(array(
'format' => __('頁面 %page% / %pages%', true)
));
/*
echo $paginator->counter(array(
'format' => __('頁面 %page% / %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
));
*/
?></p>
<table cellpadding="0" cellspacing="0">
<tr>
	<th><?php echo $paginator->sort('編號','id');?></th>
	<th><?php echo $paginator->sort('標題','subject');?></th>
	<th><?php echo $paginator->sort('建立時間','created');?></th>
	<th><?php echo $paginator->sort('最後更新時間','modified');?></th>
	<th class="actions">&nbsp;</th>
</tr>
<?php
$i = 0;
foreach ($boards as $board):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $board['Board']['id']; ?>
		</td>
		<td style='padding-right:5px;padding-left:5px;text-align:left;'>
			<?php echo $board['Board']['subject']; ?>
		</td>
		<td>
			<?php echo $board['Board']['created']; ?>
		</td>
		<td>
			<?php echo $board['Board']['modified']; ?>
		</td>
		<td class="actions">
			<?php echo $html->link('預覽', array('action' => 'view', $board['Board']['id'])); ?>
			<?php echo $html->link('修改', array('action' => 'edit', $board['Board']['id'])); ?>
			<?php echo $html->link('刪除', array('action' => 'delete', $board['Board']['id']), null, sprintf('確定刪除此比記錄 # %s？', $board['Board']['id'])); ?>
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
		<li><?php echo $html->link("新增最新消息", array('action' => 'add')); ?></li>
	</ul>
</div>
