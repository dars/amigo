<div class="BoxRight">
	<ul class="SubMenu01">
		<li class="BtnTitle"><a href="school.php?school_id=<?php echo $_GET['school_id']?>">學校介紹</a></li>
		<li class="BtnTitle">科系介紹</li>
		<?php
			$query2="SELECT a.category_id,b.name 
					 FROM courses as a 
					 LEFT JOIN categories as b ON a.category_id=b.id 
					 WHERE a.school_id=".$_GET['school_id']."
					 GROUP BY category_id";
			$res2=$db->query($query2);
			while($data2=$res2->fetch()){
				echo "<li><a class=\"BtnMenu\" href=\"courses.php?course_id=".$data2['category_id']."&school_id=".$_GET['school_id']."\">".$data2['name']."</a></li>";
			}
		?>
	</ul>
</div>
<div class="BoxRight">
	<h3 class="BtnTitle">學校活動</h3>
	<?php
		$query3="SELECT * FROM events WHERE school_id=".$_GET['school_id'];
		$res3=$db->query($query3);
		while($data3=$res3->fetch()){
			echo "<h2 class=\"PhotoNewsTitle\">".$data3['title']."</h2>
			      <p>".mb_substr(strip_tags($data3['body']),0,35,'utf8')."...<a href=\"events_view.php?event_id=".$data3['id']."&school_id=".$_GET['school_id']."\">more</a></p>";
		}
	?>
</div>