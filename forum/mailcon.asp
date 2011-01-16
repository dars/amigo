<!--#include file="up.asp"--><%t1="<div align=center><center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><td width=50% background=pic/5.gif><img border=0 src=pic/9.gif align=absbottom><font color=#FFFFFF><b>"
t2="</b></font></td><td width=50% background=pic/7.gif><img border=0 src=pic/6.gif></td></tr></table></center></div>"
d1="<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% >"
d2="</td></tr></table></center></div>"
id=request.querystring("id")
%><style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>
<!--#include file="fun.asp"--><!--#include file="ubbcode.asp"--><br><br>
<%set mail=myconn.execute("select name from user where name='"&lgname&"' and password='"&lgpwd&"'")
if mail.eof then%>
<%=t1%>錯 誤 訊 息<%=t2&d1%><P style='MARGIN: 10px'>進入郵箱失敗！可能存在以下問題：</p><P style='MARGIN: 10px'>·你還沒有<a href="login.asp">登陸</a>·</p><P style='MARGIN: 10px'>·你的用戶名或密碼錯誤·</p>
<%
response.end
end if
menu=request.querystring("menu")
select case menu
case"write"
id=request.querystring("id")
set shma=myconn.execute("select*from hand where id="&id&" and tname='"&lgname&"'")
dw=request.querystring("dw")
if dw="send" then
sjr=""
tl="發 送 郵 件"
end if
if dw="re" then
body=shma("neirong")
sjr=shma("name")
tl="回 復 郵 件"
end if
if dw="toother" then
sjr=""
tl="郵 件 轉 發"
end if
%> <form method="POST" action="?menu=save">
<%=t1&tl&t2&d1%>
<p style="margin: 10">收 件 人：<input type="text" name="tname" size="82" value="<%=sjr%>"></p>
<p style="margin: 10">郵件內容：[ 可以使用UBB代碼以及論壇帖子的所有功能（除了上傳、公告） ]</p>
<p style="margin: 10"><textarea rows="12" name="neirong" cols="92"><%if dw="re" then%>====================在 <%=shma("riqi")%> 您來信說：================================
<%=LeftTrue(body,100)%>
========================================================================================<%end if%>
<%if dw="toother" then%>================================下面為轉發內容======================================
<%=shma("neirong")%>
========================================================================================
<%end if%>
</textarea></p>
<p style="margin: 10"><input type="submit" value=" 發 送 " name="B1"> <input type="reset" value=" 重 置 " name="B2"></p>
<%=d2%>
</form><%set shma=nothing%>
<%case"save"
tname=Replace(Request.Form("tname"),"'","''")
neirong=Replace(Request.Form("neirong"),"'","''")
if tname="" or neirong="" then
%><%=t1%>錯 誤 訊 息<%=t2&d1%><p style="margin: 10">·發送失敗，收件人和內容不能留空·</p><%=d2%>
<%else
set isha=myconn.execute("select name from user where name='"&tname&"'")
if isha.eof then%><%=t1%>錯 誤 訊 息<%=t2&d1%><p style="margin: 10">·發送失敗，論壇中不存在該收件人·</p><%=d2%>
<%else
myconn.execute("insert into hand(name,neirong,riqi,tname)values('"&lgname&"','"&neirong&"',now,'"&tname&"')")%>
<%=t1%>發 送 成 功<%=t2&d1%><p style="margin: 10">·郵件已經完成的發送給 <b><%=kbbs(tname)%></b> ·</p><%=d2%>
<%end if
set isha=nothing
end if%>
<%end select%>  <br><!--#include file="down.asp"-->