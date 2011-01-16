<!--#include file="ubbcode.asp"-->
<%
action=request.querystring("action")
pai=request.querystring("pai")
if pai="" then
pai="orders"
end if
%>
<!--#include file="up.asp"-->
<script language="javascript">
function Check(){var Name=document.form.topage.value;
document.location='?bd=<%=bd%>&topage='+Name+'';
}
</script>
<style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="94%" height="40">
    <tr>
      <td width="100%"> · <%if lgname<>"" then%><a href="elselist.asp?action=mytop">我發表的主題</a> · <a href="elselist.asp?action=withmetop">我參與的主題</a> · <%end if%><a href="elselist.asp?action=new">查看新帖</a> ·</td>
    </tr>
  </table>
  </center>
</div>
<%
dim rs
dim sql
set rs = server.createobject("adodb.recordset")
select case action
case"new"
href1="<a href=?topage=1&action=new>"
href3="<a href=?topage="&TotalPage&"&action=new>"
sql = "select * from min where bid=0 and gonggao<>1 and gonggao<>4 order by "&pai&" desc"
count=myconn.execute("select count(*)from min where bid=0 and gonggao<>1 and gonggao<>4")(0)
case"mytop"
href1="<a href=?topage=1&action=mytop>"
href3="<a href=?topage="&TotalPage&"&action=mytop>"
sql = "select * from min where bid=0 and gonggao<>1 and gonggao<>4 and name='"&lgname&"' order by gonggao desc,"&pai&" desc"
count=myconn.execute("select count(*)from min where bid=0 and gonggao<>1 and gonggao<>4 and name='"&lgname&"'")(0)
case"withmetop"
href1="<a href=?topage=1&action=withmetop>"
href3="<a href=?topage="&TotalPage&"&action=withmetop>"
sql = "select * from min where id in (select bid from min where gonggao<>1 and gonggao<>4 and name='"&lgname&"') or (bid=0 and gonggao<>1 and gonggao<>4 and name='"&lgname&"')order by gonggao desc,"&pai&" desc"
count=myconn.execute( "select count(*) from min where id in (select bid from min where gonggao<>1 and gonggao<>4 and name='"&lgname&"') or (bid=0 and gonggao<>1 and gonggao<>4 and name='"&lgname&"')")(0)
end select
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
%>
<div align=center><center>
<table border=1 cellpadding=0 cellspacing=0 style="border-collapse:collapse; border-left-width:1px; border-right-width:1px; border-top-width:1px" bordercolor=#3A51B8 width="94%" id=AutoNumber5 height="27">
<tr>
  <td width=4% align=center background="pic/8.gif">
  <b><font color="#FFFFFF">狀態</font></b></td>
  <td width=42% align=center background="pic/8.gif">
  <b><a target=_self href=list.asp?bd=<%=bd%>&pai=zhuti><font color="#FFFFFF">主 題</font></a><font color="#FFFFFF"> ( 點小圖標在新窗口瀏覽 )</font></b></td>
<td width=9% align=center background="pic/8.gif"><b><a target=_self href=list.asp?bd=<%=bd%>&pai=name>
<font color="#FFFFFF">作 者</font></a></b></td>
  <td width=9% align=center background="pic/8.gif">
  <b><font color="#FFFFFF">回覆/</font><a target=_self href=list.asp?bd=<%=bd%>&pai=hits><font color="#FFFFFF">人氣</font></a></b></td>
<td width=16% align=center background="pic/8.gif">
<b><a target=_self href=list.asp?bd=<%=bd%>><font color="#FFFFFF">最後更新時間</font></a></b></td>
  <td width=9% align=center background="pic/8.gif">
  <b><font color="#FFFFFF">最後回覆</font></b></td></tr></table></center></div>
