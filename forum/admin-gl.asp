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
d1="<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% ><P style='MARGIN: 15px'>"
d2="</p></td></tr></table></center></div>"
menu=request.querystring("menu")%>
<body topmargin="0" leftmargin="0"><style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%" bordercolor=<%=c1%>>
  <tr>
    <td width="100%" height="28" background="pic/8.gif" align="center">
    <b><font color="#FFFFFF">論壇後台管理系統</font></b></td>
  </tr>
  </table><br>
<%select case menu%>
<%case"bzgl"
go=request.querystring("go")
name=Replace(Request.form("name"),"'","''")
bd=Request.Form("bd")
set add=myconn.execute("SELECT*FROM user where name='"&name&"'")
if add.eof and add.bof then%>
<%=t1%>錯 誤 訊 息<%=t2&d1%>·沒有這個用戶·<%=d2%>
<%
else
if go="add" then
pwd=add("password")
myconn.execute("insert into admin(name,password,bd)VALUES('"&name&"','"&pwd&"','"&bd&"')")
%>
<%=t1%>添 加 成 功<%=t2&d1%>·版主新增完成·<%=d2%><%
response.end
end if
if go="del" then
myconn.execute("delete*from admin where name='"&name&"' and bd='"&bd&"'")%>
<%=t1%>刪 除 成 功<%=t2&d1%>·版主刪除完成·<%=d2%><%
response.end
end if
end if
set add=nothing
%>
<%case"addbbs"%>
<%bbsbn=request.querystring("bbsbn")
set bf=myconn.execute("select*from bdinfo where key='0' order by bn")
if bf.eof then
noyes="錯 誤 訊 息 ！"
mes="<br>·沒有分類不能新增論壇！請先<a href=admin-right.asp?action=addfl>>>新增分類</a><br><br>"%>
<!--#include file="mes.asp"-->
<%
response.end
set bf=nothing
end if
%>
<%
bn=request.form("bn")
bdname=Replace(Request.Form("bdname"),"'","''")
bdinfo=Replace(Request.Form("bdinfo"),"'","''")
picurl=request.form("picurl")
key=request.form("key")
bbstype=request.form("bbstype")
if bn="" or bn="0" or bdname="" or bdinfo="" or key="" or key=0 or not isnumeric(bn) then
%>
<form method="POST">
<%response.write""&t1&"論 壇 添 加"&t2&""
%>
<%=d1%><P style='MARGIN: 5px'>論壇序號：<input type="text" name="bn" size="25"><font color=#FF0000>·</font>只能填 <b>0</b> 除外的數字
</p><P style='MARGIN: 5px'>論壇名稱：<input type="text" name="bdname" size="25"><font color="#FF0000">·</font>無限制</p>
<P style='MARGIN: 5px'>標誌圖片：<input type="text" name="picurl" size="49">·將顯示在論壇的右邊，可以不填。</p>
<P style='MARGIN: 5px'>論壇介紹：<br><textarea rows="4" name="bdinfo" cols="58"></textarea><font color="#FF0000">·</font></p>
<P style='MARGIN: 5px'>屬於分類：<select size="1" name="key" style="font-size: 9pt">
<%do while not bf.eof%><%if bf("bn")=bbsbn then%><option value="<%=bf("bn")%>" selected><%=bf("bdname")%></option><%else%>
<option value="<%=bf("bn")%>"><%=bf("bdname")%></option><%end if%>
<%
bf.movenext
Loop
bf.Close
set bf=nothing
%>
</select><font color="#FF0000">·</font>請選擇該論壇屬於哪一種分類</p><br><P style='MARGIN: 4px'>
論壇類型：(請從下面的兩項選擇一個)</p><P style='MARGIN: 4px'><input type="radio" value="nopwd" name="bbstype" checked>普通論壇
（註冊用戶可以自由的進入該類型論壇，·推薦·）<P style='MARGIN: 4px'><input type="radio" value="pwdpass" name="bbstype">認證論壇
（只有版主認證的註冊用戶才能進入該類型論壇）</p><br>
<P style='MARGIN: 4px'><input type="submit" value=" 送 出 " name="B1"> <input type="reset" value=" 重 置 " name="B2"></p><br><%=d2%>
</form>
<%
else
set bbsyn=myconn.execute("select bn from bdinfo where bn='"&bn&"' and key<>'0'")
if not bbsyn.eof then
noyes="錯 誤 訊 息 ！"
mes="<br>·論壇序號 <b>"&bn&"</b> 已經存在！·請選擇別的論壇序號<br><br>"%>
<!--#include file="mes.asp"--><%
response.end
end if
set bbsyn=nothing
if bbstype="nopwd" then
myconn.execute("insert into bdinfo(bn,bdname,bdinfo,picurl,key)values('"&bn&"','"&bdname&"','"&bdinfo&"','"&picurl&"','"&key&"')")
noyes="添 加 成 功 ！"
mes="<br>·新增論壇完成！<br><br>"
elseif bbstype="pwdpass" then
myconn.execute("insert into bdinfo(bn,bdname,bdinfo,picurl,key,pass)values('"&bn&"','"&bdname&"','"&bdinfo&"','"&picurl&"','"&key&"','"&lgname&"')")
noyes="添 加 成 功 ！"
mes="<br>·新增論壇完成,此論壇為認證論壇，暫時只有管理員能夠進入。<br>·你可以通過 <a href=admin-gl.asp?menu=bbsgl>管理</a> 項目來新增可以進入該論壇的用戶<br><br>"
end if
%><!--#include file="mes.asp"-->
<%end if%>
<%case"chadmin"
adminname=Replace(Request.Form("adminname"),"'","''")
set yon=myconn.execute("select*from user where name='"&adminname&"'")
if yon.eof then
%><%=t1%>錯 誤 訊 息<%=t2&d1%>·該用戶名還沒有<a target="_blank" href="zhuce.asp">註冊</a>·<%=d2%>
<%else
pwd=yon("password")
myconn.execute("update [admin] set name='"&adminname&"',password='"&pwd&"' where bd='70767766'")
%><%=t1%>修 改 成 功<%=t2&d1%>·已經完成的修改了論壇的管理員·<br><br>·請用新管理員 <%=adminname%>
<a href="login.asp">登陸</a>論壇後，再進入後台管理·<%=d2%><%end if%>
<%case"updatebbs"
bn=request.querystring("bn")
bdname=Replace(Request.Form("bdname"),"'","''")
bdinfo=Replace(Request.Form("bdinfo"),"'","''")
picurl=request.form("picurl")
key=request.form("key")
bbstype=request.form("bbstype")
if bdname="" or bdinfo="" then
%><%=t1%>錯 誤 訊 息<%=t2&d1%>·請填寫完整帶有<font color="#FF0000">·</font>的項目·<%=d2%><%else
if bbstype="nopwd" then
myconn.execute("update [bdinfo] set bdname='"&bdname&"',bdinfo='"&bdinfo&"',picurl='"&picurl&"',key='"&key&"',pass='' where bn='"&bn&"' and key<>'0'")
elseif bbstype="pwdpass" then
set dfdf=myconn.execute("select pass from bdinfo where bn='"&bn&"' and key<>'0'")
if dfdf("pass")<>"" then
myconn.execute("update [bdinfo] set bdname='"&bdname&"',bdinfo='"&bdinfo&"',picurl='"&picurl&"',key='"&key&"' where bn='"&bn&"' and key<>'0'")
else
myconn.execute("update [bdinfo] set bdname='"&bdname&"',bdinfo='"&bdinfo&"',picurl='"&picurl&"',key='"&key&"',pass='"&lgname&"' where bn='"&bn&"' and key<>'0'")
end if
end if
%><%=t1%>修 改 成 功<%=t2&d1%>·已經完成的修改了該版面的信息·<%=d2%>
<%end if%>
<%case"addpassuser"
user=Replace(Request.Form("user"),"'","''")
bn=request.querystring("bn")
myconn.execute("update bdinfo set pass='"&user&"' where bn='"&bn&"' and key<>'0'")
%><%=t1%>添 加 成 功<%=t2&d1%>·已經完成的新增了認證用戶·<%=d2%>

