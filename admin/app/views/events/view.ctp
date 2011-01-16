<div class="events view">
<h2>學校活動</h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>>學校名稱</dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $event['School']['name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>>活動名稱</dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $event['Event']['title']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>>活動內容</dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $event['Event']['body']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>>活動時間</dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $event['Event']['event_time']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>>建立時間</dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $event['Event']['created']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>>修改時間</dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $event['Event']['modified']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link('修改學校活動', array('action' => 'edit', $event['Event']['id'])); ?> </li>
		<li><?php echo $html->link('刪除學校活動', array('action' => 'delete', $event['Event']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $event['Event']['id'])); ?> </li>
		<li><?php echo $html->link('返回學校活動列表', array('action' => 'index')); ?> </li>
		<li><?php echo $html->link('新增學校活動', array('action' => 'add')); ?> </li>
	</ul>
</div>
