<%
name=Request.Cookies("lgname")
pwd=Request.Cookies("lgpwd")
if name="" then
Response.Redirect"login.asp"
response.end
end if
application(name)=1%>
<SCRIPT>
function emoticon(theSmilie){
document.kbbs.body.value +=theSmilie + '';
document.kbbs.body.focus();
}
</SCRIPT><SCRIPT src="ybbcode.js"></SCRIPT>
<SCRIPT>var i=0;
function presskey(eventobject){if(event.ctrlKey && window.event.keyCode==13){i++;if (i>1) {alert('���l���b�o�X�A�Э@�ߵ��ݡI');return false;}this.document.kbbs.submit();}}
</SCRIPT><style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>
<!--#include file="up.asp"-->
<%if isnull(pass) or pass="" then
userin=ok
else
user=split(pass,",")
for i = 0 to ubound(user)
if lgname=trim(user(i)) and lgname<>"" then
userin="ok"
exit for
else
userin="no"
end if
next
end if
if userin="no" then
noyes="�i �J �� �� �I"
mes="<font color="&c1&"><b>�A���৹�����i�J�Ӫ����A�i��s�b�H�U���D�G</b></font><br>�� �Ӫ������{�ҽ׾¡A�A�٨S���o���D���{�ҡI<br> �� �A�٨S��<a href=login.asp>�n��</a>�I<br><br>"%>
<br><!--#include file="mes.asp"-->
<%response.end
else
%><br>
<%re=request.querystring("re")
if re="no" then
action="save.asp?bd="&bd&"&re=no"
zhuti=""
elseif re="yes" then
id=request.querystring("id")
action="save.asp?bd="&bd&"&id="&id&"&re=yes"
zhuti="�^��ID:"&id&""
end if
%>
<form method=POST name=kbbs action=<%=action%>><div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="94%">
    <tr>
<td width="18%" background="pic/5.gif">
<img border="0" src="pic/9.gif" align="absbottom"><font color="#FFFFFF"><b>�o �� �� �l</b></font></td>
<td width="82%" background="pic/7.gif">
<img border="0" src="pic/6.gif"></td></tr></table></div>

<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="<%=c1%>" width="94%">
    <tr>
  <td width="24%" height="30">	<b>&nbsp;�Τ�W�G</b></td>
  <td width="76%" height="30"> &nbsp;<input type=text name=name size=20 value="<%=name%>">
  <font color="<%=c1%>">*</font> <a href="zhuce.asp">�S�����U�H</a></td>    </tr>
    <tr>
      <td width="24%" height="30">&nbsp;<b>�K&nbsp; �X�G</b></td>
      <td width="76%">&nbsp;<input type=password name=password size=20 value="<%=pwd%>">
      <font color="<%=c1%>">*</font> <a href="getpwd.asp">�ѰO�K�X�H</a></td>
    </tr>
    <tr>
      <td width="24%" height="30">&nbsp;<b>���l�D�D�G</b></td>
      <td width="76%">&nbsp;<input type=text name=zhuti size=80 maxlength=59 value="<%=zhuti%>">
  <font color="<%=c1%>">*</font></td>
    </tr>
    <tr>
      <td width="24%" height="50">
      <p style="line-height: 150%; margin-left: 5; margin-top: 5"><b>�A�����G</b> <br>�P��b���l�e���C</td>
      <td width="76%"><input type=radio value=face1 name=face checked> 
  <img border=0 src=face/face1.gif width="16" height="16"> <input type=radio value=face2 name=face> 
  <img border=0 src=face/face2.gif width="16" height="16"> <input type=radio value=face3 name=face> 
  <img border=0 src=face/face3.gif width="16" height="16"> <input type=radio value=face4 name=face> 
  <img border=0 src=face/face4.gif width="16" height="16"> <input type=radio value=face5 name=face> 
  <img border=0 src=face/face5.gif width="16" height="16"> <input type=radio value=face6 name=face> 
  <img border=0 src=face/face6.gif width="16" height="16"> <input type=radio value=face7 name=face> 
  <img border=0 src=face/face7.gif width="16" height="16"> <input type=radio value=face8 name=face> 
  <img border=0 src=face/face8.gif width="16" height="16"> <input type=radio value=face9 name=face> 
  <img border=0 src=face/face9.gif width="16" height="16"><p style='margin-top: 2; margin-bottom: 2'>
  <input type=radio value=face10 name=face> 
  <img border=0 src=face/face10.gif width="16" height="16"> <input type=radio value=face11 name=face> 
  <img border=0 src=face/face11.gif width="16" height="16"> <input type=radio value=face12 name=face> 
  <img border=0 src=face/face12.gif width="16" height="16"> <input type=radio value=face13 name=face> 
  <img border=0 src=face/face13.gif width="16" height="16"> <input type=radio value=face14 name=face> 
  <img border=0 src=face/face14.gif width="16" height="16"> <input type=radio value=face15 name=face> 
  <img border=0 src=face/face15.gif width="16" height="16"> <input type=radio value=face16 name=face> 
  <img border=0 src=face/face16.gif width="16" height="16"> <input type=radio value=face17 name=face> 
  <img border=0 src=face/face17.gif width="16" height="16"> <input type=radio value=face18 name=face> 
  <img border=0 src=face/face18.gif width="16" height="16"></td>
    </tr>
