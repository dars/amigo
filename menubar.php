<div id="MENU">
	<ul class="navigation">
		<li>
			<dl>
				<dt><a href="index.htm">回首頁</a></dt>
			</dl>
		</li>
		<li>
			<dl>
				<dt><a href="about.html">關於我們</a></dt>
			</dl>
 		</li>
 		<li>
			<dl>
				<dt><a href="#">科系選項</a></dt>
				<?php
					$query2="SELECT id,name FROM categories ORDER BY id";
					$res2=$db->query($query2);
					while($data2=$res2->fetch()){
						echo "<dd><a href=\"category.php?id=".$data2['id']."\">".$data2['name']."</a></dd>";
					}
				?>
			</dl>
		</li>
 		<li>
			<dl>
				<dt><a href="#">學校選項</a></dt>
				<?php
					$query2="SELECT id,name FROM types ORDER BY id";
					$res2=$db->query($query2);
					while($data2=$res2->fetch()){
						echo "<dd><a href=\"type.php?id=".$data2['id']."\">".$data2['name']."</a></dd>";
					}
				?>
			</dl>
		</li>
 		<li>
			<dl>
				<dt><a href="#">友站連結</a></dt>
			</dl>
		</li>
 		<li>
			<dl>
				<dt><a href="contact.html">連絡我們</a></dt>
			</dl>
		</li>
	</ul>
</div>
<div class="MENUBar">&nbsp;</div>