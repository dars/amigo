<%picnum=20%><style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>
<!--#include file="up.asp"--><!--#include file="fun.asp"-->
<br><br><%sty="<P style='MARGIN: 8px'>"
t1="<div align=center><center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><td width=50% background=pic/5.gif><img border=0 src=pic/9.gif align=absbottom><font color=#FFFFFF><b>"
t2="</b></font></td><td width=50% background=pic/7.gif><img border=0 src=pic/6.gif></td></tr></table></center></div>"
d1="<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% ><P style='MARGIN: 15px'>"
d2="</p></td></tr></table></center></div>"
lgname=Request.Cookies("lgname")
lgpwd=Request.Cookies("lgpwd")
set canl=myconn.execute("select*from user where name='"&lgname&"' and password='"&lgpwd&"'")
if canl.eof or canl.bof then
%>
<%=t1%>�� �~ �T ��<%=t2&d1%>�P�A�٨S���n���Ϊ̧A�n�����Τ�W�αK�X���~�I�P<%=d2%><%
response.end
end if
%>
<form method="POST" action="chinfo.asp" name="form">
<%=t1%>�ڪ��ӤH���<%=t2%>
<div align="center">
  <center>
<table border="1" cellpadding="0" cellspacing="0" style="border-width:1; border-collapse: collapse" bordercolor="<%=c1%>" width="94%">
<tr>
<td colspan="2" height="22" background="pic/0.gif">&nbsp;<b><font color="<%=c1%>">�������ơG</font></b></td>
</tr>
<tr>
<td>
<%=sty%><b>�Τ�W</b>�G<br>���U�Τ�W����W�L20�Ӧr���]10�Ӥ���r�^</td>
<td width="50%">&nbsp;<b><%=kbbs(lgname)%></b></td>
</tr>
<tr>
<td><%=sty%>
<b>�K�X(�̦h20��)</b>�G<br>�Ф��n�ϥΥ������� '*'�B' ' �� HTML �r��</td>
<td>&nbsp;<input type="password" name="newpwd" size="30" maxlength="20" value="<%=canl("password")%>"></td>
</tr>
<tr>
<td><%=sty%><b>���ƱK�X(�̦h20��)</b>�G<br>�ЦA��@�M�T�{</td>
<td>&nbsp;<input type="password" name="repwd" size="30" maxlength="20" value="<%=canl("password")%>"></td>
</tr>
<tr>
<td><%=sty%><b>Email�a�}</b>�G<br>�п�J���Ī��l��a�}�A�o�N�ϱz��Ψ�׾¤����Ҧ��\��</td>
<td>&nbsp;<input type="text" name="email" size="30" maxlength="30" value="<%=canl("email")%>"></td>
</tr>
<tr>
<td><%=sty%><b>�ƥαK�X�G</b><br>�Шc�O�I�ѰO�K�X�ɥi�H�γo�ӨӥR���K�X�I</td>
<td>&nbsp;<input type="text" name="anhao" size="30" maxlength="30" value="<%=canl("anhao")%>"></td>
</tr>
<tr>
<td colspan="2" height="22" background="pic/0.gif"><b>
    &nbsp;<font color="<%=c1%>">������ơG</font></b></td>
</tr>
<tr>
<td><%=sty%><b>�ʧO�G</b></td>
<td>&nbsp;<select size="1" name="sex" style="font-size: 9pt; border: 1px solid <%=c1%>; background-color: #FFFFEC">
        <%if canl("sex")="1" then%><option selected value="1">�k</option>
        <option value="2">�k</option><%else%><option selected value="2">�k</option>
        <option value="1">�k</option><%end if%></select></td>
</tr>
<tr>
<td><%=sty%><b>�ͤ�G</b>�]�Ы���1900-1-1�榡��g�^</td>
<td>&nbsp;<input type="text" name="burn" size="21" maxlength="10" value="<%=canl("burn")%>"></td>
</tr>
<tr>
<td><%=sty%><b>�����G</b><br>��g�A���ӤH�����A���j�a���Ѩ��ѡI</td>
<td>&nbsp;<input type="text" name="home" size="30" maxlength="40" value="<%=canl("home")%>"></td>
</tr>
<tr>
<td><%=sty%><B>OICQ���X</B>�G<BR>��g�z��QQ�a�}�A��K�P�L�H���pô</td>
<td>&nbsp;<input type="text" name="qq" size="16" maxlength="10" value="<%=canl("qq")%>"></td>
</tr>
<tr>
<td valign="top"><%=sty%><b>�ڪ��Y���G</b><br>�ϥν׾¦۱a���Ϲ�</td>
<td>
<p style="margin-top: 3; margin-bottom: 3">&nbsp;<select name=headpic size=1 onChange="showimage()" style="font-size: 9pt">
<%for i=1 to picnum%>
<option value=<%=i%>><%=i%></option>
<%next%>
</select><img src="headpic/1.gif" name="tus"><script>function showimage(){document.images.tus.src="headpic/"+document.form.headpic.options[document.form.headpic.selectedIndex].value+".gif";}</script> <br>
</td>
</tr>
<tr>
<td><%=sty%><B>�۩w�q�Y��</B>�G<br>�p�G�Ϲ���m�����s���Ϥ��N�H�۩w�q�����D</td>
<td>&nbsp;<input name="mypic" size=38 maxlength=100 value="<%=canl("toupic")%>"> ����Url�a�}<br>&nbsp;�Ϲ��e�סG<input type="text" name="ku" size="6" value="<%=canl("ku")%>"> ���סG <input type="text" name="ch" size="6" value="<%=canl("ch")%>">�]������j��120�^</td>
</tr>
<tr>
<td valign="top" height="80"><%=sty%><B>�ө�ñ�W</B>�G<BR>�̦h255�Ӧr��<BR>��r�N�X�{�b�z�o�����峹�������B�C��{�z���өʡC</td>
<td>&nbsp;<TEXTAREA name=gxqm rows=5 wrap=PHYSICAL cols=60><%=canl("gxqm")%></TEXTAREA></td>
</tr>
<tr>
<td colspan="2" height="30" align="center">
<input type=submit value=�ڭק�F�A�{�b����I name=Submit>&nbsp;&nbsp; <input type=reset value=����A�٬O���g�a�I name=Submit2></td>
</tr>
</table></center>
</div></form>
<br><!--#include file="down.asp"-->