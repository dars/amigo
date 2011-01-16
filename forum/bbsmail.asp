<!--#include file="up.asp"--><%t1="<div align=center><center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><td width=50% background=pic/5.gif><img border=0 src=pic/9.gif align=absbottom><font color=#FFFFFF><b>"
t2="</b></font></td><td width=50% background=pic/7.gif><img border=0 src=pic/6.gif></td></tr></table></center></div>"
d1="<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% >"
d2="</td></tr></table></center></div>"
%><style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>
<!--#include file="fun.asp"--><!--#include file="ubbcode.asp"--><br><br>
<%set mail=myconn.execute("select name from user where name='"&lgname&"' and password='"&lgpwd&"'")
if mail.eof then%>
<%=t1%>錯 誤 訊 息<%=t2&d1%><P style='MARGIN: 10px'>進入郵箱失敗！可能存在以下問題：</p><P style='MARGIN: 10px'>·你還沒有<a href="login.asp">登陸</a>·</p><P style='MARGIN: 10px'>·你的用戶名或密碼錯誤·</p>
<%
response.end
end if
set mail=nothing%>
<%menu=request.querystring("menu")
select case menu
case""%>
<%=t1%>論 壇 郵 箱<%=t2%>
<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px" bordercolor="<%=c1%>" width="94%">
    <tr>
      <td width="100%" height="28" colspan="5">&nbsp;<img border="0" src="pic/mail.gif"> <a href="bbsmail.asp">收郵件</a>&nbsp;  <img border="0" src="pic/xie.gif">
      <a href="mailcon.asp?menu=write&dw=send&id=0">發郵件</a>&nbsp;
      <img border="0" src="pic/del.gif"> <span lang="zh-cn">
      <a href="bbsmail.asp?menu=delall">清空郵件</a></span>&nbsp;&nbsp;&nbsp;&nbsp; 
      ·你的郵箱共有<%mailno=myconn.execute("select count(name) from hand where tname='"&lgname&"'")(0)%> <b><%=mailno%></b> 封郵件，其中
      <%newno=myconn.execute("select count(name) from hand where tname='"&lgname&"' and isnew='0'")(0)%><b><%=newno%></b> 
      封新郵件·&nbsp; <marquee scrollamount="2" width="25%">請珍惜每一點空間，麻煩你及時刪除無用的郵件。謝謝！</marquee></td>
    </tr>
    <tr>
      <td width="5%" height="28" align="center"><b>狀態</b></td>
      <td width="20%" align="center" bgcolor="<%=c2%>"><b>發件人</b></td>
      <td width="45%" align="center"><b>內容預覽</b></td>
      <td width="18%" align="center" bgcolor="<%=c2%>"><b>日期</b></td>
      <td width="7%" align="center"><b>刪除</b></td>
    </tr>
  </table>
  </center>
</div>
<%
dim rs
dim sql
set rs = server.createobject("adodb.recordset")
sql = "select * from hand where tname='"&lgname&"' order by id desc"
count=myconn.execute("select count(name)from hand where tname='"&lgname&"'")(0)
on error resume next
pagesetup=20
rs.Open sql,myConn,1
If Count/pagesetup > (Count\pagesetup) then
TotalPage=(Count\pagesetup)+1
else TotalPage=(Count\pagesetup)
End If
PageCount= 0
RS.MoveFirst
if Request.QueryString("ToPage")<>"" then PageCount = cint(Request.QueryString("ToPage"))
if PageCount <=0 then PageCount = 1
if PageCount > TotalPage then PageCount = TotalPage
RS.Move (PageCount-1) * pagesetup
i=1
do while not rs.eof
response.write"<div align='center'><center><table border='1' cellpadding='0' cellspacing='0' style='border-collapse: collapse; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px' bordercolor='"&c1&"' width='94%'><tr><td width='5%' align='center' height='25'>"
if rs("isnew")=0 then
response.write"<a title='未讀郵件'><img src='pic/newmail.gif' border='0'></a>"
else
response.write"<a title='已讀郵件'><img src='pic/mail.gif' border='0'></a>"
end if
response.write"</td><td width='20%' bgcolor='"&c2&"'>　<a href='userinfo.asp?name="&kbbs(rs("name"))&"'>"&kbbs(rs("name"))&"</a></td><td width='45%'>"
yl=kbbs(rs("neirong"))
response.write"　<a href='?menu=showmail&id="&rs("id")&"'>"&LeftTrue(yl,40)&"</a></td><td width='18%' bgcolor='"&c2&"'>　"&rs("riqi")&"</td><td width='7%' align='center'><a href='bbsmail.asp?menu=del&id="&rs("id")&"'><img border='0' src='pic/del.gif'></a></td></tr></table></center></div>"
i=i+1
if i>pagesetup then exit do
rs.movenext
loop
rs.Close
%>
  <div align="center">
    <center>
