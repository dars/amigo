<!--#include file="conn.asp"-->
<link rel="stylesheet" type="text/css" href="css.css">
<%set bbs=myconn.execute("select*from bbsinfo")
c1=bbs(1)
c2=bbs(2)
set bbs=nothing
lgname=Request.Cookies("lgname")
lgpwd=request.cookies("lgpwd")
set cjbz=myconn.execute("select name from admin where name='"&lgname&"' and password='"&lgpwd&"' and bd='70767766'")
if cjbz.eof then
noyes="登 陸 失 敗 ！"
mes="你不能進入後台管理。<br>·你現在登陸論壇的用戶名 "&lgname&" 不是管理員。·"%>
<!--#include file="mes.asp"-->
<%response.end
else
t1="<div align=center><center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><td width=50% background=pic/5.gif><img border=0 src=pic/9.gif align=absbottom><font color=#FFFFFF><b>"
t2="</b></font></td><td width=50% background=pic/7.gif><img border=0 src=pic/6.gif></td></tr></table></center></div>"
d1="<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% >"
d2="</td></tr></table></center></div>"
function bdlist(sename,n)
response.write"<select size=1 name="&sename&" style='font-size: 9pt; '>"
if n=1 then
response.write"<option value=all selected>所有論壇</option>"
end if
set bf=myconn.execute("select*from bdinfo where key<>'0'")
do while not bf.eof
response.write"<option value="&bf("bn")&">"&bf("bdname")&"</option>"
bf.movenext
loop
bf.close
set bf=nothing
response.write"</select>"
end function

%>
<body topmargin="0" leftmargin="0"><style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%" bordercolor=<%=c1%>>
  <tr>
    <td width="100%" height="28" background="pic/8.gif" align="center">
    <b><font color="#FFFFFF">論壇後台管理系統</font></b></td>
  </tr>
  </table><br>
<%action=request.querystring("action")
select case action%>
<%case"addfl"
noyes="添 加 分 類"
mes="<P style='MARGIN: 5px'>分類序號：<input type=text name=bn size=20><font color=#FF0000>·</font>只能填 <b>0</b> 除外的數字</p><P style='MARGIN: 5px'>分類名稱：<input type=text name=bdname size=20><font color=#FF0000>·</font>分類的名稱，無限制</p><P style='MARGIN: 5px'><input type=submit value=' 送 出 ' name=B1> <input type=reset value=' 重 置 ' name=B2></p>"
%>
<%
bn=request.form("bn")
bdname=Replace(Request.Form("bdname"),"'","''")
if bn="" or bn="0" or bdname="" or not isnumeric(bn) then
%>
<%else
set flyn=myconn.execute("select bn,bdname from bdinfo where bn='"&bn&"' and key='0'")
if not flyn.eof then
mes="<br>·分類序號 <b>"&bn&"</b> 已經存在！·請選擇別的分類序號<br><br>"
else
myconn.execute("insert into bdinfo(bn,bdname,key)values('"&bn&"','"&bdname&"','0')")
mes="<br>·新增論壇分類完成！<br><br>"
end if
set flyn=nothing
end if
%><form method=POST>
<!--#include file="mes.asp"--></form>
<%case"bzgl"
bz=request.querystring("bz")
if bz="add" then
bt="新增新版主"
go="add"
put="&nbsp;添&nbsp;加&nbsp;"
elseif bz="del" then
bt="刪除版主"
go="del"
put="&nbsp;刪&nbsp;除&nbsp; "
end if
%>
<form action="admin-gl.asp?menu=bzgl&go=<%=go%>" method="POST">
<%=t1&bt&t2&d1%>
<P style='MARGIN: 5px'>版主名稱：<input type="text" name="name" size="20"></p><P style='MARGIN: 5px'>管理論壇：<%=bdlist("bd",0)%>
</p><P style='MARGIN: 5px'><input type="submit" value=<%=put%> name="B1">&nbsp;
<input type="reset" value=" 重 置 " name="B2"></p>

