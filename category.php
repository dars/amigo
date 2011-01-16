<?php
	require_once("main.php");
	$query1="SELECT * FROM categories WHERE id='".$_GET['id']."'";
	$res1=$db->query($query1);
	$data1=$res1->fetch();
	$_SESSION['page']="category.php";
	$_SESSION['name']=$data1['name'];
	$_SESSION['id']=$_GET['id'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="義大利, 義大利遊學, 義大利留學, 義大利語言學校, IED, Polimoda, 西班牙, 西班牙遊學, 西班牙留學, 西班牙語言學校, 短期遊學, 出國留學, 出國遊學" />
<meta name="description" content="義大利與西班牙設計學校的免費諮詢及代辦申請服務
我們代理義大利、西班牙留學與遊學的學校。關於設計、服裝、管理及語言學校，提供免費的諮詢服務。
有鑒於歐洲國家和台灣的不同的兩種體制，我們根據教育體制和傳統、環境、城市、風格、當地環境的人文影響，尋找出多所當地知名、聲譽以及具有教學特色的設計學校。
請仔細參考與認識我們所挑選出來的學校，也讓我們聆聽您的學習需求，以做好申請前的各項設計競" />
<meta name="robots" content="index,follow" />
<title>名格義大利/西班牙留學遊學諮詢中心</title>
<link href="css/mainpage.css" rel="stylesheet" type="text/css" />
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script type="text/javascript" src="Scripts/direction.js"></script>
<script type="text/javascript" src="Scripts/flashobject.js"></script>
</head>
<body>
<div id="WAPPER">
	<a name="top" id="top"></a>
	<h2 class="MainLogo"><a href="index.php">名格留學遊學諮詢中心</a></h2>
	<?php require_once("menubar.php");?>
	<div class="HeadBox">
		<div class="HeadImage"> <img class="HeadPhoto" src="images/<?php echo $data1['pix']?>"/>
			<div class="HeadInfo">
				<ul>
					<li class="ChineseTopicDesign"><?php echo $data1['name']?></li>
					<li class="TopicDesign"><?php echo $data1['name_eng']?></li>
					<li class="TopicCountry">義大利的&nbsp;<?php echo $data1['name']?>學校</li>
					<?php
						$query3="SELECT a.id,a.name,a.name_eng,b.summary,b.pix,b.weight FROM schools AS a LEFT JOIN departments AS b ON a.id=b.school_id WHERE (a.type_id=1 or a.type_id=3) and b.category_id=".$data1['id']." ORDER BY b.weight DESC";
						$res3=$db->query($query3);
						while($data3=$res3->fetch()){
							echo "<li class=\"TopicSchool\"><a href=\"#school".$data3['id']."\">".$data3['name']."&nbsp;".$data3['name_eng']."</a></li>";
						}
					?>
					<li class="TopicCountry">西班牙的&nbsp;<?php echo $data1['name']?>學校</li>
					<?php
						$query4="SELECT a.id,a.name,a.name_eng,b.summary,b.pix,b.weight FROM schools AS a LEFT JOIN departments AS b ON a.id=b.school_id WHERE (a.type_id=2 or a.type_id=4) and b.category_id=".$data1['id']." ORDER BY b.weight DESC";
						$res4=$db->query($query4);
						while($data4=$res4->fetch()){
							echo "<li class=\"TopicSchool\"><a href=\"#school".$data4['id']."\">".$data4['name']."&nbsp;".$data4['name_eng']."</a></li>";
						}
					?>
				</ul>
			</div>
		</div>
		<div class="ClassList">
			<ul>
				<li><a class="BtnDesign" href="category.php?id=8">Design</a></li>
				<li><a class="BtnArt" href="category.php?id=9">Multimedia&nbsp;&amp;<br />
					Art</a></li>
				<li><a class="BtnFashion" href="category.php?id=10">Fashion&nbsp;&amp;<br />
					Accessories</a></li>
				<li><a class="BtnStyling" href="category.php?id=11">Styling&nbsp;&amp;<br />
					Makeup</a></li>
				<li><a class="BtnManagement" href="category.php?id=12">Fashion<br />
					Management</a></li>
				<li><a class="BtnHospitality" href="category.php?id=13">Hospitality</a></li>
				<li><a class="BtnLanguage" href="category.php?id=14">Language<br />
					School</a></li>
			</ul>
		</div>
		<br class="clearfloat" />
	</div>
	<p class="pathDir"><a href="index.php">首頁</a>&nbsp;&gt;&nbsp;<?php echo $data1['name']?></p>
	<h2 class="ClassCountry">義大利的<?php echo $data1['name']?>學校</h2>
	<div class="BoxBig">
		<?php 
			$res3->data_seek();
			while($data3=$res3->fetch()){
				echo "<div class=\"BoxSchool\">";
				echo "<h2 class=\"SchoolNameIT\"><a href=\"school.php?school_id=".$data3['id']."\">".$data3['name']."&nbsp;".$data3['name_eng']."</a><span class=\"CountryMark\"><a name=\"school".$data3['id']."\" id=\"school".$data3['id']."\"></a></span></h2>";
				echo "<div class=\"Box03\">";
				echo "<h3 class=\"titleRed\">".$data1['name']."</h3>";
				echo "<img src=\"admin/app/webroot/files/".$data3['pix']."\" width=\"375\" height=\"200\" /> </div>";
				echo "<div class=\"SchoolClassIntro\">".mb_substr(strip_tags($data3['summary']),0,100,'utf8')."</div>";
				echo "<ul>";
				echo "<li class=\"MoreSchoolInfo\"><a href=\"school.php?school_id=".$data3['id']."\">更多相關介紹</a></li>";
				$query5="SELECT * FROM courses WHERE school_id=".$data3['id']." and category_id=".$data1['id']." ORDER BY id";
				$res5=$db->query($query5);
				$cot=0;
				while($data5=$res5->fetch()){
					if($cot%2==0){
						$cls="MoreClass";
					}else{
						$cls="MoreClass2";
					}
					echo "<li class=\"".$cls."\">".$data5['name']."</li>";
				}
				echo "</ul><div class=\"lineTop4\"><a name=\"fuaIT\" id=\"fuaIT\"></a><a class=\"top\" href=\"#top\">^top</a></div></div>";
			}
		?>
	</div>
	<h2 class="ClassCountry">西班牙的<?php echo $data1['name']?>學校</h2>
	<div class="BoxBig">
		<?php 
			$res4->data_seek();
			while($data4=$res4->fetch()){
				echo "<div class=\"BoxSchool\">";
				echo "<h2 class=\"SchoolNameIT\"><a href=\"school.php?school_id=".$data4['id']."\">".$data4['name']."&nbsp;".$data4['name_eng']."</a><span class=\"CountryMark\"><a name=\"school".$data4['id']."\" id=\"school".$data4['id']."\"></a></span></h2>";
				echo "<div class=\"Box03\">";
				echo "<h3 class=\"titleRed\">".$data1['name']."</h3>";
				echo "<img src=\"admin/app/webroot/files/".$data4['pix']."\" width=\"375\" height=\"200\" /> </div>";
				echo "<div class=\"SchoolClassIntro\">".mb_substr(strip_tags($data4['summary']),0,100,'utf8')."</div>";
				echo "<ul>";
				echo "<li class=\"MoreSchoolInfo\"><a href=\"school.php?school_id=".$data4['id']."\">更多相關介紹</a></li>";
				$query5="SELECT * FROM departments WHERE school_id=".$data4['id']." and category_id=".$data1['id']." ORDER BY id";
				$res5=$db->query($query5);
				$cot=0;
				while($data5=$res5->fetch()){
					if($cot%2==0){
						$cls="MoreClass";
					}else{
						$cls="MoreClass2";
					}
					echo "<li class=\"".$cls."\">".$data5['name']."</li>";
				}
				echo "</ul><div class=\"lineTop4\"><a name=\"fuaIT\" id=\"fuaIT\"></a><a class=\"top\" href=\"#top\">^top</a></div></div>";
			}
		?>
	</div>
	<?php require_once("footer.php");?>
</div>
</body>
</html>