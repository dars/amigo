<?php
	require_once("main.php");
	$query1="SELECT * FROM types WHERE id=".$_GET['id'];
	$res1=$db->query($query1);
	$data1=$res1->fetch();
	$_SESSION['page']="type.php";
	$_SESSION['name']=$data1['name'];
	$_SESSION['id']=$_GET['id'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="義大利, 義大利遊學, 義大利留學, 義大利語言學校, IED, Polimoda, 西班牙, 西班牙遊學, 西班牙留學, 西班牙語言學校, 短期遊學, 出國留學, 出國遊學" />
<meta name="description" content="義大利與西班牙設計學校的免費諮詢及代辦申請服務我們代理義大利、西班牙留學與遊學的學校。關於設計、服裝、管理及語言學校，提供免費的諮詢服務。
有鑒於歐洲國家和台灣的不同的兩種體制，我們根據教育體制和傳統、環境、城市、風格、當地環境的人文影響，尋找出多所當地知名、聲譽以及具有教學特色的設計學校。
請仔細參考與認識我們所挑選出來的學校，也讓我們聆聽您的學習需求，以做好申請前的各項設計競" />
<meta name="robots" content="index,follow" />
<title>名格義大利/西班牙留學遊學諮詢中心</title>
<link href="css/inCountry.css" rel="stylesheet" type="text/css" />
<link href="css/mainpage.css" rel="stylesheet" type="text/css" />
<script src="Scripts/inCountry.js" type="text/javascript"></script>
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script type="text/javascript" src="Scripts/direction.js"></script>
<script type="text/javascript" src="Scripts/flashobject.js"></script>
</head>
<body>
<div id="WAPPER">
	<a name="top" id="top"></a>
	<h2 class="MainLogo"><a href="index.html">名格留學遊學諮詢中心</a></h2>
	<?php require_once("menubar.php");?>
	<div class="HeadBox">
		<div class="HeadImage">
			<img class="HeadPhoto" alt="" src="images/banner_italy.jpg" />
			<div class="HeadInfo">
				<ul>
					<li class="ChineseTopicItaly">在<?php echo $data1['name']?></li>
					<li class="TopicItaly"><?php echo $data1['name_eng']?></li>
					<?php
						$query2="SELECT * FROM schools WHERE type_id=".$data1['id'];
						$res2=$db->query($query2);
						while($data2=$res2->fetch()){
							echo "<li class=\"TopicSchool\"><a href=\"#school".$data2['id']."\">".$data2['name']."&nbsp;".$data2['name_eng']."</a></li>";	
						}
					?>
				</ul>
			</div>
		</div>
		<div class="ClassList">
			<ul>
				<li><a class="BtnItaly" href="type.php?id=1">義大利留學</a></li>
				<li><a class="BtnSpanish" href="type.php?id=2">西班牙留學</a></li>
				<li><a class="BtnItaly" href="type.php?id=3">義大利語言學校</a></li>
				<li><a class="BtnSpanish" href="type.php?id=4">西班牙語言學校</a></li>
			</ul>
		</div>
		<br class="clearfloat" />
	</div>
	<p class="pathDir"><a href="index.htm">首頁</a>&nbsp;&gt;&nbsp;<?php echo $data1['name']?></p>
	<?php
		$res2->data_seek();
		$i=1;
		$js_str="";
		while($data2=$res2->fetch()){
			echo "<div class=\"BoxSchool\">";
			echo "<h2><a class=\"SchoolNameIT\" href=\"school.php?school_id=".$data2['id']."\">".$data2['name']."&nbsp;".$data2['name_eng']."</a><a name=\"school".$data2['id']."\" id=\"school".$data2['id']."\"></a></h2>";
			echo "<br class=\"clearfloat\" />";
			echo "<p>".mb_substr(strip_tags($data2['summart']),0,100,'utf8')."<a href=\"school.php?school_id=".$data2['id']."\">...more</a></p>";
			echo "<div id=\"TabbedPanels".$i."\" class=\"TabbedPanels\">";
			echo "<ul class=\"TabbedPanelsTabGroup\">";
			$have=0;
			# 科系類別
			$query3="SELECT DISTINCT id,name,pix2 FROM categories WHERE id IN(SELECT category_id FROM courses WHERE school_id=".$data2['id'].")";
			$res3=$db->query($query3);
			while($data3=$res3->fetch()){
				echo "<li class=\"TabbedPanelsTab\" tabindex=\"0\">".$data3['name']."</li>";
			}
			echo "</ul>";
			echo "<div class=\"TabbedPanelsContentGroup\">";
			$res3->data_seek();
			while($data3=$res3->fetch()){
				if($have == 0){
					# js script,有細項才設定js...
					$js_str.="var TabbedPanels".$i." = new Spry.Widget.TabbedPanels(\"TabbedPanels".$i."\");\n";
					$have =1;
				}
				# 科系項目
				$query4="SELECT * FROM courses WHERE school_id=".$data2['id']." and category_id=".$data3['id']." ORDER BY weight DESC";
				$res4=$db->query($query4);
				echo "<div class=\"TabbedPanelsContent\">";
				echo "<ul class=\"Box04\">";
				while($data4=$res4->fetch()){
					echo "<li>".$data4['name']."</li>";
				}
				echo "<li class=\"CTitle\" style=\"margin-top:15px;\"><a href=\"courses.php?school_id=".$data2['id']."&course_id=".$data3['id']."\"><img src=\"images/".$data3['pix2']."\" border=\"0\" /></a></li>
					  <br class=\"clearfloat\" />
					  </ul>
					  </div>";
			}
			echo "</div></div>";
			echo "<br class=\"clearfloat\" />
			      <div class=\"lineTop4\" style=\"margin-top:10px;\"><a name=\"22\" id=\"22\"></a><a class=\"top\" href=\"#top\">^top</a></div>";
			$i++;
		}
	?>
	<?php require_once("footer.php");?>
</div>
</body>
</html>
<?php
echo "<script type=\"text/javascript\">\n";
echo $js_str;
echo "</script>";
?>