<%case"deluser"%>
<%
delname=Replace(Request.form("delname"),"'","''")
set add=myconn.execute("SELECT name FROM user where name='"&delname&"'")
set isadmin=myconn.execute("select name from admin where name='"&delname&"'")
if add.eof or not isadmin.eof then
%>
<%=t1%>錯 誤 訊 息<%=t2&d1%>不能刪除，可能存在以下問題：<br><br>·沒有這個用戶·<br>·該用戶是管理員(管理員不能刪除，如果確實要把該用戶刪除，請先更改管理員，再把該用戶刪除)·<%=d2%>
<%
else
myconn.execute("delete*from user where name='"&delname&"'")
myconn.execute("delete*from min where name='"&delname&"'")
myconn.execute("delete*from admin where name='"&delname&"'")
myconn.execute("delete*from hand where tname='"&delname&"'")
%>
<%=t1%>刪 除 成 功<%=t2&d1%>·已經完成的刪除了用戶以及這個用戶的帖子和郵件·<%=d2%><%end if
set isadmin=nothing
set add=nothing%>
<%case"bbsgl"%><br>
<%response.write""&t1&"論 壇 管 理"&t2&""%>
<%=d1%>
<%
set bf=myconn.execute("select*from bdinfo where key='0' order by bn")
do while not bf.eof
%>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="29%" height="25"><font color=<%=c1%>><b><%=bf("bdname")%></font></b><%bbnn=bf("bn")%>　</td>
    <td width="59%"><a href="admin-gl.asp?menu=bdcon&dw=delfl&bn=<%=bbnn%>">刪除此分類</a> |
    <a href="admin-gl.asp?menu=addbbs&bbsbn=<%=bbnn%>">增加論壇</a> |</td>
    <td width="12%">分類序號：<b><font color=<%=c1%>><%=bbnn%></font></b></td>
  </tr>
  <%
