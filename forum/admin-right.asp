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
noyes="�n �� �� �� �I"
mes="�A����i�J��x�޲z�C<br>�P�A�{�b�n���׾ª��Τ�W "&lgname&" ���O�޲z���C�P"%>
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
response.write"<option value=all selected>�Ҧ��׾�</option>"
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
    <b><font color="#FFFFFF">�׾«�x�޲z�t��</font></b></td>
  </tr>
  </table><br>
<%action=request.querystring("action")
select case action%>
<%case"addfl"
noyes="�K �[ �� ��"
mes="<P style='MARGIN: 5px'>�����Ǹ��G<input type=text name=bn size=20><font color=#FF0000>�P</font>�u��� <b>0</b> ���~���Ʀr</p><P style='MARGIN: 5px'>�����W�١G<input type=text name=bdname size=20><font color=#FF0000>�P</font>�������W�١A�L����</p><P style='MARGIN: 5px'><input type=submit value=' �e �X ' name=B1> <input type=reset value=' �� �m ' name=B2></p>"
%>
<%
bn=request.form("bn")
bdname=Replace(Request.Form("bdname"),"'","''")
if bn="" or bn="0" or bdname="" or not isnumeric(bn) then
%>
<%else
set flyn=myconn.execute("select bn,bdname from bdinfo where bn='"&bn&"' and key='0'")
if not flyn.eof then
mes="<br>�P�����Ǹ� <b>"&bn&"</b> �w�g�s�b�I�P�п�ܧO�������Ǹ�<br><br>"
else
myconn.execute("insert into bdinfo(bn,bdname,key)values('"&bn&"','"&bdname&"','0')")
mes="<br>�P�s�W�׾¤��������I<br><br>"
end if
set flyn=nothing
end if
%><form method=POST>
<!--#include file="mes.asp"--></form>
<%case"bzgl"
bz=request.querystring("bz")
if bz="add" then
bt="�s�W�s���D"
go="add"
put="&nbsp;�K&nbsp;�[&nbsp;"
elseif bz="del" then
bt="�R�����D"
go="del"
put="&nbsp;�R&nbsp;��&nbsp; "
end if
%>
<form action="admin-gl.asp?menu=bzgl&go=<%=go%>" method="POST">
<%=t1&bt&t2&d1%>
<P style='MARGIN: 5px'>���D�W�١G<input type="text" name="name" size="20"></p><P style='MARGIN: 5px'>�޲z�׾¡G<%=bdlist("bd",0)%>
</p><P style='MARGIN: 5px'><input type="submit" value=<%=put%> name="B1">&nbsp;
<input type="reset" value=" �� �m " name="B2"></p>