<TABLE borderColor=<%=c1%> cellSpacing=0 cellPadding=0 width="94%" border=1 style="border-collapse: collapse; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px">
<TBODY>
<TR height=25>
<TD height=2>
<TABLE cellSpacing=0 cellPadding=3 width="100%" border=0 background="pic/8.gif" style="border-collapse: collapse; border-left-width:0; border-top-width:0; border-bottom-width:0">
<TBODY>
<TR>
<TD><b><font color="#FFFFFF"><img border="0" src="pic/fl.gif"> 共有</font><font color="#00FFFF"> <%=TotalPage%> </font><font color="#FFFFFF">頁,<font color="#00FFFF"> <%=count%> </font>
封郵件，每頁有<font color="#00FFFF"> <%=pagesetup%> </font> 封郵件 >> [
<%
ii=PageCount-5
iii=PageCount+5
if ii < 1 then
ii=1
end if
if iii > TotalPage then
iii=TotalPage
end if
if PageCount > 6 then
Response.Write "<a href=?topage=1><font color=yellow>1</font></a> ... "
end if

for i=ii to iii
If i<>PageCount then
Response.Write "<a href=?topage="& i &"><font color=yellow>" & i & "</font></a> "
else
Response.Write " <font color=red><b>"&i&"</b></font> "
end if
next

if TotalPage > PageCount+5 then
Response.Write " ... <a href=?topage="&TotalPage&"><font color=yellow>"&TotalPage&"</font></a>"
end if
%> ]</font></b></TD>
<form name=form method="POST" action=javascript:Check()>
<TD height=2 align="right"><font color="#FFFFFF">頁碼：<input style=FONT-SIZE:9pt maxLength="6" size="6" name="topage" value="<%=PageCount%>">
<input style=FONT-SIZE:9pt value="GO!" type="submit"></font></TD></form>
</TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
</center>
  </div>
  <%case"showmail"
  id=request.querystring("id")
  myconn.execute("update hand set isnew='1' where id="&id&" and tname='"&lgname&"'")
set shma=myconn.execute("select*from hand where id="&id&" and tname='"&lgname&"'")%>
<%=t1%>查 看 郵 件<%=t2%><div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px" bordercolor="<%=c1%>" width="94%">
 <tr>
<td width="100%">
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="TABLE-LAYOUT: fixed; WORD-BREAK: break-all; border-collapse:collapse" bordercolor="#111111" width="94%" height="27">
    <tr>
      <td width="100%" valign="bottom" height="28">
      <img border="0" src="pic/mail.gif"> <a href="bbsmail.asp">收郵件</a>&nbsp;&nbsp;  <img border="0" src="pic/xie.gif">
      <a href="mailcon.asp?menu=write&dw=send&id=<%=id%>">發郵件</a>&nbsp;&nbsp; 
      <img border="0" src="pic/re.gif">
      <a href="mailcon.asp?menu=write&dw=re&id=<%=id%>">回 復</a>&nbsp;&nbsp; 
      <img border="0" src="pic/info.gif">
      <a href="mailcon.asp?menu=write&dw=toother&id=<%=id%>">轉 發</a>&nbsp;&nbsp; <img border="0" src="pic/del.gif">
      <a href="bbsmail.asp?menu=del&id=<%=id%>">刪 除</a></td>
    </tr>
  </table>
  </center>
</div>
<hr color="<%=c1%>" width="94%" size="1">
<blockquote><p style="line-height:15pt">
<b><%=kbbs(shma("name"))%></b> 在來信中說：<br><br><%nr=shma("neirong")%><%=ubb(nr)%><p></p><div align=right>—————————————————<br>來信日期： <%=shma("riqi")%></div></blockquote>
</td>
 </tr>
 <tr>
<td width="100%" background="pic/5.gif" height="22">
　</td>
 </tr>
 </table>
  </center>
</div><%set shma=nothing%>
<%case"del"
myconn.execute("delete*from hand where id="&id&" and tname='"&lgname&"'")
%><%=t1%>刪 除 成 功<%=t2&d1%><p style="margin: 10">·郵件刪除完成·</p><%=d2%>
<%case"delall"
myconn.execute("delete*from hand where tname='"&lgname&"'")
%><%=t1%>清 空 成 功<%=t2&d1%><p style="margin: 10">·郵件清空完成·</p><%=d2%>

<%end select%>
  <br><!--#include file="down.asp"-->