<!--#include file="up.asp"-->
<br>
<%lgname=Request.Cookies("lgname")
lgpwd=Request.Cookies("lgpwd")
bd=request.querystring("bd")
id=request.querystring("id")
set who=myconn.execute("select name from min where id="&id&"")
upwho=who("name")
set who=nothing
action=request.querystring("action")
t1="<div align=center><center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><td width=50% background=pic/5.gif><img border=0 src=pic/9.gif align=absbottom><font color=#FFFFFF><b>"
t2="</b></font></td><td width=50% background=pic/7.gif><img border=0 src=pic/6.gif></td></tr></table></center></div>"
d1="<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% >"
d2="</td></tr></table></center></div>"
function bdlist(sename)
response.write"<select size=1 style='font-size: 9pt' name="&sename&" >"
set bf=myconn.execute("select*from bdinfo where key<>'0'")
do while not bf.eof
response.write"<option value="&bf("bn")&">"&bf("bdname")&"</option>"
bf.movenext
loop
bf.close
set bf=nothing
response.write"</select>"
end function
set del1=myconn.execute("select*from admin where name='"&lgname&"' and password='"&lgpwd&"' and bd='70767766'")%><%if not del1.eof or not del1.bof then
%>
<%if action="move" then%>
<form method="POST" action="?action=moveok&id=<%=id%>&bd=<%=bd%>"><%=t1%>移動帖子<%=t2&d1%>
<p style='margin: 15'>請選擇帖子要移動到的論壇：<%bdlist("tobd")%>   <input type="submit" value=" 移 動 " name="B1"> <input type="reset" value=" 重 置 " name="B2"></p>
<%=d2%></form>
<%end if%>
<%if action="moveok" then%>
<%tobd=request.form("tobd")
set cob=myconn.execute("select*from min where bid=0 and id="&id&"")
if cob.eof then%>
<%=t1%>操 作 失 敗 ！<%=t2&d1%><p style='margin: 15'>·沒有該帖子！！<%=d2%>
<%else
myconn.execute("update min set bd="&tobd&" where id="&id&" or bid="&id&"")
%>
<%=t1%>操 作 成 功 ！<%=t2&d1%><p style='margin: 15'>·移動帖子---完成！！<%=d2%>
<%end if
set cob=nothing%>
<%end if%>
<%if action="jh" then
myconn.execute("update min set face='jing' where id="&id&"")
myconn.execute("update [user] set qian=qian+800,meili=meili+200,jingyan=jingyan+200 where name='"&upwho&"'")%>
<%=t1%>操 作 成 功 ！<%=t2&d1%><p style='margin: 15'>·設定為精華帖子---完成！！<%=d2%>
<%elseif action="notjh" then
myconn.execute("update min set face='face1' where id="&id&"")
myconn.execute("update [user] set qian=qian-500,meili=meili-100,jingyan=jingyan-100 where name='"&upwho&"'")%>
<%=t1%>操 作 成 功 ！<%=t2&d1%><p style='margin: 15'>·取消帖子精華---完成！！<%=d2%>
<%
elseif action="top" then
myconn.execute("update [min] set face='top',gonggao='3' where id="&id&"")
myconn.execute("update [user] set qian=qian+800,meili=meili+200,jingyan=jingyan+200 where name='"&upwho&"'")%>
<%=t1%>操 作 成 功 ！<%=t2&d1%><p style='margin: 15'>·設定為置頂帖子---完成！！<%=d2%>
<%
elseif action="nottop" then
myconn.execute("update [min] set face='face1',gonggao='0' where id="&id&"")
myconn.execute("update [user] set qian=qian-500,meili=meili-100,jingyan=jingyan-100 where name='"&upwho&"'")%>
<%=t1%>操 作 成 功 ！<%=t2&d1%><p style='margin: 15'>·取消置頂帖子---完成！！<%=d2%>

