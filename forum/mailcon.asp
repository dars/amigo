<!--#include file="up.asp"--><%t1="<div align=center><center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><td width=50% background=pic/5.gif><img border=0 src=pic/9.gif align=absbottom><font color=#FFFFFF><b>"
t2="</b></font></td><td width=50% background=pic/7.gif><img border=0 src=pic/6.gif></td></tr></table></center></div>"
d1="<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% >"
d2="</td></tr></table></center></div>"
id=request.querystring("id")
%><style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>
<!--#include file="fun.asp"--><!--#include file="ubbcode.asp"--><br><br>
<%set mail=myconn.execute("select name from user where name='"&lgname&"' and password='"&lgpwd&"'")
if mail.eof then%>
<%=t1%>�� �~ �T ��<%=t2&d1%><P style='MARGIN: 10px'>�i�J�l�c���ѡI�i��s�b�H�U���D�G</p><P style='MARGIN: 10px'>�P�A�٨S��<a href="login.asp">�n��</a>�P</p><P style='MARGIN: 10px'>�P�A���Τ�W�αK�X���~�P</p>
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
tl="�o �e �l ��"
end if
if dw="re" then
body=shma("neirong")
sjr=shma("name")
tl="�^ �_ �l ��"
end if
if dw="toother" then
sjr=""
tl="�l �� �� �o"
end if
%> <form method="POST" action="?menu=save">
<%=t1&tl&t2&d1%>
<p style="margin: 10">�� �� �H�G<input type="text" name="tname" size="82" value="<%=sjr%>"></p>
<p style="margin: 10">�l�󤺮e�G[ �i�H�ϥ�UBB�N�X�H�ν׾©��l���Ҧ��\��]���F�W�ǡB���i�^ ]</p>
<p style="margin: 10"><textarea rows="12" name="neirong" cols="92"><%if dw="re" then%>====================�b <%=shma("riqi")%> �z�ӫH���G================================
<%=LeftTrue(body,100)%>
========================================================================================<%end if%>
<%if dw="toother" then%>================================�U������o���e======================================
<%=shma("neirong")%>
========================================================================================
<%end if%>
</textarea></p>
<p style="margin: 10"><input type="submit" value=" �o �e " name="B1"> <input type="reset" value=" �� �m " name="B2"></p>
<%=d2%>
</form><%set shma=nothing%>
<%case"save"
tname=Replace(Request.Form("tname"),"'","''")
neirong=Replace(Request.Form("neirong"),"'","''")
if tname="" or neirong="" then
%><%=t1%>�� �~ �T ��<%=t2&d1%><p style="margin: 10">�P�o�e���ѡA����H�M���e����d�šP</p><%=d2%>
<%else
set isha=myconn.execute("select name from user where name='"&tname&"'")
if isha.eof then%><%=t1%>�� �~ �T ��<%=t2&d1%><p style="margin: 10">�P�o�e���ѡA�׾¤����s�b�Ӧ���H�P</p><%=d2%>
<%else
myconn.execute("insert into hand(name,neirong,riqi,tname)values('"&lgname&"','"&neirong&"',now,'"&tname&"')")%>
<%=t1%>�o �e �� �\<%=t2&d1%><p style="margin: 10">�P�l��w�g�������o�e�� <b><%=kbbs(tname)%></b> �P</p><%=d2%>
<%end if
set isha=nothing
end if%>
<%end select%>  <br><!--#include file="down.asp"-->