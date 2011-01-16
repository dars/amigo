<!--#include file="ubbcode.asp"--><!--#include file="up.asp"-->
<%zai=request.querystring("topage")
if zai="" then
zai=1
end if
response.write"<script language='javascript'>function Check(){var Name=document.form.topage.value;document.location='?bd="&bd&"&id="&id&"&topage='+Name+'';}</script>"
if isnull(pass) or pass="" then
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
width="75%"
noyes="進 入 失 敗 ！"
mes="<font color="&c1&"><b>你不能完成的進入該版面，可能存在以下問題：</b></font><br>● 該版面為認證論壇，你還沒有得版主的認證！<br> ● 你還沒有<a href=login.asp>登陸</a>！<br><br>"
response.write"<br>"%><!--#include file="mes.asp"--><%response.end
else
myconn.execute("update min set hits=hits+1 WHERE id="&id&"")
response.write"<div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111' width='94%' height='42'><tr><td width='70%'><a target='_self' href='say.asp?bd="&bd&"&re=no'><img border=0 src=pic/fabiao.gif align='absmiddle'></a> <a href='say.asp?bd="&bd&"&id="&id&"&re=yes'><img border='0' src='pic/back.gif' align='absmiddle'></a></td><td width='30%' align='right' valign='bottom'><img border='0' src='pic/tl.gif'> 你是本帖的第 <b>"&whits+1&"</b> 位閱讀者</td></tr></table></center></div>"
set huati=myconn.execute("select*from user where name='"&wname&"'")
response.write"<div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse; ' width='94%'><tr><td width='100%' background='pic/8.gif' height='26'><font color='#FFFFFF'>&nbsp;<b>『 帖子主題 』："&LeftTrue(wzhuti,50)&"</b></font></td></tr></table></center></div>"&_
"<div align='center'><center><table border='1' cellpadding='0' cellspacing='0' style='TABLE-LAYOUT: fixed; WORD-BREAK: break-all; border-collapse:collapse' bordercolor='"&c1&"' width='94%' height='140'><tr><td width='20%' valign='top'><div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111'><tr><td width='100%'>"&_
"<div align='center'><center><br><table width=$1 style='filter:glow(color="&c1&", strength=1); border-collapse:collapse' bordercolor='#111111' cellpadding='0' cellspacing='0'><font color=black>"&kbbs(wname)&"</font></table><br><img border='0' src="&huati("toupic")&" width="&huati("ku")&" height="&huati("ch")&"></center></div><br>金錢："
q1=huati("qian")
response.write""&q1&"<br>經驗："
j1=huati("jingyan")
response.write""&j1&"<br>魅力："
m1=huati("meili")
response.write""&m1&"<br>帖數："&myconn.execute("select count(name)from min where name='"&wname&"'")(0)&"<br>"
myname=wname
sqltype="my"
response.write"等級："%><!--#include file="upji.asp"-->
<%
response.write"<b>"&dj&"</b><br>『 "&dd&" 』<br></td></tr></table></center></div></td><td width='80%' valign='top'> "
kw=kbbs(wname)
response.write"<table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111' width='97%' height='25'><tr><td width='81%' valign='bottom'>&nbsp;<a href='userinfo.asp?name="&kw&"' title='查看"&kw&"的資料'><img src='pic/info.gif' border='0'> 訊 息</a>&nbsp; <a title='"&kw&"的OICQ號碼："&huati("qq")&"'><SPAN style='CURSOR: hand' ><img border='0' src='pic/oicq.gif'> OICQ</span></a>&nbsp; <a href='mailto:"&huati("email")&"' title='發郵件給"&kw&"'><img border='0' src='pic/mail.gif'> 郵 箱</a>&nbsp; <a target=_blank href='"&kbbs(huati("home"))&"' title='訪問"&kw&"的首頁'><img border='0' src='pic/home.gif'> 主 頁</a>&nbsp; <a href=edit.asp?id="&id&"&ed=1&reid="&id&"&bd="&bd&"><img border='0' src='pic/bmp.gif'> 編 輯</a></td>"
gxqm=huati("gxqm")
set huati=nothing
response.write"<td width='19%' valign='bottom' align='right'>樓 &nbsp; 頂</td></tr></table><hr color='"&c1&"' width='98%' size='1'><blockquote><p style='line-height:15pt'><img src='face/"&wface&".gif'> <b>"&wzhuti&"</b><br>"&ubb(wbody)&"<p></p>"
if wriqi<>weditriqi then
response.write"<div align=right><font color="&c1&">「該帖子被作者在 "&weditriqi&" 編輯過」</font></div>"
end if
if gxqm<>"" then
response.write"<br><div align=right>————————————————————<br>"&ubb(gxqm)&"</div>"
end if
response.write"</blockquote></td></tr><tr><td height='26' align='center'>狀態："
set onoff=myconn.execute("select name from online where name='"&wname&"'")
if onoff.eof then
ooo="offline"
else
ooo="online"
end if
set onoff=nothing
response.write"<img border=0 align=absmiddle src=pic/"&ooo&".gif></td><td><div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111' width='98%'><tr><td width='50%'><img border='0' src='pic/xie.gif'> "&wriqi&"</td><td width='50%' align='right'>"
if wface<>"top" then
ti="置頂該帖子"
ac="top"
gi="top"
else
ti="取消置頂"
ac="nottop"
gi="nottop" 
end if
response.write"<a href='bbsgl.asp?bd="&bd&"&id="&id&"&action="&ac&"' title="&ti&"><img border='0' src='face/"&gi&".gif'></a> "
if wface<>"jing" then
 ti="設該帖為精華帖子"
