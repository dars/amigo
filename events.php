<?php
require_once("main.php");
$query1="SELECT a.*,b.name FROM events AS a LEFT JOIN schools AS b ON a.school_id=b.id ORDER BY id DESC";
$res1=$db->query($query1);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
<script type="text/javascript" src="js/jquery-1.4.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<style type="text/css">
table{
	border-bottom:1px #CCC solid;
	border-top:1px #666 solid;
	margin-left:auto;
	margin-right:auto;
	width:100%;
}
td,th{
	font:12px verdana;
	color:#333;
	padding-left:5px;
	padding-right:5px;
}
th{
	background:#333;
	color:#FFF;
	height:22px;
	text-align:center;
}
td{
	height:20px;
	border-bottom:1px #CCC dotted;
}
td.subject a{
	color:#BD6262;
}
td.subject a:hover{
	color:#F00;
	border-bottom:none;
	text-decoration:none;
}
</style>
</head>
<body>
<div id="WAPPER" style="margin-top:10px;">
<h2><a href="index.php"><img src="images/logo_amigo.gif"></a></h2>
<?php require_once('menu.php');?>
<p class="pathDir"><a href="index.htm">首頁</a>&nbsp;&gt;&nbsp;最新學校活動</p>
    <table id="boards_tb">
    	<tr><th>活動名稱</th><th>學校</th><th>活動時間</th></tr>
    <?php
    	while($data1=$res1->fetch()){
    		echo "<tr>";
    		echo "<td class=\"subject\"><a href=\"events_view.php?id=".$data1['id']."\">".mb_substr($data1['title'],0,30,'utf8')."</a></td>";
    		echo "<td>".$data1['name']."</td>";
    		echo "<td>".substr($data1['created'],0,10)."</td>";
    		echo "</tr>";
    	}
    ?>
    </table>
<div id="SITEINFO">Copyright © 2007-2009 AMIGO Abroad Studying Information Centre all right reserved.</div>
</div>
</body>
</html>
