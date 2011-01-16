<!--#include file="up.asp"-->
<%re=request.querystring("re")
riqi=now()
name=Replace(Request.Form("name"),"'","''")
password=Replace(Request.Form("password"),"'","''")
body=Replace(Request.Form("body"),"'","''")
face=request.form("face")
if face="" then
face="re"
end if

select case re


case"no"

gonggao=request.form("gonggao")
zhuti=Replace(Request.Form("zhuti"),"'","''")
set rs=myconn.execute("SELECT*FROM user where name='"&name&"'and password='"&password&"'")
if rs.eof and rs.bof or zhuti="" or body="" then
noyes="發 帖 失 敗 ！"
mes="<meta http-equiv=refresh content=4;url=javascript:history.go(-1)><font color="&c1&">&nbsp;<b>對不起！你不能完成地發出帖子！！！可能存在以下問題：</b></font><br>· 你並沒有填寫主題或主要內容！<br>· 你填寫的名字或密碼錯誤！<br>· 如果你還沒有註冊一個用戶，請<a href=zhuce.asp><font color=#000080>立即註冊</font></a>！<br><br>"
else
select case gonggao
case"4"
if rs("qian")<1000 or rs("jingyan")<200 or rs("meili")<200 then
mes="<meta http-equiv=refresh content=4;url=javascript:history.go(-1)><font color="&c1&">&nbsp;<b>對不起！你不能完成地發出帖子！</b></font><br>· 你的金錢、魅力、經驗中有某一項或多項不足夠發廣告帖！"
cangg="no"
else
cangg="yes"
if admin<>"yes" then
myconn.execute("update [user] set qian=qian-1000,meili=meili-200,jingyan=jingyan-200 WHERE name='"&name&"'")
end if
end if
case"0"
cangg="yes"
case"1"
if admin="yes" then
cangg="yes"
else
cangg="no"
end if
end select
if cangg="yes" then
myconn.execute("insert into min(zhuti,name,body,riqi,face,bd,orders,gonggao,editriqi)VALUES('"&zhuti&"','"&name&"','"&body&"','"&riqi&"','"&face&"',"&bd&",'"&riqi&"','"&gonggao&"','"&riqi&"')")
myconn.execute("update [user] set qian=qian+200,meili=meili+30,jingyan=jingyan+30 WHERE name='"&name&"'")
set seeme=myconn.execute("select top 1 id from min order by id desc")
fid=seeme("id")
set seeme=nothing
noyes="發 帖 成 功 ！"
mes="<meta http-equiv=refresh content=3;url=show.asp?id="&fid&"&bd="&bd&"><font color="&c1&"><b>&nbsp;發表完成----如果你不點擊下面的連結，將在 3 秒後自動跳轉到  <a href=show.asp?id="&fid&"&bd="&bd&">你所發的帖的頁面！</a></b></font><br>· <a href=list.asp?bd="&bd&">"&wz&"</a><br>· <a href=index.asp>"&tl&"</a><br><br>"
end if
end if
set rs=nothing


case"yes"

set rs=myconn.execute("SELECT*FROM user where name='"&name&"'and password='"&password&"'")
if rs.eof or rs.bof or body="" then
noyes="回 復 失 敗 ！"
mes="<meta http-equiv=refresh content=4;url=javascript:history.go(-1)><font color="&c1&">&nbsp;<b>對不起！你不能完成地回覆帖子！！！可能存在以下問題：</b></font><br>· 你並沒有填寫主要內容！<br>· 你填寫的名字或密碼錯誤！<br>· 如果你還沒有註冊一個用戶，請<a href=zhuce.asp><font color=#000080>立即註冊</font></a>！<br><br>"
else
id=request.querystring("id")
myconn.execute("insert into min(name,body,riqi,bd,orders,bid,face,editriqi)VALUES('"&name&"','"&body&"','"&riqi&"',"&bd&",'"&riqi&"',"&id&",'"&face&"','"&riqi&"')")
myconn.execute("update min set orders='"&riqi&"' where id="&id&"")
myconn.execute("update [user] set qian=qian+100,meili=meili+15,jingyan=jingyan+15 WHERE name='"&name&"'")
noyes="回 復 成 功 ！"
mes="<meta http-equiv=refresh content=3;url=show.asp?id="&id&"&bd="&bd&"><font color="&c1&"><b>&nbsp;回覆完成----如果你不點擊下面的連結，將在 3 秒後自動跳轉到 <a href=show.asp?id="&id&"&bd="&bd&">你所回覆的帖的頁面！</a></b></font><br>· <a href=list.asp?bd="&bd&">"&wz&"</a><br>· <a href=index.asp>"&tl&"</a><br><br>"
end if
end select
set ty=myconn.execute("select nyr from bbsinfo")
myconn.execute("update bbsinfo set todaynum=todaynum+1")
%><br><!--#include file="mes.asp"--><br><!--#include file="down.asp"-->