set asd=myconn.execute("select*from bdinfo where key<>'0' and key='"&bbnn&"'order by bn")
do while not asd.eof
%><tr>
    <td width="29%" height="24">
·<%=asd("bdname")%></td>
    <td width="59%"><a href=admin-right.asp?action=chbbsinfo&bn=<%=asd("bn")%>>修改</a> | <a href="admin-gl.asp?menu=bdcon&dw=delbbs&bn=<%=asd("bn")%>">刪除</a> | 
    <a href="admin-right.asp?action=delall&bn=<%=asd("bn")%>">清空帖子</a><%if asd("pass")<>"" then%> | 
    <a href="admin-right.asp?action=addpassuser&bn=<%=asd("bn")%>">新增認證用戶</a><%end if%></td>
    <td width="12%">論壇序號：<b><%=asd("bn")%></b></td>
  </tr><%
asd.movenext
Loop
asd.Close
set asd=nothing
%>
</table>
<br><%
bf.movenext
Loop
bf.Close
set bf=nothing
%><br><br><%=d2%>
<%=d1%>說明：<br>一個分類可以包括一個或多個論壇，<br>分類與分類之間的序號不能相同，論壇與論壇之間的序號不能相同。<br>當你刪除分類時，分類中的論壇也會被刪除！<br>
各分類以及各論壇將按照序號顯示出來，所以要放置在前面的分類或論壇的序號應該前一點<br><br><%=d2%>
<%case"bdcon"
dw=request.querystring("dw")
bn=request.querystring("bn")
if dw="delfl" then
myconn.execute("delete*from bdinfo where bn='"&bn&"' and key='0'")
myconn.execute("delete*from bdinfo where key='"&bn&"'")
%><%=t1%>刪 除 成 功<%=t2&d1%>·刪除論壇分類完成·<%=d2%>
<%response.end
end if
if dw="delbbs" then
myconn.execute("delete*from bdinfo where bn='"&bn&"' and key<>'0'")
%><%=t1%>刪 除 成 功<%=t2&d1%>·刪除論壇完成·<%=d2%>
<%end if%>
<%case"addlm"%>
<%
name=Replace(Request.Form("name"),"'","''")
url=Replace(Request.Form("url"),"'","''")
picurl=Replace(Request.Form("picurl"),"'","''")
if name="" or url="" or picurl="" then
%>
<%=t1%>錯 誤 訊 息<%=t2&d1%>·信息沒有填寫完整·<%=d2%>
<%else%>
<%myconn.execute("insert into lmbbs(url,picurl,name)values('"&url&"','"&picurl&"','"&name&"')")%>
<%=t1%>添 加 成 功<%=t2&d1%>·新增論壇聯盟完成·<%=d2%><%end if%>
<%case"dellm"
name=Replace(Request.Form("name"),"'","''")
if name="" then
%><%=t1%>錯 誤 訊 息<%=t2&d1%>·請填寫完整要刪除的聯盟名稱·<%=d2%><%else
myconn.execute("delete*from lmbbs where name='"&name&"'")%>
<%=t1%>刪 除 成 功<%=t2&d1%>·刪除聯盟完成·<%=d2%><%end if%><%case"updateuser"%>
<%
chname=Replace(Request.form("chname"),"'","''")
chqian=Replace(Request.form("chqian"),"'","''")
chmeili=Replace(Request.form("chmeili"),"'","''")
chjingyan=Replace(Request.form("chjingyan"),"'","''")
set add=myconn.execute("SELECT name FROM user where name='"&chname&"'")
if add.eof and add.bof then%>
<%=t1%>錯 誤 訊 息<%=t2&d1%>·沒有這個用戶名·<%=d2%>
<%else%>
<%
if not isnumeric(chqian) or not isnumeric(chmeili) or not isnumeric(chjingyan) then%>
<%=t1%>錯 誤 訊 息<%=t2&d1%>·金錢、魅力、經驗必須為大於0的數字·<%=d2%>
<%else
myconn.execute("update [user] set qian='"&chqian&"',meili='"&chmeili&"',jingyan='"&chjingyan&"' where name='"&chname&"'")
%>
<%=t1%>修 改 成 功<%=t2&d1%>·已經完成的修改了用戶的信息·<%=d2%><%end if
end if
set add=nothing
%><%case"seepwd"%>
<%
chaname=Replace(Request.form("chaname"),"'","''")
set add=myconn.execute("SELECT*FROM user where name='"&chaname&"'")
if add.eof and add.bof then%>
<%=t1%>錯 誤 訊 息<%=t2&d1%>·沒有這個用戶名·<%=d2%>
<%else%>
<%=t1%>查 看 成 功<%=t2&d1%><b><%=add("name")%>  的密碼為：</b><%=add("password")%><%=d2%><%end if
set add=nothing%>
<%case"delanymail"
daynum=request.form("daynum")
if not isnumeric(daynum) then
%><%=t1%>錯 誤 訊 息<%=t2&d1%>·天數必須填寫並且為數字·<%=d2%><%else
myconn.execute("delete*from hand where riqi<now-"&daynum&"")
%><%=t1%>刪 除 成 功<%=t2&d1%>·批量刪除郵件完成·<%=d2%><%end if%>
<%case"delwhosemail"
ddname=Replace(Request.form("ddname"),"'","''")
if ddname="" then
%>
<%=t1%>錯 誤 訊 息<%=t2&d1%>·請輸入用戶名·<%=d2%><%else
myconn.execute("delete*from hand where tname='"&ddname&"'")
%><%=t1%>刪 除 成 功<%=t2&d1%>·批量刪除郵件完成·<%=d2%><%end if%>

