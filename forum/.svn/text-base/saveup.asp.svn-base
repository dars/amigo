<link rel="stylesheet" type="text/css" href="css.css"><body topmargin="0">
<%if application("upnum")>2 then
 	response.write "一次只能上傳 <b>2</b> 個文件！"
	response.end
end if
%>
<SCRIPT RUNAT=SERVER LANGUAGE=VBSCRIPT>

dim upfile_k6_Stream

Class upload_k6
  
dim Form,File,Version
  
Private Sub Class_Initialize 
		dim iStart,iFileNameStart,iFileNameEnd,iEnd,vbEnter,iFormStart,iFormEnd,theFile
		dim strDiv,mFormName,mFormValue,mFileName,mFileSize,mFilePath,iDivLen,mStr
		Version=""
		if Request.TotalBytes<1 then Exit Sub
		set Form=CreateObject("Scripting.Dictionary")
		set File=CreateObject("Scripting.Dictionary")
		set upfile_k6_Stream=CreateObject("Adodb.Stream")
		upfile_k6_Stream.mode=3
		upfile_k6_Stream.type=1
		upfile_k6_Stream.open
		upfile_k6_Stream.write Request.BinaryRead(Request.TotalBytes)
		
		vbEnter=Chr(13)&Chr(10)
		iDivLen=inString(1,vbEnter)+1
		strDiv=subString(1,iDivLen)
		iFormStart=iDivLen
		iFormEnd=inString(iformStart,strDiv)-1
		while iFormStart < iFormEnd
		  iStart=inString(iFormStart,"name=""")
		  iEnd=inString(iStart+6,"""")
		  mFormName=subString(iStart+6,iEnd-iStart-6)
		  iFileNameStart=inString(iEnd+1,"filename=""")
		  if iFileNameStart>0 and iFileNameStart<iFormEnd then
		   iFileNameEnd=inString(iFileNameStart+10,"""")
		   mFileName=subString(iFileNameStart+10,iFileNameEnd-iFileNameStart-10)
		   iStart=inString(iFileNameEnd+1,vbEnter&vbEnter)
		   iEnd=inString(iStart+4,vbEnter&strDiv)
		   if iEnd>iStart then
			mFileSize=iEnd-iStart-4
		   else
			mFileSize=0
		   end if
		   set theFile=new FileInfo
		   theFile.FileName=getFileName(mFileName)
		   theFile.FilePath=getFilePath(mFileName)
		   theFile.FileSize=mFileSize
		   theFile.FileStart=iStart+4
		   theFile.FormName=FormName
		   file.add mFormName,theFile
		  else
		   iStart=inString(iEnd+1,vbEnter&vbEnter)
		   iEnd=inString(iStart+4,vbEnter&strDiv)
		
		   if iEnd>iStart then
			mFormValue=subString(iStart+4,iEnd-iStart-4)
		   else
			mFormValue="" 
		   end if
		   form.Add mFormName,mFormValue
		  end if
		
		  iFormStart=iformEnd+iDivLen
		  iFormEnd=inString(iformStart,strDiv)-1
		wend
End Sub

Private Function subString(theStart,theLen)
 dim i,c,stemp
 upfile_k6_Stream.Position=theStart-1
 stemp=""
 for i=1 to theLen
   if upfile_k6_Stream.EOS then Exit for
   c=ascB(upfile_k6_Stream.Read(1))
   If c > 127 Then
    if upfile_k6_Stream.EOS then Exit for
    stemp=stemp&Chr(AscW(ChrB(AscB(upfile_k6_Stream.Read(1)))&ChrB(c)))
    i=i+1
   else
    stemp=stemp&Chr(c)
   End If
 Next
 subString=stemp
End function


Private Function inString(theStart,varStr)
 dim i,j,bt,theLen,str
 InString=0
 Str=toByte(varStr)
 theLen=LenB(Str)
 for i=theStart to upfile_k6_Stream.Size-theLen
   if i>upfile_k6_Stream.size then exit Function
   upfile_k6_Stream.Position=i-1
   if AscB(upfile_k6_Stream.Read(1))=AscB(midB(Str,1)) then
    InString=i
    for j=2 to theLen
      if upfile_k6_Stream.EOS then 
        inString=0
        Exit for
      end if
      if AscB(upfile_k6_Stream.Read(1))<>AscB(MidB(Str,j,1)) then
        InString=0
        Exit For
      end if
    next
    if InString<>0 then Exit Function
   end if
 next
End Function


Private Sub Class_Terminate  
  form.RemoveAll
  file.RemoveAll
  set form=nothing
  set file=nothing
  upfile_k6_Stream.close
  set upfile_k6_Stream=nothing
End Sub
   
 
 Private function GetFilePath(FullPath)
  If FullPath <> "" Then
   GetFilePath = left(FullPath,InStrRev(FullPath, "\"))
  Else
   GetFilePath = ""
  End If
 End  function
 
 Private function GetFileName(FullPath)
  If FullPath <> "" Then
   GetFileName = mid(FullPath,InStrRev(FullPath, "\")+1)
  Else
   GetFileName = ""
  End If
 End  function

 Private function toByte(Str)
   dim i,iCode,c,iLow,iHigh
   toByte=""
   For i=1 To Len(Str)
   c=mid(Str,i,1)
   iCode =Asc(c)
   If iCode<0 Then iCode = iCode + 65535
   If iCode>255 Then
     iLow = Left(Hex(Asc(c)),2)
     iHigh =Right(Hex(Asc(c)),2)
     toByte = toByte & chrB("&H"&iLow) & chrB("&H"&iHigh)
   Else
     toByte = toByte & chrB(AscB(c))
   End If
   Next
 End function
End Class


Class FileInfo
  dim FormName,FileName,FilePath,FileSize,FileStart
  Private Sub Class_Initialize 
    FileName = ""
    FilePath = ""
    FileSize = 0
    FileStart= 0
    FormName = ""
  End Sub
  
 Public function SaveAs(FullPath)
    dim dr,ErrorChar,i
    SaveAs=1
    if trim(fullpath)="" or FileSize=0 or FileStart=0 or FileName="" then exit function
    if FileStart=0 or right(fullpath,1)="/" then exit function
    set dr=CreateObject("Adodb.Stream")
    dr.Mode=3
    dr.Type=1
    dr.Open
    upfile_k6_Stream.position=FileStart-1
    upfile_k6_Stream.copyto dr,FileSize
    dr.SaveToFile FullPath,2
    dr.Close
    set dr=nothing 
    SaveAs=0
  end function
End Class
</SCRIPT>
<script>
parent.document.kbbs.B1.disabled=false;
parent.document.kbbs.B2.disabled=false;
</script>
<%
dim upNum
dim uploadsuc
dim Forumupload
dim ranNum
dim uploadfiletype
dim upload,file,formName,formPath,iCount,filename,fileExt
call upload_0()
sub upload_0()
set upload=new upload_k6 ''建立上傳對像

 formPath=upload.form("filepath")
 ''在目錄後加(/)
 if right(formPath,1)<>"/" then formPath=formPath&"/" 

response.write "<body bgcolor="""&Tablebodycolor&""" leftmargin=5 topmargin=3>"

iCount=0
for each formName in upload.file ''列出所有上傳了的文件
 set file=upload.file(formName)  ''生成一個文件對像
 if file.filesize<100 then
 	response.write "請先選擇你要上傳的文件　[ <a href=# onclick=history.go(-1)>重新上傳</a> ]"
	response.end
 end if
 	
 if file.filesize>cint(150)*1000 then
 	response.write "文件大小超過了限制 150K　[ <a href=# onclick=history.go(-1)>重新上傳</a> ]"
	response.end
 end if

 fileExt=lcase(right(file.filename,4))
 uploadsuc=false
 Forumupload=split("gif,jpg,bmp,png,swf,zip,rar",",")
 for i=0 to ubound(Forumupload)
	if fileEXT="."&trim(Forumupload(i)) then
	uploadsuc=true
	exit for
	else
	uploadsuc=false
	end if
 next
 if uploadsuc=false then
 	response.write "文件格式不正確　[ <a href=# onclick=history.go(-1)>重新上傳</a> ]"
	response.end
 end if

 randomize
 ranNum=int(90000*rnd)+10000
 filename=formPath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&fileExt

 if file.FileSize>0 then         ''如果 FileSize > 0 說明有文件資料
  file.SaveAs Server.mappath("upload"&FileName)   ''保存文件
	for i=0 to ubound(Forumupload)
		if fileEXT="."&trim(Forumupload(i)) then
	 	response.write "<script>parent.kbbs.body.value+='[upload="&Forumupload(i)&"]"&FileName&"[/upload]'</script>"
		exit for
		end if
	next
 iCount=iCount+1
 end if
 set file=nothing
next
set upload=nothing

Htmend iCount&" 個文件上傳結束!"
end sub


sub HtmEnd(Msg)
application("upnum")=application("upnum")+1
response.write "<b>"&application("upnum")-1&"</b> 文件上傳完成,請copy下邊的文件連結,以備後用！>><a href=upload.asp>繼續上傳</a>"
 response.end
end sub

function MakedownName(filename)
  dim fname,Forumupload,u
  fname = now()
  fname = replace(fname,"-","")
  fname = replace(fname," ","") 
  fname = replace(fname,":","")
  fname = replace(fname,"PM","")
  fname = replace(fname,"AM","")
  fname = replace(fname,"上午","")
  fname = replace(fname,"下午","")
  fname = int(fname) + int((10-1+1)*Rnd + 1)
  Forumupload=split(Forum_upload,",")
  for u=0 to ubound(Forumupload)
		if instr(filename,Forumupload(u))>0 then
			uploadfiletype=Forumupload(u)
			MakedownName=fname & "." & Forumupload(u)
			exit for
		end if
  next
end function
%></body></html>