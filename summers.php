<?php
require_once("main.php");
$query1 = "SELECT b.id,b.name FROM summers as a LEFT JOIN schools as b ON a.school_id = b.id GROUP BY school_id ORDER BY a.id";
$res1 = $db->query($query1);

$query2 = "SELECT a.*,b.name as sname FROM summers as a LEFT JOIN schools as b ON a.school_id=b.id ORDER BY school_id ASC,id DESC";
$res2 = $db->query($query2);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>暑期課程清單</title>
		<style type="text/css">
		body{
			padding:0;
			margin:0;
			font-size: 100%;
		}
		h1{
			font-size: 1.5em;
			margin:0;
			color:#FFF;
			text-align:center;
			background:#9CAD4A;
			padding:10px;
			letter-spacing: 5px;
		}
		.school_list{
			text-align:center;
		}
		.school_list a{
			font-size: 0.9em;
			text-decoration:none;
		}
		.school_list a:hover{
			border-bottom:1px dotted;
		}
		.school_list li{
			display:inline;
			margin-right:15px;
		}
		.summers_content table{
			margin-bottom:20px;
			margin-left:auto;
			margin-right:auto;
			border-collapse: collapse;
			border:1px #CCC solid;
			width:700px;
		}
		.summers_content th,.summers_content td{
			border:1px #CCC solid;
			padding:3px;
		}
		.summers_content th{
			font-weight: normal;
			color:#38632D;
			background:#C5E6EC;
		}
		.summers_content th.sname{
			text-align:center;
			color:#900;
			background:#E1E1E1;
		}
		</style>
	</head>
	<body>
		<h1>暑期課程清單</h1>
		<div>
			<?php if($res1->size()>0){?>
			<ul class="school_list">
				<?php
					while($data1 = $res1->fetch()){
						echo "<li><a href=\"#school_".$data1['id']."\">●".$data1['name']."</a></li>";
					}
				?>
			</ul>
			<?php }?>
		</div>
		<div class="summers_content">
			<?php
				if($res2->size()>0){
					$tmp_name="";
					while($data2=$res2->fetch()){
						if($tmp_name == ""){
							echo "<br/><table><tr><th colspan=5 class=\"sname\" id=\"school_".$data2['school_id']."\">".$data2['sname']."</th></tr>";
							echo "<tr><th>課程名稱</th><th>時間</th><th>地點</th><th>備註</th></tr>";
							echo "<tr>";
							$tmp_name = $data2['sname'];
						}else if($tmp_name != $data2['sname']){
							echo "</table><br/><table><tr><th colspan=5 class=\"sname\" id=\"school_".$data2['school_id']."\">".$data2['sname']."</th></tr>";
							echo "<tr><th>課程名稱</th><th>時間</th><th>地點</th><th>備註</th></tr>";
							echo "<tr>";
							$tmp_name = $data2['sname'];
						}else{
							echo "<tr>";
						}
						echo "<td>".$data2['name']."</td>";
						echo "<td>".$data2['datetime']."</td>";
						echo "<td>".$data2['location']."</td>";
						echo "<td>".nl2br($data2['remark'])."</td>";
						echo "</tr>";
						
					}
					echo "</table>";
				}
			?>
		</div>
	</body>
</html>
