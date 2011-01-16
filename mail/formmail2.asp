<%
dim student, tel, e_mail, question
student=Trim(request("student"))
tel=Trim(request("tel"))
e_mail=Trim(request("e_mail"))
question=Trim(request("question"))

%>

<%
Set msg=Server.CreateObject("Jmail.Message") 
msg.silent=true 
msg.Logging = true 
msg.Charset = "utf-8"
msg.ContentType = "text/html"
msg.MailServerUserName = "info@amigoinfo.com.tw"'SMTP 帳號 
msg.MailServerPassword = "guilimen"'SMTP密碼
msg.From = "info@amigoinfo.com.tw"'寄件人 
msg.FromName = "info@amigoinfo.com.tw"'寄件人名稱
msg.AddRecipient "info@amigoinfo.com.tw"'收件人 
msg.Subject = "名格網站留言通知"'主旨 
Body= "連絡人：" & student & "連絡電話：" & tel & "電子郵件：" & e_mail & "我想知道的問題：" & question & "課程相關問題：" & iedDesign '郵件主要內容
msg.Body = Body
msg.Send ("amigoinfo.com.tw")'請設定SMTP Server 的主機名稱，如：168.95.4.211
set msg = nothing
%>
<%
session.abandon
response.write "<script language=JavaScript>" & chr(13) & "alert('您的資料已發送成功 謝謝。');" & "location.assign('/contact.html')" & "</script>"
Response.End
%>

