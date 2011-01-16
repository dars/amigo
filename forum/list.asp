<%find=Replace(Request.Form("find"),"'","''")
if find<>"" then
response.cookies("find")=find
end if
search=request.querystring("search")
mybbs=request.querystring("mybbs")
pai=request.querystring("pai")
if pai="" then
pai="orders"
end if%>
<!--#include file="up.asp"-->
<%
response.write"<style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style><script language='javascript'>function Check(){var Name=document.form.topage.value;document.location='?bd="&bd&"&topage='+Name+'';}</script>"
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
noyes="進 入 失 敗 ！"
mes="<font color="&c1&"><b>你不能完成的進入該版面，可能存在以下問題：</b></font><br>● 該版面為認證論壇，你還沒有得版主的認證！<br> ● 你還沒有<a href=login.asp>登陸</a>！<br><br>"
response.write"<br>"%><!--#include file="mes.asp"--><%response.end
else
response.write"<div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111' width='94%' height='42'><tr><td width='68%'><a target='_self' href='say.asp?bd="&bd&"&re=no'><img border=0 src=pic/fabiao.gif align='middle'></a></td><td width='32%' align='right' valign='bottom'><p style='margin-right: 4; margin-bottom: 3'><a href='?bd="&bd&"&mybbs="&lgname&"'>查看我的帖子</a></td></tr></table></center></div>"&_
"<div align='center'><center><table width='94%' height=26 cellpadding=0 style='border-collapse: collapse; border-left-width:1px; border-right-width:1px; border-top-width:1px' bordercolor='"&c1&"' cellspacing='0'><tr><td width='76%' height='21' style='border-left-style: solid; border-left-width: 1; border-top-style: solid; border-top-width: 1'><p style='margin-left: 5'><img align=absmiddle src=pic/gonggao.gif> <b>公告：</b>"
goga=1
set showgg=myconn.execute("select*from min where bd="&bd&" and gonggao=4 order by id desc")
if showgg.eof and showgg.bof then
else
response.write"<marquee onmouseover=this.stop() onmouseout=this.start() scrollAmount=2  width='86%'>"
do while not showgg.eof
response.write"<img src='pic/tl.gif' align='absmiddle'> <a href=show.asp?id="&showgg("id")&"&bd="&bd&"><font color="&c1&">"&kbbs(showgg("name"))&"</font> 說："&kbbs(showgg("zhuti"))&"</a>"
goga=goga+1
if goga>10 then exit do
showgg.movenext
loop
response.write"</marquee>"
end if
showgg.close
set showgg=nothing
response.write"</td><td style='border-right-style:solid; border-right-width:1px; border-top-style:solid; border-top-width:1px' bordercolor="&c1&" align='right' width=$1><p style='margin-left: 4'><p style='margin-right: 3; margin-top: 1; margin-bottom: 1'><img border='0' src='pic/fl.gif'> "
q1=1
set body1=myconn.execute("SELECT*FROM admin where bd='"&bd&"'")
if body1.eof and body1.bof then
response.write"本版誠聘版主！"
else
response.write"<select size=1 name=D1 style='font-size: 9pt'><option>論壇版主</option><option>———</option>"
do while not body1.eof
response.write"<option>"&kbbs(body1("name"))&"</option>"
q1=q1+1
if q1>4 then exit do
body1.movenext
Loop
response.write"</select>"
end if
body1.Close
set body1=nothing
response.write"</td></tr></table></center></div>"
dim rs
dim sql
set rs = server.createobject("adodb.recordset")
if search="" and mybbs="" then
href1="<a href=?topage=1&bd="&bd&">"
href3="<a href=?topage="&TotalPage&"&bd="&bd&">"
sql = "select * from min where bid=0 and bd="&bd&" and gonggao<>1 and gonggao<>4 order by gonggao desc,"&pai&" desc"
count=myconn.execute("select count(*)from min where bid=0 and bd="&bd&" and gonggao<>1 and gonggao<>4")(0)
end if
if search="yes" and mybbs="" then
href1="<a href=?topage=1&search=yes&bd="&bd&">"
href3="<a href=?topage="&TotalPage&"&search=yes&bd="&bd&">"
find=request.cookies("find")
sql = "select * from min where (zhuti like '%" &find& "%' or name like '%" &find& "%' or body like '%" &find& "%') and bid=0 and bd="&bd&" and gonggao<>1 and gonggao<>4 order by riqi desc"
count=myconn.execute("select count(*) from min where (zhuti like '%" &find& "%' or name like '%" &find& "%' or body like '%" &find& "%') and bid=0 and bd="&bd&" and gonggao<>1 and gonggao<>4")(0)
end if
if mybbs<>"" and search="" then
href1="<a href=?topage=1&mybbs="&mybbs&"bd="&bd&">"
href3="<a href=?topage="&TotalPage&"&mybbs="&mybbs&"&bd="&bd&">"
sql = "select * from min where bid=0 and bd="&bd&" and name='"&mybbs&"' and gonggao<>1 and gonggao<>4 order by gonggao desc,"&pai&" desc"
count=myconn.execute("select count(*) from min where bid=0 and bd="&bd&" and name='"&mybbs&"' and gonggao<>1 and gonggao<>4")(0)
end if
on error resume next
pagesetup=20
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
response.write"<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse:collapse; border-left-width:1px; border-right-width:1px; border-top-width:1px' bordercolor="&c1&" width='94%' id=AutoNumber5 height='27'><tr><td width=4% align=center background='pic/8.gif'><b><font color='#FFFFFF'>狀態</font></b></td><td width=42% align=center background='pic/8.gif'><b><a target=_self href=list.asp?bd="&bd&"&pai=zhuti><font color='#FFFFFF'>主 題</font></a><font color='#FFFFFF'> ( 點小圖標在新窗口瀏覽 )</font></b></td>"&_
"<td width=9% align=center background='pic/8.gif'><b><a target=_self href=list.asp?bd="&bd&"&pai=name><font color='#FFFFFF'>作 者</font></a></b></td><td width=9% align=center background='pic/8.gif'><b><font color='#FFFFFF'>回覆/</font><a target=_self href=list.asp?bd="&bd&"&pai=hits><font color='#FFFFFF'>人氣</font></a></b></td><td width=16% align=center background='pic/8.gif'><b><a target=_self href=list.asp?bd="&bd&"><font color='#FFFFFF'>最後更新時間</font></a></b></td><td width=9% align=center background='pic/8.gif'><b><font color='#FFFFFF'>最後回覆</font></b></td></tr></table></center></div>"
i=1
do while not rs.eof
rrzz=kbbs(rs("zhuti"))
set last=myconn.execute("select body,name from min where bid="&rs("id")&" order by id desc")
if last.eof then
zui="-----"
rb=rs("body")
tltltl="帖子內容："&kbbs(rb)&""
else
lb=last("body")
zui="<a href='userinfo.asp?name="&kbbs(last("name"))&"'>"&kbbs(last("name"))&"</a>"
tltltl="最後跟帖："&kbbs(lb)&""
set last=nothing
end if
response.write"<div align=center><center><table width='94%' border=1 cellpadding=0 cellspacing=0 style='TABLE-LAYOUT: fixed; WORD-BREAK: break-all;border-collapse:collapse; border-left-width:1px; border-right-width:1px; border-top-width:1px' bordercolor="&c1&"  id=AutoNumber5><tr><td width=4% height=23 align=center><a target=_blank href=show.asp?id="&rs("id")&"&bd="&bd&"><img border=0 src=face/"&rs("face")&".gif></a></td><td width=42% height=27 align=left onmouseover=javascript:this.bgColor='"&c2&"' onmouseout=javascript:this.bgColor=''>&nbsp;<a  target=_self href=show.asp?id="&rs("id")&"&bd="&bd&" title="&LeftTrue(tltltl,25)&">"&LeftTrue(rrzz,44)&"</a>"
bno1=myconn.execute("select count(name)from min where bid="&rs("id")&"")(0)
if bno1>10 then
response.write" <img align=absmiddle border=0 src=pic/hot.gif>"
end if
response.write"</td><td width=9% height=23 align=center><a href='userinfo.asp?name="&kbbs(rs("name"))&"'>"&kbbs(rs("name"))&"</a></td><td width=9% height=23 align=center>"&bno1&"/"&rs("hits")&"</td><td width=16% height=23 align=center>"&rs("orders")&"</td><td width=9% height=23 align=center>"&zui&"</td></tr></table></center></div>"
i=i+1
if i>pagesetup then exit do
rs.movenext
loop
rs.Close
response.write"<div align='center'><center><TABLE borderColor="&c1&" cellSpacing=0 cellPadding=0 width='94%' border=1 style='border-collapse: collapse; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px'><TBODY><TR height=25><TD height=2><TABLE cellSpacing=0 cellPadding=3 width='100%' border=0 background='pic/8.gif' style='border-collapse: collapse; border-left-width:0; border-top-width:0; border-bottom-width:0'><TBODY><TR><TD><b><font color='#FFFFFF'><img border='0' src='pic/fl.gif'> 本論壇共有</font><font color='#00FFFF'> "&TotalPage&" </font><font color='#FFFFFF'>頁,<font color='#00FFFF'> "&count&" </font>個話題，每頁有<font color='#00FFFF'> "&pagesetup&" </font> 張帖子 >> ["
ii=PageCount-5
iii=PageCount+5
if ii < 1 then
ii=1
end if
if iii > TotalPage then
iii=TotalPage
end if
if PageCount > 6 then
Response.Write ""&href1&"<font color=yellow>1</font></a> ... "
end if
for i=ii to iii
If i<>PageCount then
if search="" and mybbs="" then
href2="<a href=?topage="& i &"&bd="&bd&">"
end if
if search="yes" and mybbs="" then
href2="<a href=?topage="& i &"&search=yes&bd="&bd&">"
end if
if mybbs<>"" and search="" then
href2="<a href=?topage="& i &"&mybbs="&mybbs&"&bd="&bd&">"
end if
Response.Write ""&href2&"<font color=yellow>" & i & "</font></a> "
else
Response.Write " <font color=red><b>"&i&"</b></font> "
end if
next
if TotalPage > PageCount+5 then
Response.Write " ... "&href3&"<font color=yellow>"&TotalPage&"</font></a>"
end if
response.write" ]</font></b></TD><form name=form method='POST' action=javascript:Check()><TD height=2 align='right'><font color='#FFFFFF'>頁碼：<input style=FONT-SIZE:9pt maxLength='6' size='6' name='topage' value='"&PageCount&"'><input style=FONT-SIZE:9pt value='GO!' type='submit'></font></TD></form></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></center></div><br>"
%><!--#include file="line.asp"-->
<%
response.write"<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse:collapse; border-left-width:1px; border-right-width:1px; border-top-width:1px' bordercolor="&c1&" width='94%' height='27' ><tr><td width=100% height='27' background='pic/8.gif'><font color='#FFFFFF'>&nbsp;<b><img border='0' src='pic/tj.gif' align='absmiddle'> 線上統計：</b>目前論壇總共有 <b>"&lineno&"</b> 人線上。其中有 <b>"&usno&"</b> 位會員， <b>"&nusno&"</b> 位遊客。 </font></td></tr></table></center></div>"&_
"<br><div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-width:1; border-collapse:collapse' bordercolor="&c1&" width='94%' height=67><tr><td width=50% height=23 background='pic/8.gif'><img border='0' src='pic/9.gif' align='absbottom'><font color='#FFFFFF'><b>論壇帖子圖例：</b></font></td><td width=50% height=23 background='pic/8.gif'><img border='0' src='pic/9.gif' align='absbottom'><font color='#FFFFFF'><b>論壇搜索：</b></font></td></tr><tr><td width=50% height=41>&nbsp;<img border=0 src=face/top.gif> 固定置頂的帖子 <img border=0 src=face/jing.gif> 精華的帖子 <img border=0 src=pic/hot.gif> 熱門的帖子</td><form method=POST action='list.asp?bd="&bd&"&search=yes' target=_self><td width=50% height=41>&nbsp;查詢字元：<input type=text name=find size=20>  <input type=submit value=提交 name=B1> <input type=reset value=重置 name=B2></td></form></tr></table></center></div>"
%><br><!--#include file="down.asp"--><%end if%>