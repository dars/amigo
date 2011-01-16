<?php
require_once("main.php");
$query1="SELECT * FROM schools WHERE id=".$_GET['school_id'];
$res1=$db->query($query1);
$data1=$res1->fetch();
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

<link href="css/page.css" rel="stylesheet" type="text/css" />
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script type="text/javascript" src="Scripts/direction.js"></script>
<script type="text/javascript" src="Scripts/flashobject.js"></script>
</head>
<body>
<div id="WAPPER">
	<a name="top" id="top"></a>
	<h2 class="MainLogo"><a href="index.php">名格留學遊學諮詢中心</a></h2>
	<?php require_once("menubar.php");?>
	<div id="BannerIED"> </div>
	<p class="pathDir"><a href="index.php">首頁</a>&nbsp;&gt;&nbsp;<a href="<?php echo $_SESSION['page']?>?id=<?php echo $_SESSION['id']?>"><?php echo $_SESSION['name']?></a>&nbsp;&gt;&nbsp;<?php echo $data1['name']?></p>
	<h1 class="SchoolName"><?php echo $data1['name']?>&nbsp;</h1>
	<div class="BoxMain">
		<div class="BoxContent">
			<?php echo $data1['summart'];?>
		</div>
		<div class="lineTop2"><a class="top" href="#top">^top</a></div>
	</div>
	<?php require_once("right_menu.php");?>
	<?php require_once("footer.php");?>
</div>
</body>
</html>