<%
i=1
do while not rs.eof
rrzz=kbbs(rs("zhuti"))
set last=myconn.execute("select body,name from min where bid="&rs("id")&" order by id desc")
if last.eof then
zui="-----"
rb=rs("body")
tltltl="帖子內容："&kbbs(rb)&""
else
lb=last("body")
zui="<a href=userinfo.asp?name="&last("name")&">"&last("name")&"</a>"
tltltl="最後跟帖："&kbbs(lb)&""
set last=nothing
end if
response.write"<div align=center><center><table width='94%' border=1 cellpadding=0 cellspacing=0 style='TABLE-LAYOUT: fixed; WORD-BREAK: break-all;border-collapse:collapse; border-left-width:1px; border-right-width:1px; border-top-width:1px' bordercolor=#3A51B8  id=AutoNumber5><tr><td width=4% height=23 align=center><a target=_blank href=show.asp?id="&rs("id")&"&bd="&rs("bd")&"><img border=0 src=face/"&rs("face")&".gif></a></td><td width=42% height=27 align=left onmouseover=javascript:this.bgColor='#FBFDFF' onmouseout=javascript:this.bgColor=''>&nbsp;<a  target=_self href=show.asp?id="&rs("id")&"&bd="&rs("bd")&" title="&LeftTrue(tltltl,25)&">"&LeftTrue(rrzz,44)&"</a>"
bno1=myconn.execute("select count(name)from min where bid="&rs("id")&"")(0)
if bno1>10 then
response.write"<img align=absmiddle border=0 src=pic/hot.gif>"
end if
response.write"</td><td width=9% height=23 align=center><a href='userinfo.asp?name="&kbbs(rs("name"))&"'>"&kbbs(rs("name"))&"</a></td><td width=9% height=23 align=center>"&bno1&"/"&rs("hits")&"</td><td width=16% height=23 align=center>"&rs("orders")&"</td><td width=9% height=23 align=center>"&zui&"</td></tr></table></center></div>"
i=i+1
if i>pagesetup then exit do
rs.movenext
loop
rs.Close
%>
  <div align="center">
    <center>
<TABLE borderColor=#3A51B8 cellSpacing=0 cellPadding=0 width="94%" border=1 style="border-collapse: collapse; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px">
<TBODY>
<TR height=25>
<TD height=2>
<TABLE cellSpacing=0 cellPadding=3 width="100%" border=0 background="pic/8.gif" style="border-collapse: collapse; border-left-width:0; border-top-width:0; border-bottom-width:0">
<TBODY>
<TR>
<TD><b><font color="#FFFFFF"><img border="0" src="pic/fl.gif"> 本論壇共有</font><font color="#00FFFF"> <%=TotalPage%> </font><font color="#FFFFFF">頁,<font color="#00FFFF"> <%=count%> </font>個話題，每頁有<font color="#00FFFF"> <%=pagesetup%> </font> 張帖子 >> [
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
Response.Write ""&href1&"<font color=yellow>1</font></a> ... "
end if

for i=ii to iii
If i<>PageCount then
if action="new" then
href2="<a href=?topage="& i &"&action=new>"
end if
if action="mytop" then
href2="<a href=?topage="& i &"&action=mytop>"
end if
if action="withmetop" then
href2="<a href=?topage="& i &"&action=withmetop>"
end if

Response.Write ""&href2&"<font color=yellow>" & i & "</font></a> "
else
Response.Write " <font color=red><b>"&i&"</b></font> "
end if
next

if TotalPage > PageCount+5 then
Response.Write " ... "&href3&"<font color=yellow>"&TotalPage&"</font></a>"
end if
%> ]</font></b></TD>
<form name=form method="POST" action=javascript:Check()>
<TD height=2 align="right"><font color="#FFFFFF">頁碼：<input style=FONT-SIZE:9pt maxLength="6" size="6" name="topage" value="<%=PageCount%>">
<input style=FONT-SIZE:9pt value="GO!" type="submit"></font></TD></form>
</TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
</center>
  </div>
<br><!--#include file="line.asp"--><div align=center>
  <center>
<table border=0 cellpadding=0 cellspacing=0 style="border-collapse:collapse; border-left-width:1px; border-right-width:1px; border-top-width:1px" bordercolor=#3A51B8 width="94%" height="27" >
<tr>
<td width=100% height="27" style="border: 1px solid <%=c5%>" background="pic/8.gif">
<font color="#FFFFFF">&nbsp;<b><img border="0" src="pic/tj.gif" align="absmiddle"> 
線上統計：</b>目前論壇總共有 <b><%=lineno%></b> 人線上。其中有 <b><%=usno%></b> 位會員， <b><%=nusno%></b> 位遊客。 </font></td>
  </tr>
</table>
  </center>
</div>
<br><!--#include file="down.asp"-->