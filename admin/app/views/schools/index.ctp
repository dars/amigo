<div class="schools index">
<h2>學校列表</h2>
<p class='list-nav'>
<?php
echo $paginator->counter(array(
'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
));
?></p>
<table cellpadding="0" cellspacing="0">
<tr>
	<th><?php echo $paginator->sort('編號','id');?></th>
	<th><?php echo $paginator->sort('名稱','name');?></th>
	<th><?php echo $paginator->sort('簡介','summart');?></th>
	<th><?php echo $paginator->sort('類別','type_id');?></th>
	<th class="actions">&nbsp;</th>
</tr>
<?php
$i = 0;
foreach ($schools as $school):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $school['School']['id']; ?>
		</td>
		<td class="left">
			<?php echo $school['School']['name']; ?>
		</td>
		<td class="left">
			<?php echo mb_substr(strip_tags($school['School']['summart']),0,50,'utf8'); ?>
		</td>
		<td>
			<?php echo $school['Type']['name']; ?>
		</td>
		<td class="actions">
			<?php echo $html->link('修改', array('action' => 'edit', $school['School']['id'])); ?>
			<?php echo $html->link('刪除', array('action' => 'delete', $school['School']['id']), null, sprintf(__('確定刪除此筆記錄 # %s?', true), $school['School']['id'])); ?>
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
		<li><?php echo $html->link('新增學校', array('action' => 'add')); ?></li>
	</ul>
</div>