<%=d2%>
</form>
<%case"chadmin"%>
<form action="admin-gl.asp?menu=chadmin" method="POST">
<%=t1%>更改管理員<%=t2&d1%><P style="MARGIN: 5px">管理員名稱：( 該名稱必須已經在論壇中註冊 ) <input type="text" name="adminname" size="20"> 
<input type="submit" value=" 送 出 " name="B1">
<input type="reset" value=" 重 置 " name="B2"></p><%=d2%>
</form>
<%case"deluser"%>
<form action="admin-gl.asp?menu=deluser" method="POST">
<%=t1%>刪除用戶<%=t2&d1%><P style="MARGIN: 5px">用戶名：<input type="text" name="delname" size="20"> 
<input type="submit" value=" 刪 除 " name="B1">
<input type="reset" value=" 重 置 " name="B2"></p><%=d2%>
</form>
<%case"lookuser"%><br>
<%=t1%>查 看 注 冊 用 戶<%=t2%>
<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-left-width:1px; border-right-width:1px; border-top-width:1px" bordercolor="<%=c1%>" width="94%">
    <tr>
<%
i=1
set rs=myconn.execute("select name from user")
do while not rs.eof
%>
<td width="12.5%" height="26">&nbsp;<a target="_blank" href="userinfo.asp?name=<%=rs("name")%>"><%=rs("name")%></a></td>
<%
i=i+1
if i=9 then
response.write"</tr>"
i=1
end if
rs.movenext
Loop
rs.Close
set rs=nothing%></tr>
  </table>
  </center>
</div>
<%case"addpassuser"
bn=request.querystring("bn")
set showps=myconn.execute("select pass from bdinfo where bn='"&bn&"' and key<>'0'")
%>
<form method="POST" action="admin-gl.asp?menu=addpassuser&bn=<%=bn%>">
<%=t1%>修改論壇認證用戶<%=t2&d1%>
<P style="MARGIN: 5px">下面是已經通過認證的用戶，要新增請繼續填寫，各用戶之間用「,」隔開。</p><P style="MARGIN: 5px"><b>
<font color="#FF0000">注意：</font></b>填寫過程中一定不能使用回車</p><P style="MARGIN: 5px">
<textarea name="user" cols=90 rows="15"><%=showps("pass")%></textarea></p><P style="MARGIN: 5px"><input type="submit" value=" 送 出 " name="b1"> <input type="reset" value=" 重 置 " name="b2">
</p><%set showps=nothing%>
</form>
<%case"bbs"
set bbs=myconn.execute("select*from bbsinfo")
%>
<form method="POST" action="admin-gl.asp?menu=bbs">
<%=t1%>修改論壇名稱及其他<%=t2&d1%>
<P style="MARGIN: 5px">論壇名稱:<input type="text" name="tl" size="37" value="<%=bbs("tl")%>"><font color="#FF0000">·</font>(你的論壇的名稱)</p>
<P style="MARGIN: 5px">邊框顏色:<input type="text" name="c1" size="20" value="<%=bbs("c1")%>"><font color="#FF0000">·</font>(表格邊框的顏色)</p>
<P style="MARGIN: 5px">論壇底色:<input type="text" name="c2" size="20" value="<%=bbs("c2")%>"><font color="#FF0000">·</font>(一些表格的底色)</p>
<P style="MARGIN: 5px"><input type="submit" value=" 送 出 " name="B1"> <input type="reset" value=" 重 置 " name="B2"></p>
<%=d2%>
</form>
<%set bbs=nothing%>
<%case"chbbsinfo"
bn=request.querystring("bn")
set bbsinfo=myconn.execute("select*from bdinfo where bn='"&bn&"' and key<>'0'")
%><form action="admin-gl.asp?menu=updatebbs&bn=<%=bn%>" method="POST">
<%=t1%>修改論壇信息<%=t2&d1%>
<P style='MARGIN: 5px'>論壇序號：<b><%=bn%></b><P style='MARGIN: 5px'>論壇名稱：<input type="text" name="bdname" size="25" value="<%=bbsinfo("bdname")%>"><font color="#FF0000">·</font>無限制</p>
<P style='MARGIN: 5px'>標誌圖片：<input type="text" name="picurl" size="49" value="<%=bbsinfo("picurl")%>">·將顯示在論壇的右邊，可以不填。</p>
<P style='MARGIN: 5px'>論壇介紹：<br><textarea rows="4" name="bdinfo" cols="58"><%=bbsinfo("bdinfo")%><%shuyu=bbsinfo("key")
paa=bbsinfo("pass")
set bbsinfo=nothing%></textarea><font color="#FF0000">·</font></p>
<P style='MARGIN: 5px'>屬於分類：<select size="1" name="key" style="font-size: 9pt">
<%set bf=myconn.execute("select*from bdinfo where key='0' order by bn")
do while not bf.eof%><%if shuyu=bf("bn") then%><option value="<%=bf("bn")%>" selected><%=bf("bdname")%></option><%else%>
<option value="<%=bf("bn")%>"><%=bf("bdname")%></option><%end if%>
<%
bf.movenext
Loop
bf.Close
set bf=nothing
%>
</select><font color="#FF0000">·</font>請選擇該論壇屬於哪一種分類</p><br><P style='MARGIN: 4px'>
論壇類型：(請從下面的兩項選擇一個)<font color="#FF0000">·</font></p><P style='MARGIN: 4px'><input type="radio" value="nopwd" name="bbstype" <%if isnull(paa) or paa="" then%>checked<%end if%>>普通論壇
（註冊用戶可以自由的進入該類型論壇，·推薦·）<P style='MARGIN: 4px'><input type="radio" value="pwdpass" name="bbstype" <%if paa<>"" then%>checked<%end if%>>認證論壇
（只有版主認證的註冊用戶才能進入該類型論壇）</p><br>
<P style='MARGIN: 4px'><input type="submit" value=" 送 出 " name="B1"> <input type="reset" value=" 重 置 " name="B2"></p><br><%=d2%>
</form>
<%case"delall"
bn=request.querystring("bn")
myconn.execute("delete*from min where bd="&bn&"")
%><%=t1%>刪 除 成 功<%=t2&d1%><P style="MARGIN: 5px"><br>·已經完成的刪除了該版面的所有帖子·</p><br><%=d2%>

