<style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>
<!--#include file="up.asp"--><!--#include file="fun.asp"-->
<br><br>
<div align=center><center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr>
<td width=30% background=pic/5.gif><img border=0 src=pic/9.gif align=absbottom><font color=#FFFFFF><b>�� �� �C ��</b></font></td><td width=70% background=pic/7.gif><img border=0 src=pic/6.gif></td></tr></table></center></div>
<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px" bordercolor="<%=c1%>" width="94%">
    <tr>
      <td width="22%" align="center" height="25" bgcolor="<%=c2%>"><b>�Τ�W</b></td>
      <td width="10%" align="center"><b>�ʧO</b></td>
      <td width="10%" align="center" bgcolor="<%=c2%>"><b>E-mail</b></td>
      <td width="14%" align="center"><b>QQ���X</b></td>
      <td width="10%" align="center" bgcolor="<%=c2%>"><b>����</b></td>
      <td width="10%" align="center"><b>�o����</b></td>
      <td width="25%" align="center" bgcolor="<%=c2%>"><b>����</b></td>
    </tr>
  </table>
  </center>
</div>
<%
dim rs
dim sql
set rs = server.createobject("adodb.recordset")
sql = "select * from user order by userid desc"
count=myconn.execute("select count(name)from user")(0)
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
response.write"<div align=center><center><table border=1 cellpadding=0 cellspacing=0 bordercolor="&c1&" width=94% ><tr><td width='22%' align=center height=25 bgcolor="&c2&">"
myname=kbbs(rs("name"))
response.write"<a href='userinfo.asp?name="&myname&"'>"&myname&"</a></td><td width=10% align=center>"
if rs("sex")=1 then
sex1="�k"
else
sex1="�k"
end if
response.write""&sex1&"�@</td><td width=10% align=center bgcolor="&c2&"><a href='mailto:"&rs("email")&"'><img src='pic/mail.gif' border='0'></a>�@</td><td width='14%' align=center>"&rs("qq")&"�@</td><td width=10% align=center bgcolor="&c2&"><a target='_blank' href='"&rs("home")&"'><img border='0' src='pic/home.gif'></a></td><td width=10% align=center>"&myconn.execute("select count(riqi) from min where name='"&rs("name")&"'")(0)&"�@</td><td width='25%' align=center bgcolor="&c2&">"
q1=rs("qian")%><%m1=rs("meili")%><%j1=rs("jingyan")%><%sqltype="my"%><!--#include file="upji.asp"-->
<%
response.write"<b>"&dj&"</b>�y "&dd&" �z</td></tr></table></center></div>"
%>

<%i=i+1
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
<TD><b><font color="#FFFFFF"><img border="0" src="pic/fl.gif"> ���U�Τ�@��</font><font color="#00FFFF"> <%=TotalPage%> </font><font color="#FFFFFF">��,<font color="#00FFFF"> <%=count%> </font>��A�C����<font color="#00FFFF"> <%=pagesetup%> </font> ��Τ� >> [
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
<TD height=2 align="right"><font color="#FFFFFF">���X�G<input style=FONT-SIZE:9pt maxLength="6" size="6" name="topage" value="<%=PageCount%>">
<input style=FONT-SIZE:9pt value="GO!" type="submit"></font></TD></form>
</TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
</center>
  </div><br><!--#include file="down.asp"-->