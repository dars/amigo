<!--#include file="up.asp"-->
<br><br><%
t1="<div align=center><center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><td width=50% background=pic/5.gif><img border=0 src=pic/9.gif align=absbottom><font color=#FFFFFF><b>"
t2="</b></font></td><td width=50% background=pic/7.gif><img border=0 src=pic/6.gif></td></tr></table></center></div>"
d1="<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% ><P style='MARGIN: 15px'>"
d2="</p></td></tr></table></center></div>"
menu=request.querystring("menu")
select case menu
case""
%><form method=POST name=kbbs action=?menu=get>
<%=t1%>重 設 密 碼<%=t2%>
<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="<%=c1%>" width="94%">
    <tr>
      <td width="40%"><p style="margin: 10">請輸入你的用戶名</p></td>
      <td width="60%">&nbsp;<input type="text" name="name" size="20"></td>
    </tr>
    <tr>
      <td><p style="margin: 10">請輸入你的備用密碼</p></td>
      <td>&nbsp;<input type="password" name="anhao" size="20"></td>
    </tr>
    <tr>
      <td colspan="2" align="center" background="pic/8.gif" height="28">
      <input type="submit" value=" 送 出 " name="B1">
      <input type="reset" value=" 重 置 " name="B2"></td>
    </tr>
    </table>
  </center>
</div>
</form>
<%case"get"
name=Replace(Request.Form("name"),"'","''")
anhao=Replace(Request.Form("anhao"),"'","''")
set pwd=myconn.execute("select name from user where name='"&name&"' and anhao='"&anhao&"'")
if pwd.eof then
%><%=t1%>錯 誤 訊 息<%=t2&d1%><p style="margin: 10">·你填寫的信息錯誤·
<a href="javascript:history.go(-1)"> <img border="0" src="pic/re.gif"> 返 回</a></p><%=d2%><%else
myconn.execute("update user set password='"&anhao&"' where name='"&name&"'")
myconn.execute("update admin set password='"&anhao&"' where name='"&name&"'")
%><%=t1%>更 改 成 功<%=t2&d1%><p style="margin: 10">·<b><%=kbbs(name)%></b> 的密碼已經更改為備用密碼·</p><%=d2%><%end if%><%end select%><br><!--#include file="down.asp"-->