<%case"updateuser"%>
<form action="admin-gl.asp?menu=updateuser" method="POST">
<%=t1%>更改用戶資料<%=t2&d1%>
<P style="MARGIN: 5px">用戶名：<input type="text" name="chname" size="19"></p>
<P style="MARGIN: 5px">金&nbsp; 錢：<input type="text" name="chqian" size="10"> 
  魅&nbsp; 力：<input type="text" name="chmeili" size="10">
  經&nbsp; 驗：<input type="text" name="chjingyan" size="10"></p><P style="MARGIN: 5px"><input type="submit" value=" 送 出 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form>
<%case"seepwd"%>
<form action="admin-gl.asp?menu=seepwd" method="POST">
<%=t1%>查看用戶密碼<%=t2&d1%><P style="MARGIN: 5px">用戶名：<input type="text" name="chaname" size="20"> 
<input type="submit" value=" 送 出 " name="B1">
        <input type="reset" value=" 重 置 " name="B2"></p><%=d2%> 
</form>
<%case"delany"%>
<center><font color="#FF0000">注意：使用此功能將刪除指定的帖子以及公告，刪除後不能恢復！請慎重使用！！</font></center>
<form action="admin-gl.asp?menu=delany" method="POST">
<%=t1%>刪除指定日期內的帖子<%=t2&d1%>
<P style="MARGIN: 5px">刪除多少天前的帖子：( 填數字 ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px">刪除帖子所在的論壇：( 請選擇 ) <%=bdlist("bd",1)%></p><P style="MARGIN: 5px"><input type="submit" value=" 送 出 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form>
<form action="admin-gl.asp?menu=delnore" method="POST">
<%=t1%>刪除指定日期內沒有回覆的主題<%=t2&d1%>
<P style="MARGIN: 5px">刪除多少天前的帖子：( 填數字 ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px">刪除帖子所在的論壇：( 請選擇 ) <%=bdlist("bd",1)%></p><P style="MARGIN: 5px"><input type="submit" value=" 送 出 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form><form action="admin-gl.asp?menu=delwhose" method="POST">
<%=t1%>刪除指定用戶的所有帖子<%=t2&d1%>
<P style="MARGIN: 5px">刪除指定用戶的帖子：( 用戶名 ) 
<input type="text" name="ddname" size="19"></p>
<P style="MARGIN: 5px">刪除帖子所在的論壇：( 請選擇 ) <%=bdlist("bd",1)%></p><P style="MARGIN: 5px"><input type="submit" value=" 送 出 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form>
<%case"bbsmail"%>
<center><font color="#FF0000">注意：使用此功能將刪除指定的郵件，刪除後不能恢復！請慎重使用！！</font></center>
<form action="admin-gl.asp?menu=delanymail" method="POST">
<%=t1%>刪除指定日期內的郵件<%=t2&d1%>
<P style="MARGIN: 5px">刪除多少天前的郵件：( 填數字 ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px"><input type="submit" value=" 送 出 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form>
<form action="admin-gl.asp?menu=delwhosemail" method="POST">
<%=t1%>刪除指定用戶的所有郵件<%=t2&d1%>
<P style="MARGIN: 5px">刪除指定用戶的郵件：( 用戶名 ) 
<input type="text" name="ddname" size="19"></p>
<P style="MARGIN: 5px"><input type="submit" value=" 送 出 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form>

<%case"seepwd"%>
<form action="admin.gl.asp?menu=lookpwd" method="POST">
<%=t1%>查看用戶密碼<%=t2&d1%><P style="MARGIN: 5px">用戶名：<input type="text" name="chaname" size="20"> 
<input type="submit" value=" 送 出 " name="B1">
        <input type="reset" value=" 重 置 " name="B2"></p><%=d2%> 
</form>
<%case"moveany"%>
<form action="admin-gl.asp?menu=moveday" method="POST">
<%=t1%>按指定天數移動帖子<%=t2&d1%>
<P style="MARGIN: 5px">移動多少天前的帖子：( 填數字 ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px">帖子原來所在的論壇：( 請選擇 ) 
<%=bdlist("frombd",0)%></p>
<P style="MARGIN: 5px">帖子要移動到的論壇：( 請選擇 ) 
<%=bdlist("tobd",0)%></p><P style="MARGIN: 5px"><input type="submit" value=" 送 出 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form>
<form action="admin-gl.asp?menu=movename" method="POST">
<%=t1%>按指定用戶移動帖子<%=t2&d1%>
<P style="MARGIN: 5px">移動指定用戶的帖子：( 用戶名 ) 
<input type="text" name="movename" size="19"></p>
<P style="MARGIN: 5px">帖子原來所在的論壇：( 請選擇 ) 
<%=bdlist("frombd",0)%></p>
<P style="MARGIN: 5px">帖子要移動到的論壇：( 請選擇 ) 
<%=bdlist("tobd",0)%></p><P style="MARGIN: 5px"><input type="submit" value=" 送 出 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form>
<%case"lm"%>
<form action="admin-gl.asp?menu=addlm" method="POST">
<%=t1%>新增論壇聯盟<%=t2&d1%><P style="MARGIN: 5px">論壇名稱：<input type="text" name="name" size="20"></p>
<P style="MARGIN: 5px">論壇地址：<input type="text" name="url" size="38"></p>
<P style="MARGIN: 5px">論壇圖片：<input type="text" name="picurl" size="38"></p> 
<P style="MARGIN: 5px"><input type="submit" value=" 添 加 " name="B1"> <input type="reset" value=" 重 置 " name="B2"></p><%=d2%>
</form>
<form action="admin-gl.asp?menu=dellm" method="POST">
<%=t1%>刪除論壇聯盟<%=t2&d1%><P style="MARGIN: 5px">論壇名稱：<input type="text" name="name" size="20"> 
<input type="submit" value=" 刪 除 " name="B1">
<input type="reset" value=" 重 置 " name="B2"></p><%=d2%>
</form>
<%end select
end if%>