<%elseif action="del" then
myconn.execute("delete*from min where id="&id&" or bid="&id&"")
myconn.execute("update [user] set qian=qian-250,meili=meili-40,jingyan=jingyan-40 where name='"&upwho&"'")%>
<%=t1%>操 作 成 功 ！<%=t2&d1%><p style='margin: 15'>·刪除帖子---完成！！<%=d2%>
<%end if
set del1=nothing
%><%else%>
<%set del=myconn.execute("select*from admin where name='"&lgname&"' and password='"&lgpwd&"' and bd='"&bd&"'")%>
<%if del.eof or del.bof then%>
<%=t1%>操 作 失 敗 ！<%=t2&d1%><p style='margin: 15'>·你不是該版面的的版主或總版主，不能作業該帖！！<%=d2%>
<meta http-equiv="refresh" content="2;url=javascript:history.go(-1)">
<%else%>
<%if action="move" then%>
<form method="POST" action="?action=moveok&id=<%=id%>&bd=<%=bd%>"><%=t1%>複製帖子<%=t2&d1%>
<p style='margin: 15'>請選擇帖子要移動到的論壇：<%bdlist("tobd")%> <input type="submit" value=" 移 動 " name="B1"> <input type="reset" value=" 重 置 " name="B2"></p>
<%=d2%></form>
<%end if%>
<%if action="moveok" then%>
<%tobd=request.form("tobd")
set cob=myconn.execute("select*from min where bid=0 and id="&id&"")
if cob.eof then%>
<%=t1%>操 作 失 敗 ！<%=t2&d1%><p style='margin: 15'>·沒有該帖子！！<%=d2%>
<%else
myconn.execute("update min set bd="&tobd&" where id="&id&" or bid="&id&"")
%>
<%=t1%>操 作 成 功 ！<%=t2&d1%><p style='margin: 15'>·移動帖子---完成！！<%=d2%>
<%end if
set cob=nothing%>
<%end if%>
<%
if action="jh" then
myconn.execute("update [user] set qian=qian+800,meili=meili+200,jingyan=jingyan+200 where name='"&upwho&"'")
myconn.execute("update min set face='jing' where id="&id&"")%>
<%=t1%>操 作 成 功 ！<%=t2&d1%><p style='margin: 15'>·設定為精華帖子---完成！！<%=d2%>
<%
elseif action="top" then
myconn.execute("update [min] set face='top',gonggao='3' where id="&id&"")
myconn.execute("update [user] set qian=qian+800,meili=meili+200,jingyan=jingyan+200 where name='"&upwho&"'")%>
<%=t1%>操 作 成 功 ！<%=t2&d1%><p style='margin: 15'>·設定為置頂帖子---完成！！<%=d2%>
<%elseif action="notjh" then
myconn.execute("update [user] set qian=qian-500,meili=meili-100,jingyan=jingyan-100 where name='"&upwho&"'")
myconn.execute("update [min] set face='face1' where id="&id&"")
%>
<%=t1%>操 作 成 功 ！<%=t2&d1%><p style='margin: 15'>·取消帖子精華---完成！！<%=d2%>
<%
elseif action="nottop" then
myconn.execute("update [min] set face='face1',gonggao='0' where id="&id&"")
myconn.execute("update [user] set qian=qian-500,meili=meili-100,jingyan=jingyan-100 where name='"&upwho&"'")%>
<%=t1%>操 作 成 功 ！<%=t2&d1%><p style='margin: 15'>·取消置頂帖子---完成！！<%=d2%>
<%elseif action="del" then
myconn.execute("delete*from min where id="&id&" or bid="&id&"")
myconn.execute("update [user] set qian=qian-250,meili=meili-40,jingyan=jingyan-40 where name='"&upwho&"'")
%><%=t1%>操 作 成 功 ！<%=t2&d1%><p style='margin: 15'>·刪除帖子---完成！！<%=d2%>
<%end if%><%end if
set del=nothing%><%end if
set del1=nothing%><br><br><!--#include file="down.asp"-->