ac="jh"
gi="jing"
else
ti="取消精華"
ac="notjh"
gi="notjing" 
end if
response.write"<a href='bbsgl.asp?bd="&bd&"&id="&id&"&action="&ac&"' title="&ti&"><img border='0' src='face/"&gi&".gif'></a> <a href='bbsgl.asp?bd="&bd&"&id="&id&"&action=del' title=刪除該帖><img border='0' src='pic/del.gif'></a> <a href='bbsgl.asp?bd="&bd&"&id="&id&"&action=move' title='移動該帖子到別的版面'><img border='0' src='pic/go.gif'></a></td></tr></table></center></div></td></tr></table></center></div>"
set huati=nothing
dim rs
dim sql
set rs = server.createobject("adodb.recordset")
sql = "select*from min where bid=" &id& " order by id"
count=myconn.execute("select count(riqi) from min where bid=" &id& "")(0)
on error resume next
pagesetup=10
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
ai=1
do while not rs.eof
rnn=rs("name")
set back=myconn.execute("select*from user where name='"&rnn&"'")
lou=pagesetup-ai
if lou/2>lou\2 then
bgcl=""&c2&""
else
bgcl="white"
end if
response.write"<div align='center'><center><table  width='94%' bordercolor='#111111' style='border-collapse: collapse; border-width: 0' cellpadding='0' cellspacing='0'><tr><td width=100% height='2'></td></tr></table></center></div>"&_
"<div align='center'><center><table border='1' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='"&c1&"' width='94%' height='150' bgcolor='"&bgcl&"'><tr><td width='20%' valign='top'><div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111'><tr><td>"
response.write"<div align='center'><center><br><table width=$1 style='filter:glow(color="&c1&", strength=1); border-collapse:collapse' bordercolor='#111111' cellpadding='0' cellspacing='0'><font color=black>"&kbbs(rnn)&"</font></table><br><img border='0' src="&back("toupic")&" width="&back("ku")&" height="&back("ch")&"></center></div><br>金錢："
q1=back("qian")
response.write""&q1&"<br>經驗："
j1=back("jingyan")
response.write""&j1&"<br>魅力："
m1=back("meili")
response.write""&m1&"<br>帖數："&myconn.execute("select count(name)from min where name='"&rnn&"'")(0)&"<br>"
myname=rnn
sqltype="my"
response.write"等級："
%><!--#include file="upji.asp"-->
<%
response.write"<b>"&dj&"</b><br>『 "&dd&" 』<br></td></tr></table></center></div>"&_
"</td><td width='80%' valign='top'><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111' width='97%' height='25'><tr><td width='81%' valign='bottom'>&nbsp;<a href='userinfo.asp?name="&rnn&"' title='查看"&rnn&"的資料'><img src='pic/info.gif' border='0'> 訊 息</a>&nbsp; <a title='"&rnn&"的OICQ號碼："&kbbs(back("qq"))&"'><SPAN style='CURSOR: hand' ><img border='0' src='pic/oicq.gif'> OICQ</span></a>&nbsp; <a href='mailto:"&back("email")&"' title='發郵件給"&rnn&"'><img border='0' src='pic/mail.gif'> 郵 箱</a>&nbsp; <a target=_blank href='"&kbbs(back("home"))&"' title='訪問"&rnn&"的首頁'><img border='0' src='pic/home.gif'> 主 頁</a>&nbsp; <a href='edit.asp?id="&rs("id")&"&ed=2&reid="&id&"&bd="&bd&"'><img border='0' src='pic/bmp.gif'> 編 輯</a></td>"
gxqm=back("gxqm")
set back=nothing
response.write"</td><td width='19%' valign='bottom' align='right'>"
if lou>0 then
response.write"<font color='"&c1&"'>"&CHR(64+zai)&"</font> 棟<font color='"&c1&"'> "&lou&"</font> 樓"
else
response.write"<font color='"&c1&"'>"&CHR(64+zai)&"</font> 棟 樓 下"
end if
response.write"</td></tr></table><hr color='"&c1&"' width='98%' size='1'><blockquote><p style='line-height:15pt'><img src='face/"&rs("face")&".gif'>&nbsp;<br>"&ubb(rs("body"))&"<p></p>"
if rs("riqi")<>rs("editriqi") then
response.write"<div align=right><font color="&c1&">「該帖子被作者在 "&rs("editriqi")&" 編輯過」</font></div>"
end if
if gxqm<>"" then
response.write"<br><div align=right>————————————————————<br>"&ubb(gxqm)&"</div>"
end if
response.write"</blockquote></td></tr><tr><td height='26' align='center'>狀態："
set onoff=myconn.execute("select name from online where name='"&rnn&"'")
if onoff.eof then
ooo="offline"
else
ooo="online"
end if
set onoff=nothing
response.write"<img border=0 align=absmiddle src=pic/"&ooo&".gif></td><td><div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111' width='98%'><tr><td width='50%'><img border='0' src='pic/xie.gif'> "&rs("riqi")&"</td><td width='50%' align='right'>"&_
"<a href='bbsgl.asp?bd="&bd&"&id="&rs("id")&"&action=del'><img border='0' src='pic/del.gif'></a></td></tr></table></center></div></td></tr></table></center></div>"
ai=ai+1
if ai>pagesetup then exit do
rs.movenext
loop
rs.Close
response.write"<div align='center'><center><TABLE borderColor="&c1&" cellSpacing=0 cellPadding=0 width='94%' border=1 style='border-collapse: collapse; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px'><TBODY><TR height=25><TD height=2><TABLE cellSpacing=0 cellPadding=3 width='100%' border=0 background='pic/8.gif' style='border-collapse: collapse; border-left-width:0; border-top-width:0; border-bottom-width:0'><TBODY><TR><TD><b><font color='#FFFFFF'><img border='0' src='pic/fl.gif'> 共有</font><font color='#00FFFF'> "&TotalPage&" </font><font color='#FFFFFF'>頁,<font color='#00FFFF'> "&count&" </font><font color='#FFFFFF'>張回覆帖,每頁有<font color='#00FFFF'> "&pagesetup&" </font> 張帖子 >> ["
ii=PageCount-5
iii=PageCount+5
if ii < 1 then
ii=1
end if
if iii > TotalPage then
iii=TotalPage
end if
if PageCount > 6 then
Response.Write "<a href=?topage=1&bd="&bd&"&id="&id&"><font color=yellow>1</font></a> ... "
end if

