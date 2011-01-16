<title>論壇管理</title><link rel="stylesheet" type="text/css" href="css.css">
<!--#include file="conn.asp"--><%
lgname=Request.Cookies("lgname")
lgpwd=request.cookies("lgpwd")
set cjbz=myconn.execute("select name from admin where name='"&lgname&"' and password='"&lgpwd&"' and bd='70767766'")
if cjbz.eof then
noyes="登 陸 失 敗 ！"
mes="你不能進入後台管理。<br>·你現在登陸論壇的用戶名 "&lgname&" 不是管理員。·"%>
<!--#include file="mes.asp"-->
<%response.end
else%>
<frameset cols="20%,*" framespacing="0" border="0" frameborder="0">
  <frame name="left" src="admin-left.asp" scrolling="auto" target="right">
  <frame name="right" src="admin-right.asp" scrolling="auto" noresize>
  <noframes>
  <body>

  <p>此網頁使用了框架，但您的瀏覽器不支援框架。</p>

  </body>
  </noframes>
</frameset>
<%
end if
%>