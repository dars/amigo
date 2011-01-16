<!--#include file="conn.asp"-->
<body topmargin="0" leftmargin="0"><style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%" bordercolor=<%=c1%>>
  <tr>
    <td width="100%" height="28" background="pic/8.gif" align="center">
    <b><font color="#FFFFFF">論壇後台管理系統</font></b></td>
  </tr>
  </table><br>
<link rel="stylesheet" type="text/css" href="css.css">
<%
set bbs=myconn.execute("select*from bbsinfo")
c1=bbs(1)
c2=bbs(2)
set bbs=nothing
t1="<div align=center><center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><td width=50% background=pic/5.gif><img border=0 src=pic/9.gif align=absbottom><font color=#FFFFFF><b>"
t2="</b></font></td><td width=50% background=pic/7.gif><img border=0 src=pic/6.gif></td></tr></table></center></div>"
d1="<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% >"
d2="</td></tr></table></center></div>"%>
<%lgname=Request.Cookies("lgname")
lgpwd=Request.Cookies("lgpwd")
set can=myconn.execute("select*from admin where name='"&lgname&"' and password='"&lgpwd&"' and bd='70767766'")
if can.eof or can.bof then
%>

<br><br><%=t1%>權限不夠！<%=t2&d1%>你沒有權限訪問該頁！！<br>你正在論壇使用的用戶：<b><%=lgname%></b>沒有版主的權限，或者密碼錯誤！<br>請使用具有版主權限的用戶<a target="_self" href="login.asp"><font color="#0033CC">登陸本論壇</font></a>
<%=d2%>
<%else%>
<%myconn.close
set myconn=nothing%><%
select case Request("menu")
case "bakbf"
set MyFileObject=Server.CreateOBject("Scripting.FileSystemObject")
MyFileObject.CopyFile ""&Server.MapPath(Request("yl"))&"",""&Server.MapPath(Request("bf"))&""
%><%=t1%>備份完成！<%=t2&d1%><P style='MARGIN: 5px'>·備份完成·</p><%=d2%>
<%case "bakhf"
set MyFileObject=Server.CreateOBject("Scripting.FileSystemObject")
MyFileObject.CopyFile ""&Server.MapPath(Request("bf"))&"",""&Server.MapPath(Request("yl"))&""
%><%=t1%>恢復完成！<%=t2&d1%><P style='MARGIN: 5px'>·恢復完成·</p><%=d2%>

<%case "yasuo"%>
<%
if instr(Request.ServerVariables("http_referer"),""&Request.ServerVariables("server_name")&"") = 0 then
response.write ""&t1&"來源錯誤！"&t2&""&d1&"<P style='MARGIN: 5px'>來源錯誤！<a href=javascript:history.go(-1)>返回</a></p>"&d2&""
response.end
end if
Const JET_3X = 4
Function CompactDB(dbPath, boolIs97)
Dim fso, Engine, strDBPath
strDBPath = left(dbPath,instrrev(DBPath,"\"))
Set fso = CreateObject("Scripting.FileSystemObject")
If fso.FileExists(dbPath) Then
Set Engine = CreateObject("JRO.JetEngine")
Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbpath, _
"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb"
fso.CopyFile strDBPath & "temp.mdb",dbpath
fso.DeleteFile(strDBPath & "temp.mdb")
Set fso = nothing
Set Engine = nothing
CompactDB = ""&t1&"壓縮完成！"&t2&""&d1&"<P style='MARGIN: 5px'>壓縮完成！<a href=javascript:history.go(-1)>返回</a></p>"&d2&""
Else
CompactDB = ""&t1&"壓縮失敗！"&t2&""&d1&"<P style='MARGIN: 5px'>找不到資料庫！請檢查資料庫路徑是否輸入錯誤！<a href=javascript:history.go(-1)>返回</a></p>"&d2&""
End If
End Function
Dim dbpath,boolIs97
dbpath = request("dbpath")
boolIs97 = request("boolIs97")
If dbpath <> "" Then
dbpath = server.mappath(dbpath)
response.write(CompactDB(dbpath,boolIs97))
End If
%>
<%
end select
%>
<form action=?menu=yasuo method="POST">
<%=t1%>壓縮資料庫<%=t2&d1%><P style='MARGIN: 5px'>壓縮的資料庫路徑： 
<input size="30" name="dbpath" value="db\═6k═.mdb"></p><P style='MARGIN: 5px'><input type="submit" value=" 壓 縮 " name="Submit"></p><%=d2%>
</form><br>
<form action=?menu=bakbf method="POST">
<%=t1%>備份資料庫<%=t2&d1%><P style='MARGIN: 5px'>原來的資料庫路徑：
<input size="30" value="db\═6k═.mdb" name="yl"></p>
  <P style='MARGIN: 5px'>備份的資料庫路徑： <input size="30" value="db\bak6k.mdb" name="bf"></p>
  <P style='MARGIN: 5px'><input type="submit" value=" 備 份 " name="Submit1"></p>
    <%=d2%>
</form>
<br>
<form action=?menu=bakhf method="POST">
<%=t1%>恢複數據庫<%=t2&d1%><P style='MARGIN: 5px'>備份的資料庫路徑：
<input size="30" value="db\bak6k.mdb" name="bf"> </p>
  <P style='MARGIN: 5px'>原來的資料庫路徑： <input size="30" value="db\═6k═.mdb" name="yl"></p>
  <P style='MARGIN: 5px'><input type="submit" value=" 恢 復 " name="Submit"></p>
    <%=d2%>
</form><%end if%>