for i=ii to iii
If i<>PageCount then
Response.Write " <a href=?topage="& i &"&bd="&bd&"&id="&id&"><font color=yellow>" & i & "</font></a> "
else
Response.Write " <font color=red><b>"&i&"</b></font> "
end if
next

if TotalPage > PageCount+5 then
Response.Write " ... <a href=?topage="&TotalPage&"&bd="&bd&"&id="&id&"><font color=yellow>"&TotalPage&"</font></a>"
end if
response.write" ]</font></b></TD><form name=form method='POST' action=javascript:Check()><TD height=2 align='right'><font color='#FFFFFF'>頁碼：<input style=FONT-SIZE:9pt maxLength='6' size='6' name='topage' value='"&PageCount&"'><input style=FONT-SIZE:9pt value='GO!' type='submit'></font></TD></form></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></center></div>"&_
"<SCRIPT>var i=0;function presskey(eventobject){if(event.ctrlKey && window.event.keyCode==13){i++;if (i>1) {alert('帖子正在發出，請耐心等待！');return false;}this.document.re.submit();}}</SCRIPT>"
noyes="快 速 回 復"
mes="<form  method='POST' name=re action='save.asp?bd="&bd&"&id="&id&"&re=yes'><table border=0 cellpadding=0 cellspacing=0' style='border-collapse: collapse' bordercolor='#111111' width='100%'><tr><td width='20%' height=26 bgcolor="&c2&"><b>&nbsp;用戶信息：</b></td><td valign='top' bgcolor="&c2&">用戶名：<input type='text' name='name' size='19' value='"&lgname&"'> <a href=zhuce.asp>沒有註冊？</a> 密&nbsp; 碼：<input type='password' name='password' size='20' value='"&request.cookies("lgpwd")&"'> <a href=getpwd.asp>忘記密碼？</a></td></tr><tr><td width='20%' valign=top><p style='margin-top: 6; margin-left:7'><b>帖子內容：</b><BR><LI><p style='margin-left: 5; '>HTML標籤： 不可用 <LI><p style='margin-left: 5; line-height:150%'>UBB標籤： 可用 <LI><p style='margin-left: 5; line-height:150%'>貼圖標籤： 可用 <LI><p style='margin-left: 5; line-height:150%'>Flash標籤：不可用 <LI><p style='margin-left: 5; line-height:150%'>表情字元轉換：不可用 <LI><p style='margin-left: 5; line-height:150%'>最多15KB<br></td><td valign='top'><textarea onkeydown=presskey(); rows=6 name='body' cols='92' Title='按 Ctrl+Enter 直接發送'></textarea></p><p><input type='submit' value='OK_好了！回覆帖子' name='submit1' tabindex='4'>&nbsp;&nbsp;&nbsp; <input type='reset' value='NO_不行！我要重寫' name='B2'> [按 Ctrl+Enter 直接發送]</td></tr></table></form>"
%><!--#include file="mes.asp"-->
<%response.write"<br>"%>
<!--#include file="down.asp"--><%end if%>