<%picnum=20%><style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>
<%sty="<p style='line-height: 150%; margin-left: 4; margin-top: 4'>"%>
<!--#include file="up.asp"-->
<br><br><%
action=request.querystring("action")
if action<>"agree" then
noyes="�A�ȱ��کM�n��"
mes="<b>�~����U�e�Х��\Ū�׾¨�ĳ</b><br>�w��z�[�J�����I�ѥ[��y�M�Q�סA�����I�����@�׾¡A�����@���W���@���ǩM���|í�w�A�бz��ı��u�H�U���ڡG<br><br>�@�B���o�Q�Υ����M�`��a�w���B���S��a���K�A���o�I�ǰ�a���|���骺�M�������X�k�v�q�A���o�Q�Υ����s�@�B�ƻs�M�Ǽ��U�C�H���G <br>�]�@�^���ʧܩڡB�}�a�˪k�M�k�ߡB��F�k�W��I���F<br>�]�G�^�����A�а�a�F�v�A��½���|�D�q��ת��F<br>�]�T�^���ʤ�����a�B�}�a��a�Τ@���F<br>�]�|�^���ʥ��ڤ���B���ڪ[���A�}�a���ڹε����F<br>�]���^���y�Ϊ̬n���ƹ�A���G�����A�Z�ê��|���Ǫ��F<br>�]���^�Ŵ��ʫذg�H�B�]©�B�ⱡ�B��աB�ɤO�B�����B���ơB�Э��Ǹo���F<br>�]�C�^���M�V�d�L�H�Ϊ̮��y�ƹ�����L�H���A�Ϊ̶i���L�c�N�������F<br>�]�K�^�l�`��a�����H�A���F<br>�]�E�^��L�H�Ͼ˪k�M�k�ߦ�F�k�W���F<br>�]�Q�^�i��ӷ~�s�i�欰���C<br>�G�B���۴L���A��ۤv�����שM�欰�t�d�C<form method=POST action='?action=agree'><center><input type=submit value=' �� �P �N ' name=B1></center></form>"
%><!--#include file="mes.asp"--><%else%>
<form method="POST" action="reg.asp" name="form">
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-width:0; border-collapse: collapse" bordercolor="#111111" width="94%">
    <tr>
      <td width="200" background="pic/5.gif">
      <img border="0" src="pic/9.gif" align="absbottom"><font color="#FFFFFF"><b>�s �� �� �` �U</b></font></td>
      <td background="pic/7.gif"><img border="0" src="pic/6.gif"></td>
    </tr>
  </table>
  </center>
</div>
<div align="center">
  <center>
<table border="1" cellpadding="0" cellspacing="0" style="border-width:1; border-collapse: collapse" bordercolor="<%=c1%>" width="94%">
<tr>
<td colspan="2" height="22" background="pic/0.gif">&nbsp;<b><font color="<%=c1%>">�������ơG</font></b></td>
</tr>
<tr>
<td>
<%=sty%><b>�Τ�W</b>�G<br>���U�Τ�W����W�L20�Ӧr���]10�Ӥ���r�^</td>
<td width="50%">&nbsp;<input type=text name=name size=30 maxlength=20></td>
</tr>
<tr>
<td><%=sty%>
<b>�K�X(�̦h20��)</b>�G<br>�Ф��n�ϥΥ������� '*'�B' ' �� HTML �r��</td>
<td>&nbsp;<input type=password name=password size=30 maxlength=20></td>
</tr>
<tr>
<td><%=sty%><b>���ƱK�X(�̦h20��)</b>�G<br>�ЦA��@�M�T�{</td>
<td>&nbsp;<input type=password name=repassword size=30 maxlength=20></td>
</tr>
<tr>
<td><%=sty%><b>Email�a�}</b>�G<br>�п�J���Ī��l��a�}�A�o�N�ϱz��Ψ�׾¤����Ҧ��\��</td>
<td>&nbsp;<input type=text name=email size=30 maxlength=30></td>
</tr>
<tr>
<td><%=sty%><b>�ƥαK�X�G</b><br>�Шc�O�I�ѰO�K�X�ɥi�H�γo�ӨӥR��K�X�I</td>
<td>&nbsp;<input type=text name=anhao size=30 maxlength=30></td>
</tr>
<tr>
<td colspan="2" height="22" background="pic/0.gif"><b>
    &nbsp;<font color="<%=c1%>">������ơG</font></b></td>
</tr>
<tr>
<td><%=sty%><b>�ʧO�G</b></td>
<td>&nbsp;<select size=1 name=sex style='font-size: 9pt; border: 1px solid ; background-color: #FFFFEC'><option selected value=1>�k</option><option value=2>�k</option></select></td>
</tr>
<tr>
<td><%=sty%><b>�ͤ�G</b>�]�Ы���1900-1-1�榡��g�^</td>
<td>&nbsp;<input type=text name=burn size=21 maxlength=10 value=���i�D�A></td>
</tr>
<tr>
<td><%=sty%><b>�����G</b><br>��g�A���ӤH�����A���j�a���Ѩ��ѡI</td>
<td>&nbsp;<input type=text name=home size=30 maxlength=40></td>
</tr>
<tr>
<td><%=sty%><B>OICQ���X</B>�G<BR>��g�z��QQ�a�}�A��K�P�L�H���pô</td>
<td>&nbsp;<input type=text name=qq size=16 maxlength=10></td>
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
<td>&nbsp;<input name=mypic size=38 maxlength=100> ����Url�a�}<br>&nbsp;�Ϲ��e�סG<input type=text name=ku size=6> ���סG <input type=text name=ch size=6>�]������j��120�^</td>
</tr>
<tr>
<td valign="top" height="80"><%=sty%><B>�ө�ñ�W</B>�G<BR>�̦h255�Ӧr��<BR>��r�N�X�{�b�z�o���峹�������B�C��{�z���өʡC</td>
<td>&nbsp;<TEXTAREA name=gxqm rows=5 wrap=PHYSICAL cols=60></TEXTAREA></td>
</tr>
<tr>
<td colspan="2" height="30" align="center"><input type=submit value=�ڶ�n�F�A�{�b���U�I name=Submit>&nbsp;&nbsp; <input type=reset value=����A�٬O���g�a�I name=Submit2></td>
</tr>
</table></center>
</div></form><%end if%><br><!--#include file="down.asp"-->