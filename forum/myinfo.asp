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
<%=t1%>錯 誤 訊 息<%=t2&d1%>·你還沒有登陸或者你登陸的用戶名或密碼錯誤！·<%=d2%><%
response.end
end if
%>
<form method="POST" action="chinfo.asp" name="form">
<%=t1%>我的個人資料<%=t2%>
<div align="center">
  <center>
<table border="1" cellpadding="0" cellspacing="0" style="border-width:1; border-collapse: collapse" bordercolor="<%=c1%>" width="94%">
<tr>
<td colspan="2" height="22" background="pic/0.gif">&nbsp;<b><font color="<%=c1%>">●必填資料：</font></b></td>
</tr>
<tr>
<td>
<%=sty%><b>用戶名</b>：<br>註冊用戶名不能超過20個字元（10個中文字）</td>
<td width="50%">&nbsp;<b><%=kbbs(lgname)%></b></td>
</tr>
<tr>
<td><%=sty%>
<b>密碼(最多20位)</b>：<br>請不要使用任何類似 '*'、' ' 或 HTML 字元</td>
<td>&nbsp;<input type="password" name="newpwd" size="30" maxlength="20" value="<%=canl("password")%>"></td>
</tr>
<tr>
<td><%=sty%><b>重複密碼(最多20位)</b>：<br>請再輸一遍確認</td>
<td>&nbsp;<input type="password" name="repwd" size="30" maxlength="20" value="<%=canl("password")%>"></td>
</tr>
<tr>
<td><%=sty%><b>Email地址</b>：<br>請輸入有效的郵件地址，這將使您能用到論壇中的所有功能</td>
<td>&nbsp;<input type="text" name="email" size="30" maxlength="30" value="<%=canl("email")%>"></td>
</tr>
<tr>
<td><%=sty%><b>備用密碼：</b><br>請牢記！忘記密碼時可以用這個來充當密碼！</td>
<td>&nbsp;<input type="text" name="anhao" size="30" maxlength="30" value="<%=canl("anhao")%>"></td>
</tr>
<tr>
<td colspan="2" height="22" background="pic/0.gif"><b>
    &nbsp;<font color="<%=c1%>">●選填資料：</font></b></td>
</tr>
<tr>
<td><%=sty%><b>性別：</b></td>
<td>&nbsp;<select size="1" name="sex" style="font-size: 9pt; border: 1px solid <%=c1%>; background-color: #FFFFEC">
        <%if canl("sex")="1" then%><option selected value="1">男</option>
        <option value="2">女</option><%else%><option selected value="2">女</option>
        <option value="1">男</option><%end if%></select></td>
</tr>
<tr>
<td><%=sty%><b>生日：</b>（請按照1900-1-1格式填寫）</td>
<td>&nbsp;<input type="text" name="burn" size="21" maxlength="10" value="<%=canl("burn")%>"></td>
</tr>
<tr>
<td><%=sty%><b>首頁：</b><br>填寫你的個人首頁，讓大家見識見識！</td>
<td>&nbsp;<input type="text" name="home" size="30" maxlength="40" value="<%=canl("home")%>"></td>
</tr>
<tr>
<td><%=sty%><B>OICQ號碼</B>：<BR>填寫您的QQ地址，方便與他人的聯繫</td>
<td>&nbsp;<input type="text" name="qq" size="16" maxlength="10" value="<%=canl("qq")%>"></td>
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
<td>&nbsp;<input name="mypic" size=38 maxlength=100 value="<%=canl("toupic")%>"> 完整Url地址<br>&nbsp;圖像寬度：<input type="text" name="ku" size="6" value="<%=canl("ku")%>"> 高度： <input type="text" name="ch" size="6" value="<%=canl("ch")%>">（都不能大於120）</td>
</tr>
<tr>
<td valign="top" height="80"><%=sty%><B>個性簽名</B>：<BR>最多255個字元<BR>文字將出現在您發表的文章的結尾處。體現您的個性。</td>
<td>&nbsp;<TEXTAREA name=gxqm rows=5 wrap=PHYSICAL cols=60><%=canl("gxqm")%></TEXTAREA></td>
</tr>
<tr>
<td colspan="2" height="30" align="center">
<input type=submit value=我修改了，現在提交！ name=Submit>&nbsp;&nbsp; <input type=reset value=不行，還是重寫吧！ name=Submit2></td>
</tr>
</table></center>
</div></form>
<br><!--#include file="down.asp"-->