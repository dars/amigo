<div class="boards view">
<h2>最新消息 - 預覽</h2>
	<table class='info_view'><?php $i = 0; $class = ' class="altrow"';?>
		<tr>
			<th>編號</th>
			<td>
				<?php echo $board['Board']['id']; ?>
				&nbsp;
			</td>
		</tr>
		<tr>
			<th>標題</th>
			<td>
				<?php echo $board['Board']['subject']; ?>
				&nbsp;
			</td>
		</tr>
		<tr>
			<th>內容</th>
			<td>
				<div style='clear:both;'></div>
				<?php echo $board['Board']['content']; ?>
				&nbsp;
				<div style='clear:both;'></div>
			</td>
		</tr>
		<tr>
			<th>建立時間</th>
			<td>
				<?php echo $board['Board']['created']; ?>
				&nbsp;
			</td>
		</tr>
		<tr>
			<th>最後更新時間</th>
			<td>
				<?php echo $board['Board']['modified']; ?>
				&nbsp;
			</td>
		</tr>
	</table>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link('修改', array('action' => 'edit', $board['Board']['id'])); ?> </li>
		<li><?php echo $html->link('刪除', array('action' => 'delete', $board['Board']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $board['Board']['id'])); ?> </li>
		<li><?php echo $html->link('回到列表', array('action' => 'index')); ?> </li>
		<li><?php echo $html->link('新增', array('action' => 'add')); ?> </li>
	</ul>
</div>