<%=d2%>
</form>
<%case"chadmin"%>
<form action="admin-gl.asp?menu=chadmin" method="POST">
<%=t1%>���޲z��<%=t2&d1%><P style="MARGIN: 5px">�޲z���W�١G( �ӦW�٥����w�g�b�׾¤����U ) <input type="text" name="adminname" size="20"> 
<input type="submit" value=" �e �X " name="B1">
<input type="reset" value=" �� �m " name="B2"></p><%=d2%>
</form>
<%case"deluser"%>
<form action="admin-gl.asp?menu=deluser" method="POST">
<%=t1%>�R���Τ�<%=t2&d1%><P style="MARGIN: 5px">�Τ�W�G<input type="text" name="delname" size="20"> 
<input type="submit" value=" �R �� " name="B1">
<input type="reset" value=" �� �m " name="B2"></p><%=d2%>
</form>
<%case"lookuser"%><br>
<%=t1%>�d �� �` �U �� ��<%=t2%>
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
<%=t1%>�ק�׾»{�ҥΤ�<%=t2&d1%>
<P style="MARGIN: 5px">�U���O�w�g�q�L�{�Ҫ��Τ�A�n�s�W���~���g�A�U�Τᤧ���Ρu,�v�j�}�C</p><P style="MARGIN: 5px"><b>
<font color="#FF0000">�`�N�G</font></b>��g�L�{���@�w����ϥΦ^��</p><P style="MARGIN: 5px">
<textarea name="user" cols=90 rows="15"><%=showps("pass")%></textarea></p><P style="MARGIN: 5px"><input type="submit" value=" �e �X " name="b1"> <input type="reset" value=" �� �m " name="b2">
</p><%set showps=nothing%>
</form>
<%case"bbs"
set bbs=myconn.execute("select*from bbsinfo")
%>
<form method="POST" action="admin-gl.asp?menu=bbs">
<%=t1%>�ק�׾¦W�٤Ψ�L<%=t2&d1%>
<P style="MARGIN: 5px">�׾¦W��:<input type="text" name="tl" size="37" value="<%=bbs("tl")%>"><font color="#FF0000">�P</font>(�A���׾ª��W��)</p>
<P style="MARGIN: 5px">����C��:<input type="text" name="c1" size="20" value="<%=bbs("c1")%>"><font color="#FF0000">�P</font>(�����ت��C��)</p>
<P style="MARGIN: 5px">�׾©���:<input type="text" name="c2" size="20" value="<%=bbs("c2")%>"><font color="#FF0000">�P</font>(�@�Ǫ�檺����)</p>
<P style="MARGIN: 5px"><input type="submit" value=" �e �X " name="B1"> <input type="reset" value=" �� �m " name="B2"></p>
<%=d2%>
</form>
<%set bbs=nothing%>
<%case"chbbsinfo"
bn=request.querystring("bn")
set bbsinfo=myconn.execute("select*from bdinfo where bn='"&bn&"' and key<>'0'")
%><form action="admin-gl.asp?menu=updatebbs&bn=<%=bn%>" method="POST">
<%=t1%>�ק�׾«H��<%=t2&d1%>
<P style='MARGIN: 5px'>�׾§Ǹ��G<b><%=bn%></b><P style='MARGIN: 5px'>�׾¦W�١G<input type="text" name="bdname" size="25" value="<%=bbsinfo("bdname")%>"><font color="#FF0000">�P</font>�L����</p>
<P style='MARGIN: 5px'>�лx�Ϥ��G<input type="text" name="picurl" size="49" value="<%=bbsinfo("picurl")%>">�P�N��ܦb�׾ª��k��A�i�H����C</p>
<P style='MARGIN: 5px'>�׾¤��СG<br><textarea rows="4" name="bdinfo" cols="58"><%=bbsinfo("bdinfo")%><%shuyu=bbsinfo("key")
paa=bbsinfo("pass")
set bbsinfo=nothing%></textarea><font color="#FF0000">�P</font></p>
<P style='MARGIN: 5px'>�ݩ�����G<select size="1" name="key" style="font-size: 9pt">
<%set bf=myconn.execute("select*from bdinfo where key='0' order by bn")
do while not bf.eof%><%if shuyu=bf("bn") then%><option value="<%=bf("bn")%>" selected><%=bf("bdname")%></option><%else%>
<option value="<%=bf("bn")%>"><%=bf("bdname")%></option><%end if%>
<%
bf.movenext
Loop
bf.Close
set bf=nothing
%>
</select><font color="#FF0000">�P</font>�п�ܸӽ׾��ݩ���@�ؤ���</p><br><P style='MARGIN: 4px'>
�׾������G(�бq�U�����ⶵ��ܤ@��)<font color="#FF0000">�P</font></p><P style='MARGIN: 4px'><input type="radio" value="nopwd" name="bbstype" <%if isnull(paa) or paa="" then%>checked<%end if%>>���q�׾�
�]���U�Τ�i�H�ۥѪ��i�J�������׾¡A�P���ˡP�^<P style='MARGIN: 4px'><input type="radio" value="pwdpass" name="bbstype" <%if paa<>"" then%>checked<%end if%>>�{�ҽ׾�
�]�u�����D�{�Ҫ����U�Τ�~��i�J�������׾¡^</p><br>
<P style='MARGIN: 4px'><input type="submit" value=" �e �X " name="B1"> <input type="reset" value=" �� �m " name="B2"></p><br><%=d2%>
</form>
<%case"delall"
bn=request.querystring("bn")
myconn.execute("delete*from min where bd="&bn&"")
%><%=t1%>�R �� �� �\<%=t2&d1%><P style="MARGIN: 5px"><br>�P�w�g�������R���F�Ӫ������Ҧ����l�P</p><br><%=d2%>

<%case"updateuser"%>
<form action="admin-gl.asp?menu=updateuser" method="POST">
<%=t1%>���Τ���<%=t2&d1%>
<P style="MARGIN: 5px">�Τ�W�G<input type="text" name="chname" size="19"></p>
<P style="MARGIN: 5px">��&nbsp; ���G<input type="text" name="chqian" size="10"> 
  �y&nbsp; �O�G<input type="text" name="chmeili" size="10">
  �g&nbsp; ��G<input type="text" name="chjingyan" size="10"></p><P style="MARGIN: 5px"><input type="submit" value=" �e �X " name="B1">&nbsp; 
<input type="reset" value=" �� �m " name="B2">&nbsp;<%=d2%></form>
<%case"seepwd"%>
<form action="admin-gl.asp?menu=seepwd" method="POST">
<%=t1%>�d�ݥΤ�K�X<%=t2&d1%><P style="MARGIN: 5px">�Τ�W�G<input type="text" name="chaname" size="20"> 
<input type="submit" value=" �e �X " name="B1">
        <input type="reset" value=" �� �m " name="B2"></p><%=d2%> 
</form>
<%case"delany"%>
<center><font color="#FF0000">�`�N�G�ϥΦ��\��N�R�����w�����l�H�Τ��i�A�R���ᤣ���_�I�зV���ϥΡI�I</font></center>
<form action="admin-gl.asp?menu=delany" method="POST">
<%=t1%>�R�����w����������l<%=t2&d1%>
<P style="MARGIN: 5px">�R���h�֤ѫe�����l�G( ��Ʀr ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px">�R�����l�Ҧb���׾¡G( �п�� ) <%=bdlist("bd",1)%></p><P style="MARGIN: 5px"><input type="submit" value=" �e �X " name="B1">&nbsp; 
<input type="reset" value=" �� �m " name="B2">&nbsp;<%=d2%></form>
<form action="admin-gl.asp?menu=delnore" method="POST">
<%=t1%>�R�����w������S���^�Ъ��D�D<%=t2&d1%>
<P style="MARGIN: 5px">�R���h�֤ѫe�����l�G( ��Ʀr ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px">�R�����l�Ҧb���׾¡G( �п�� ) <%=bdlist("bd",1)%></p><P style="MARGIN: 5px"><input type="submit" value=" �e �X " name="B1">&nbsp; 
<input type="reset" value=" �� �m " name="B2">&nbsp;<%=d2%></form><form action="admin-gl.asp?menu=delwhose" method="POST">
<%=t1%>�R�����w�Τ᪺�Ҧ����l<%=t2&d1%>
<P style="MARGIN: 5px">�R�����w�Τ᪺���l�G( �Τ�W ) 
<input type="text" name="ddname" size="19"></p>
<P style="MARGIN: 5px">�R�����l�Ҧb���׾¡G( �п�� ) <%=bdlist("bd",1)%></p><P style="MARGIN: 5px"><input type="submit" value=" �e �X " name="B1">&nbsp; 
<input type="reset" value=" �� �m " name="B2">&nbsp;<%=d2%></form>
<%case"bbsmail"%>
<center><font color="#FF0000">�`�N�G�ϥΦ��\��N�R�����w���l��A�R���ᤣ���_�I�зV���ϥΡI�I</font></center>
<form action="admin-gl.asp?menu=delanymail" method="POST">
<%=t1%>�R�����w��������l��<%=t2&d1%>
<P style="MARGIN: 5px">�R���h�֤ѫe���l��G( ��Ʀr ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px"><input type="submit" value=" �e �X " name="B1">&nbsp; 
<input type="reset" value=" �� �m " name="B2">&nbsp;<%=d2%></form>
<form action="admin-gl.asp?menu=delwhosemail" method="POST">
<%=t1%>�R�����w�Τ᪺�Ҧ��l��<%=t2&d1%>
<P style="MARGIN: 5px">�R�����w�Τ᪺�l��G( �Τ�W ) 
<input type="text" name="ddname" size="19"></p>
<P style="MARGIN: 5px"><input type="submit" value=" �e �X " name="B1">&nbsp; 
<input type="reset" value=" �� �m " name="B2">&nbsp;<%=d2%></form>

<%case"seepwd"%>
<form action="admin.gl.asp?menu=lookpwd" method="POST">
<%=t1%>�d�ݥΤ�K�X<%=t2&d1%><P style="MARGIN: 5px">�Τ�W�G<input type="text" name="chaname" size="20"> 
<input type="submit" value=" �e �X " name="B1">
        <input type="reset" value=" �� �m " name="B2"></p><%=d2%> 
</form>
<%case"moveany"%>
<form action="admin-gl.asp?menu=moveday" method="POST">
<%=t1%>�����w�ѼƲ��ʩ��l<%=t2&d1%>
<P style="MARGIN: 5px">���ʦh�֤ѫe�����l�G( ��Ʀr ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px">���l��өҦb���׾¡G( �п�� ) 
<%=bdlist("frombd",0)%></p>
<P style="MARGIN: 5px">���l�n���ʨ쪺�׾¡G( �п�� ) 
<%=bdlist("tobd",0)%></p><P style="MARGIN: 5px"><input type="submit" value=" �e �X " name="B1">&nbsp; 
<input type="reset" value=" �� �m " name="B2">&nbsp;<%=d2%></form>
<form action="admin-gl.asp?menu=movename" method="POST">
<%=t1%>�����w�ΤᲾ�ʩ��l<%=t2&d1%>
<P style="MARGIN: 5px">���ʫ��w�Τ᪺���l�G( �Τ�W ) 
<input type="text" name="movename" size="19"></p>
<P style="MARGIN: 5px">���l��өҦb���׾¡G( �п�� ) 
<%=bdlist("frombd",0)%></p>
<P style="MARGIN: 5px">���l�n���ʨ쪺�׾¡G( �п�� ) 
<%=bdlist("tobd",0)%></p><P style="MARGIN: 5px"><input type="submit" value=" �e �X " name="B1">&nbsp; 
<input type="reset" value=" �� �m " name="B2">&nbsp;<%=d2%></form>
<%case"lm"%>
<form action="admin-gl.asp?menu=addlm" method="POST">
<%=t1%>�s�W�׾��p��<%=t2&d1%><P style="MARGIN: 5px">�׾¦W�١G<input type="text" name="name" size="20"></p>
<P style="MARGIN: 5px">�׾¦a�}�G<input type="text" name="url" size="38"></p>
<P style="MARGIN: 5px">�׾¹Ϥ��G<input type="text" name="picurl" size="38"></p> 
<P style="MARGIN: 5px"><input type="submit" value=" �K �[ " name="B1"> <input type="reset" value=" �� �m " name="B2"></p><%=d2%>
</form>
<form action="admin-gl.asp?menu=dellm" method="POST">
<%=t1%>�R���׾��p��<%=t2&d1%><P style="MARGIN: 5px">�׾¦W�١G<input type="text" name="name" size="20"> 
<input type="submit" value=" �R �� " name="B1">
<input type="reset" value=" �� �m " name="B2"></p><%=d2%>
</form>
<%end select
end if%>