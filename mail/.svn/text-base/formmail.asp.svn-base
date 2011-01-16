<%
name1=Trim(request("name"))
tel=Trim(request("tel"))
mail=Trim(request("mail"))
qa=Trim(request("qa"))

for i = 1 to 150
	b="a"&i
	'response.write b
	b=Trim(request(b))
	if b <> "" then
	c=c&b&"//"
	end if
next



%>
<%
Set msg=Server.CreateObject("Jmail.Message") 
msg.silent=true 
msg.Logging = true 
msg.Charset = "BIG5"
msg.ContentType = "text/html"
msg.MailServerUserName = "info@amigoinfo.com.tw"'SMTP 帳號 
msg.MailServerPassword = "guilimen"'SMTP密碼
msg.From = "info@amigoinfo.com.tw"'寄件人 
msg.FromName = "info@amigoinfo.com.tw"'寄件人名稱
msg.AddRecipient "info@amigoinfo.com.tw"'收件人 
msg.Subject = "名格網站留言通知"'主旨 
Body= "連絡人：" & name1 & "<br> "&"連絡電話：" & tel & "<br> "& "電子郵件：" & mail & "<br> "& "我要詢問：" & qa & "<br> "&"課程相關：" & "<br> "& c '郵件主要內容
msg.Body = Body
msg.Send ("amigoinfo.com.tw")'請設定SMTP Server 的主機名稱，如：168.95.4.211
set msg = nothing
%>

<%
response.Charset="utf-8" 
response.write "<script language=JavaScript>" & "alert('資料已送出');" & "location.href('/index.htm')" & "</script>"

Response.End

%>