<%case"delany"
daynum=request.form("daynum")
bd=request.form("bd")
if not isnumeric(daynum) then
%><%=t1%>錯 誤 訊 息<%=t2&d1%>·天數必須填寫並且為數字·<%=d2%><%else
if bd="all" then
myconn.execute("delete*from min where riqi<now-"&daynum&"")
else
myconn.execute("delete*from min where bd="&bd&" and riqi<now-"&daynum&"")
end if
%>
<%=t1%>刪 除 成 功<%=t2&d1%>·批量刪除帖子完成·<%=d2%><%end if%><%case"delnore"%>
<%daynum=request.form("daynum")
bd=request.form("bd")
if not isnumeric(daynum) then
%><%=t1%>錯 誤 訊 息<%=t2&d1%>·天數必須填寫並且為數字·<%=d2%><%else
if bd="all" then
myconn.execute("delete*from min where orders<now-"&daynum&"")
else
myconn.execute("delete*from min where bd="&bd&" and orders<now-"&daynum&"")
end if
%>
<%=t1%>刪 除 成 功<%=t2&d1%>·批量刪除帖子完成·<%=d2%><%end if%><%case"delwhose"
ddname=Replace(Request.form("ddname"),"'","''")
bd=request.form("bd")
if ddname="" then
%>
<%=t1%>錯 誤 訊 息<%=t2&d1%>·請輸入用戶名·<%=d2%><%else
if bd="all" then
myconn.execute("delete*from min where name='"&ddname&"'")
else
myconn.execute("delete*from min where bd="&bd&" and name='"&ddname&"'")
end if
%><%=t1%>刪 除 成 功<%=t2&d1%>·批量刪除帖子完成·<%=d2%><%end if%><%case"moveday"
daynum=request.form("daynum")
frombd=request.form("frombd")
tobd=request.form("tobd")
if not isnumeric(daynum) then
%><%=t1%>錯 誤 訊 息<%=t2&d1%>·天數必須填寫並且為數字·<%=d2%><%else
myconn.execute("update min set bd="&tobd&" where bd="&frombd&" and riqi<now-"&daynum&"")
%>
<%=t1%>移 動 成 功<%=t2&d1%>·批量移動帖子完成·<%=d2%><%end if%><%case"movename"
movename=Replace(Request.form("movename"),"'","''")
frombd=request.form("frombd")
tobd=request.form("tobd")
if movename="" then%>
<%=t1%>錯 誤 訊 息<%=t2&d1%>·請輸入用戶名·<%=d2%><%else
myconn.execute("update min set bd="&tobd&" where bd="&frombd&" and name='"&movename&"'")
%><%=t1%>移 動 成 功<%=t2&d1%>·批量移動帖子完成·<%=d2%><%end if%><%case"bbs"
tl=Replace(Request.form("tl"),"'","''")
c1=Replace(Request.form("c1"),"'","''")
c2=Replace(Request.form("c2"),"'","''")
if tl="" or c1="" or c2="" then
%><%=t1%>錯 誤 訊 息<%=t2&d1%>·請填寫完整各項目·<%=d2%>
<%else
myconn.execute("update [bbsinfo] set tl='"&tl&"',c1='"&c1&"',c2='"&c2&"'")%>
<%=t1%>修 改 成 功<%=t2&d1%>·論壇名稱以及其他參數修改完成·<%=d2%><%end if%><%end select
end if%>