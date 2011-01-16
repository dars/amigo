<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<?php echo $html->charset(); ?>
	<title>
		AMIGO名格留學遊學諮詢中心
		<?php echo $title_for_layout; ?>
	</title>
	<?php
		echo $html->meta('icon');
		echo $html->css('cake.generic');
		echo $html->css('common');
		echo $html->css('jquery.fancybox-1.3.0');
		echo $javascript->link('jquery-1.4');
		
		echo $javascript->link('ckeditor/ckeditor');
		echo $javascript->link('jquery.fancybox-1.3.0.pack');
		echo $javascript->link('jquery.easing-1.3.pack');
		echo $javascript->link('jquery.mousewheel-3.0.2.pack');
		echo $javascript->link('script');
		echo $scripts_for_layout;
	?>
</head>
<body>
	<div id="container">
		<div id="header">
			<h1>AMIGO名格留學遊學諮詢中心</h1>
		</div>
		<div id="main-nav">
			<ul>
				<li><?php echo $html->link('學校列表',array('controller'=>'schools','action'=>'index'))?></li>
				<li><?php echo $html->link('學校科系說明',array('controller'=>'departments','action'=>'index'))?></li>
				<li><?php echo $html->link('課程列表',array('controller'=>'courses','action'=>'index'))?></li>
				<li><?php echo $html->link('開課日期與費用',array('controller'=>'fees','action'=>'index'))?></li>
				<li><?php echo $html->link('學校活動',array('controller'=>'events','action'=>'index'))?></li>
				<li><?php echo $html->link('暑期課程',array('controller'=>'summers','action'=>'index'))?></li>
				<li><?php echo $html->link('最新消息',array('controller'=>'boards','action'=>'index'))?></li>
			</ul>
		</div>
		<div id="content">

			<?php $session->flash(); ?>

			<?php echo $content_for_layout; ?>

		</div>
		<div id="footer">
			<?php echo $html->image('dj.studio.gif',array('alt'=>"DJ Studio 迪傑工作室", 'border'=>"0"));?>
		</div>
	</div>
	<?php echo $cakeDebug; ?>
</body>
</html>