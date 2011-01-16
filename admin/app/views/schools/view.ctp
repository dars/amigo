<div class="schools view">
<h2><?php echo $school['School']['name']; ?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>>所屬類別</dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $html->link($school['Type']['name'], array('controller' => 'types', 'action' => 'view', $school['Type']['id'])); ?>
			&nbsp;
		</dd>
		<?php if(!empty($school['School']['pix'])){?>
		<dt<?php if ($i % 2 == 0) echo $class;?>>圖片</dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<img src="../../files/<?php echo $school['School']['pix']?>" />
			&nbsp;
		</dd>
		<?php }?>
		<dt<?php if ($i % 2 == 0) echo $class;?>>列表簡介</dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $school['School']['summary2']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>>簡介</dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $school['School']['summart']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link('修改', array('action' => 'edit', $school['School']['id'])); ?> </li>
		<li><?php echo $html->link('刪除', array('action' => 'delete', $school['School']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $school['School']['id'])); ?> </li>
		<li><?php echo $html->link('學校列表', array('action' => 'index')); ?> </li>
		<li><?php echo $html->link('新增學校', array('action' => 'add')); ?> </li>
		<li><?php echo $html->link('科系列表', array('controller' => 'departments', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link('新增科系', array('controller' => 'departments', 'action' => 'add')); ?> </li>
	</ul>
</div>
	<div class="related">
	<h3>學校相關科系</h3>
	<?php if (!empty($school['Department'])):?>
	<table cellpadding = "0" cellspacing = "0" style="width:450px;">
	<tr>
		<th>編號</th>
		<th>科系名稱</th>
		<th><?php __('Category Id'); ?></th>
		<th class="actions">&nbsp;</th>
	</tr>
	<?php
		$i = 0;
		foreach ($school['Department'] as $department):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $department['id'];?></td>
			<td style="text-align:left;"><?php echo $department['name'];?></td>
			<td><?php echo $department['Category']['name']?></td>
			<td class="actions">
				<?php echo $html->link('檢視', array('controller' => 'departments', 'action' => 'view', $department['id'])); ?>
				<?php echo $html->link('修改', array('controller' => 'departments', 'action' => 'edit', $department['id'])); ?>
				<?php echo $html->link('刪除', array('controller' => 'departments', 'action' => 'delete', $department['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $department['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>
	<div class="actions">
		<ul>
			<li><?php echo $html->link('新增科系', array('controller' => 'departments', 'action' => 'add/'.$this->params['pass'][0]));?> </li>
		</ul>
	</div>
</div>
