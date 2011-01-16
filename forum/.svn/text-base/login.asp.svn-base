<!--#include file="conn.asp"--><%comeurl=Request.ServerVariables("HTTP_REFERER")
action=request.querystring("action")
select case action
case"exit"
myconn.execute("delete*from online where name='"&request.cookies("lgname")&"'")
Response.Cookies("lgname")=""
Response.Cookies("lgpwd")=""
myconn.close
set myconn=nothing%>
<!--#include file="up.asp"-->
<%response.write"<br><br><div align=center><center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><td width=50% background=pic/5.gif><img border=0 src=pic/9.gif align=absbottom><font color=#FFFFFF><b>退出論壇</b></font></td><td width=50% background=pic/7.gif><img border=0 src=pic/6.gif></td></tr></table></center></div><div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% ><P style='MARGIN: 10px'>·已經完成的退出論壇·</p><P style='MARGIN: 10px'>·<a href=index.asp>進入論壇首頁</a>·</p></td></tr></table></center></div>"
case""%><!--#include file="up.asp"-->
<%response.write"<br><br><form method='POST' name='login' action='bbselse.asp'><div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='"&c1&"' width='94%'><tr><td width='180' background='pic/5.gif'><img border='0' src='pic/9.gif' align='absbottom'><font color='#FFFFFF'><b>論 壇 登 陸</b></font></td><td background='pic/7.gif'><img border='0' src='pic/6.gif'></td></tr></table></center></div>"&_
"<div align='center'><center><table border='1' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='"&c1&"' width='94%'><tr><td width='30%' height='30'>&nbsp;請輸入您的用戶名</td><td width='70%'> &nbsp;<input type=text name=lgname size=20> <a href=zhuce.asp>沒有註冊？</a></td></tr><tr><td height='30'>&nbsp;請輸入您的密碼</td><td>&nbsp;<input type=password name=lgpwd size=20> <a href=getpwd.asp> 忘記密碼？</a></td></tr>"&_
"<tr><td height='80'>&nbsp;<font color=#000000><b>Cookie 選項</b><br>&nbsp;請選擇你的 Cookie 保存時間，<br>&nbsp;下次訪問可以方便輸入。</font></td><td><font color=#000000><input type=radio CHECKED value=j0 name=Cook>不保存，關閉瀏覽器就失效<br><input type=radio value=j1 name=Cook>保存一天<br><input type=radio value=j30 name=Cook>保存一月<br><input type=radio value=j365 name=Cook>保存一年<input type='hidden' name='comeurl' size='30' value='"&comeurl&"'></font></td></tr><tr><td colspan='2' background='pic/8.gif' height='26' align='center'> <input type='submit' value=' 登  陸 ' name='B1'></td></tr></table></center></div></form>"%>
<%end select%><br><!--#include file="down.asp"-->