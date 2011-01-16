<%picnum=20%><style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>
<%sty="<p style='line-height: 150%; margin-left: 4; margin-top: 4'>"%>
<!--#include file="up.asp"-->
<br><br><%
action=request.querystring("action")
if action<>"agree" then
noyes="服務條款和聲明"
mes="<b>繼續註冊前請先閱讀論壇協議</b><br>歡迎您加入本站點參加交流和討論，本站點為公共論壇，為維護網上公共秩序和社會穩定，請您自覺遵守以下條款：<br><br>一、不得利用本站危害國家安全、洩露國家秘密，不得侵犯國家社會集體的和公民的合法權益，不得利用本站製作、複製和傳播下列信息： <br>（一）煽動抗拒、破壞憲法和法律、行政法規實施的；<br>（二）煽動顛覆國家政權，推翻社會主義制度的；<br>（三）煽動分裂國家、破壞國家統一的；<br>（四）煽動民族仇恨、民族歧視，破壞民族團結的；<br>（五）捏造或者歪曲事實，散佈謠言，擾亂社會秩序的；<br>（六）宣揚封建迷信、淫穢、色情、賭博、暴力、兇殺、恐怖、教唆犯罪的；<br>（七）公然侮辱他人或者捏造事實誹謗他人的，或者進行其他惡意攻擊的；<br>（八）損害國家機關信譽的；<br>（九）其他違反憲法和法律行政法規的；<br>（十）進行商業廣告行為的。<br>二、互相尊重，對自己的言論和行為負責。<form method=POST action='?action=agree'><center><input type=submit value=' 我 同 意 ' name=B1></center></form>"
%><!--#include file="mes.asp"--><%else%>
<form method="POST" action="reg.asp" name="form">
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-width:0; border-collapse: collapse" bordercolor="#111111" width="94%">
    <tr>
      <td width="200" background="pic/5.gif">
      <img border="0" src="pic/9.gif" align="absbottom"><font color="#FFFFFF"><b>新 用 戶 注 冊</b></font></td>
      <td background="pic/7.gif"><img border="0" src="pic/6.gif"></td>
    </tr>
  </table>
  </center>
</div>
<div align="center">
  <center>
<table border="1" cellpadding="0" cellspacing="0" style="border-width:1; border-collapse: collapse" bordercolor="<%=c1%>" width="94%">
<tr>
<td colspan="2" height="22" background="pic/0.gif">&nbsp;<b><font color="<%=c1%>">●必填資料：</font></b></td>
</tr>
<tr>
<td>
<%=sty%><b>用戶名</b>：<br>註冊用戶名不能超過20個字元（10個中文字）</td>
<td width="50%">&nbsp;<input type=text name=name size=30 maxlength=20></td>
</tr>
<tr>
<td><%=sty%>
<b>密碼(最多20位)</b>：<br>請不要使用任何類似 '*'、' ' 或 HTML 字元</td>
<td>&nbsp;<input type=password name=password size=30 maxlength=20></td>
</tr>
<tr>
<td><%=sty%><b>重複密碼(最多20位)</b>：<br>請再輸一遍確認</td>
<td>&nbsp;<input type=password name=repassword size=30 maxlength=20></td>
</tr>
<tr>
<td><%=sty%><b>Email地址</b>：<br>請輸入有效的郵件地址，這將使您能用到論壇中的所有功能</td>
<td>&nbsp;<input type=text name=email size=30 maxlength=30></td>
</tr>
<tr>
<td><%=sty%><b>備用密碼：</b><br>請牢記！忘記密碼時可以用這個來充當密碼！</td>
<td>&nbsp;<input type=text name=anhao size=30 maxlength=30></td>
</tr>
<tr>
<td colspan="2" height="22" background="pic/0.gif"><b>
    &nbsp;<font color="<%=c1%>">●選填資料：</font></b></td>
</tr>
<tr>
<td><%=sty%><b>性別：</b></td>
<td>&nbsp;<select size=1 name=sex style='font-size: 9pt; border: 1px solid ; background-color: #FFFFEC'><option selected value=1>男</option><option value=2>女</option></select></td>
</tr>
<tr>
<td><%=sty%><b>生日：</b>（請按照1900-1-1格式填寫）</td>
<td>&nbsp;<input type=text name=burn size=21 maxlength=10 value=不告訴你></td>
</tr>
<tr>
<td><%=sty%><b>首頁：</b><br>填寫你的個人首頁，讓大家見識見識！</td>
<td>&nbsp;<input type=text name=home size=30 maxlength=40></td>
</tr>
<tr>
<td><%=sty%><B>OICQ號碼</B>：<BR>填寫您的QQ地址，方便與他人的聯繫</td>
<td>&nbsp;<input type=text name=qq size=16 maxlength=10></td>
</tr>
<tr>
<td valign="top"><%=sty%><b>我的頭像：</b><br>使用論壇自帶的圖像</td>
<td>
<p style="margin-top: 3; margin-bottom: 3">&nbsp;<select name=headpic size=1 onChange="showimage()" style="font-size: 9pt">
<%for i=1 to picnum%>
<option value=<%=i%>><%=i%></option>
<%next%>
</select><img src="headpic/1.gif" name="tus"><script>function showimage(){document.images.tus.src="headpic/"+document.form.headpic.options[document.form.headpic.selectedIndex].value+".gif";}</script> <br>
</td>
</tr>
<tr>
<td><%=sty%><B>自定義頭像</B>：<br>如果圖像位置中有連結圖片將以自定義的為主</td>
<td>&nbsp;<input name=mypic size=38 maxlength=100> 完整Url地址<br>&nbsp;圖像寬度：<input type=text name=ku size=6> 高度： <input type=text name=ch size=6>（都不能大於120）</td>
</tr>
<tr>
<td valign="top" height="80"><%=sty%><B>個性簽名</B>：<BR>最多255個字元<BR>文字將出現在您發表的文章的結尾處。體現您的個性。</td>
<td>&nbsp;<TEXTAREA name=gxqm rows=5 wrap=PHYSICAL cols=60></TEXTAREA></td>
</tr>
<tr>
<td colspan="2" height="30" align="center"><input type=submit value=我填好了，現在註冊！ name=Submit>&nbsp;&nbsp; <input type=reset value=不行，還是重寫吧！ name=Submit2></td>
</tr>
</table></center>
</div></form><%end if%><br><!--#include file="down.asp"-->