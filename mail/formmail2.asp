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
msg.MailServerUserName = "info@amigoinfo.com.tw"'SMTP �b�� 
msg.MailServerPassword = "guilimen"'SMTP�K�X
msg.From = "info@amigoinfo.com.tw"'�H��H 
msg.FromName = "info@amigoinfo.com.tw"'�H��H�W��
msg.AddRecipient "info@amigoinfo.com.tw"'����H 
msg.Subject = "�W������d���q��"'�D�� 
Body= "�s���H�G" & student & "�s���q�ܡG" & tel & "�q�l�l��G" & e_mail & "�ڷQ���D�����D�G" & question & "�ҵ{�������D�G" & iedDesign '�l��D�n���e
msg.Body = Body
msg.Send ("amigoinfo.com.tw")'�г]�wSMTP Server ���D���W�١A�p�G168.95.4.211
set msg = nothing
%>
<%
session.abandon
response.write "<script language=JavaScript>" & chr(13) & "alert('�z����Ƥw�o�e���\ ���¡C');" & "location.assign('/contact.html')" & "</script>"
Response.End
%>