<tr>
      <td width="24%" height="296" valign="top">
<p style="line-height: 150%; margin-left: 5; margin-top: 5">
<b>���l���e�G</b><br>
      �PHTML���ҡG ���i��<br>
�PUBB���ҡG �i��<br>
�P�K�ϼ��ҡG �i��<br>
�PFlash���ҡG���i��<br>
�P���r���ഫ�G���i��<br>
�P�W�ǹϤ��G�i��<br>
�P�̦h15KB<br><b>�S���e�G</b><br>
�P<a href="javascript:grade()" title='�榡�G[showtograde=1]���e[/s]			��ܥu�����Ŧb�u1�v�H�W�~���s���u���e�v			�u1�v�M�u���e�v�i�H�۩w�A				�ϥθӶ����I���I'>���ťi�����e</a><br>�P<a href="javascript:reply()" title='�榡�G[showtoreply]���e[/s]			��ܥu���^�Ъ̤~���s���u���e�v�A		�u���e�v�i�H�۩w�A				�ϥθӶ����I���I'>�^�Хi�����e</a><br>�P<a href="javascript:name()" title='�榡�G[showtoname=zym]���e[/s]			��ܥu���uzym�v�~���s���u���e�v			�uzym�v�M�u���e�v�i�H�۩w�A				�ϥθӶ����I���I'>���wŪ�̤��e</a><br>
<%if re="no" then%><b>���l�����G</b><br>
<input type="radio" name="gonggao" value="0" checked>���q���l<br>
<a title="�]�N�b���i�椤��ܥD�D�A�ϥθ��������l�ݭn�����G����1000�A�y�O200�A�g��200�^"><input type="radio" name="gonggao" value="4"></a>���i���l<br><%if admin="yes" then%><input type="radio" name="gonggao" value="1">�t�Τ��i<br><%end if%><br><%end if%></td>      <td width="76%" valign="top">
      <p style="margin-left: 4; margin-top: 4">
        <p>
        <IFRAME name=ad 
            src="upload.asp" frameBorder=0 
            width="100%" scrolling=no height=25></IFRAME><br>&nbsp;�\����s�G<IMG onclick=fly() alt=����r src="pic/fly.gif" border=0> 
        <IMG onclick=move() alt=���ʦr 
      src="pic/move.gif" border=0> 
        <IMG 
      onclick=light() alt=�o���r src="pic/glow.gif" border=0> 
        <IMG onclick=ying() alt=���v�r 
      src="pic/shadow.gif" border=0> 
        <IMG 
      onclick=image() alt=�Ϥ� src="pic/image.gif" border=0> 
        <IMG onclick=Cswf() alt=Flash�Ϥ� 
      src="pic/swf.gif" border=0> 
        <IMG onclick=Cdir() alt=Shockwave��� src="pic/Shockwave.gif" border=0> 
        <IMG onclick=Crm() alt=realplay���T��� 
      src="pic/rm.gif" border=0> 
        <IMG onclick=Cwmv() alt="Media Player���T���" src="pic/mp.gif" border=0><br><br>&nbsp;��r�j�p�G<select onchange=ybbsize(this.options[this.selectedIndex].value) name=a style="font-size: 9pt"><OPTION value=1>1</OPTION><OPTION value=2>2</OPTION><OPTION value=3>3</OPTION><OPTION value=4>4</OPTION></SELECT> <span lang=zh-cn>�C��G<select onchange=COLOR(this.options[this.selectedIndex].value) name="111" style="font-size: 9pt"><option style='COLOR:000000;BACKGROUND-COLOR:000000' value=000000>�¦�</option><option style='COLOR:FFFFFF;BACKGROUND-COLOR:FFFFFF' value=FFFFFF>�զ�</option><option style='COLOR:008000;BACKGROUND-COLOR:008000' value=008000>���</option><option style='COLOR:800000;BACKGROUND-COLOR:800000' value=800000>�Ŧ�</option><option style='COLOR:808000;BACKGROUND-COLOR:808000' value=808000>���V��</option><option style='COLOR:000080;BACKGROUND-COLOR:000080' value=000080>�`�Ŧ�</option><option style='COLOR:800080;BACKGROUND-COLOR:800080' value=800080>����</option><option style='COLOR:808080;BACKGROUND-COLOR:808080' value=808080>�Ǧ�</option><option style='COLOR:FFFF00;BACKGROUND-COLOR:FFFF00' value=FFFF00>����</option><option style='COLOR:00FF00;BACKGROUND-COLOR:00FF00' value=00FF00>�L���</option><option style='COLOR:00FFFF;BACKGROUND-COLOR:00FFFF' value=00FFFF>�L�Ŧ�</option><option style='COLOR:FF00FF;BACKGROUND-COLOR:FF00FF' value=FF00FF>������</option><option style='COLOR:C0C0C0;BACKGROUND-COLOR:C0C0C0' value=C0C0C0>�ȥզ�</option><option style='COLOR:FF0000;BACKGROUND-COLOR:FF0000' value=FF0000>����</option><option style='COLOR:0000FF;BACKGROUND-COLOR:0000FF' value=0000FF>�Ŧ�</option><option style='COLOR:008080;BACKGROUND-COLOR:008080' value=008080>�ź��</option></select><br><br>
  &nbsp;<textarea onkeydown=presskey(); rows=10 name=body cols=79 Title='�� Ctrl+Enter �����o�e'></textarea><table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" height="30">
          <tr>
            <td>
            &nbsp;�I���ϼд��J���G</td>
            <td>
            <A href=javascript:emoticon('{f1)')><IMG alt=���y src=face/xl.gif border=0></A> <A href=javascript:emoticon('{f2)')><IMG alt=�}�f���y src=face/kk.gif border=0></A> <A href=javascript:emoticon('{f3)')><IMG alt=��Y�����y src=face/jy.gif border=0></A> <A href=javascript:emoticon('{f4)')><IMG alt=�R�ޯ��y src=face/ts.gif border=0></A> <A href=javascript:emoticon('{f5)')><IMG alt=�w���L�� src=face/zy.gif border=0></A> <A href=javascript:emoticon('{f6)')><IMG alt=���L���y src=face/ng.gif border=0></A> <A href=javascript:emoticon('{f7)')><IMG alt=�x�b�����y src=face/kh.gif border=0></A> <A href=javascript:emoticon('{f8)')><IMG alt=���檺�y src=face/sw.gif border=0></A> <a href=javascript:emoticon('{f9)')><IMG alt=���������y src=face/gg.gif border=0></a>

            </td>
          </tr>
        </table>
<br>
&nbsp;<input type=submit value=OK_�n�F�I�o���l name=B1>&nbsp; <input type=reset value=NO_����I�ڭn���g name=B2> [��  Ctrl+Enter �����o�e]<br><br>
        
      </td>
    </tr>  </table>
  </center>
</div></form><!--#include file="down.asp"-->
<%end if%>