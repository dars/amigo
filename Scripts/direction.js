// JavaScript Document//var UrlObject = new Object();UrlObject.u0 = {url:"index.htm"};UrlObject.u1 = {url:"about.html"};UrlObject.u21 = {url:"studyinitaly.html"};UrlObject.u22 = {url:"studyinspain.html"};UrlObject.u23 = {url:"languageitaly.html"};UrlObject.u24 = {url:"languagespain.html"};UrlObject.u31 = {url:"design.html"};UrlObject.u32 = {url:"multimedia.html"};UrlObject.u33 = {url:"fashion.html"};UrlObject.u34 = {url:"styling.html"};UrlObject.u35 = {url:"fashionmanagement.html"};UrlObject.u36 = {url:"hospitality.html"};UrlObject.u37 = {url:"language.html"};UrlObject.u4 = {url:"links.html"};UrlObject.u5 = {url:"contact.html"};////document=直接開;windoe.open=另開function URL(i){	if(i==6){		window.open(UrlObject['u'+i].url)	}else{		document.location.href=UrlObject['u'+i].url;	}}function SearchMenuNum(){	var CurPageUrl = location.pathname.split('/');	CurPageUrl = CurPageUrl[CurPageUrl.length-1]	for(var i in UrlObject)	{		//alert(UrlObject[i].url +":"+ CurPageUrl);		if(UrlObject[i].url == CurPageUrl)		{			var MenuNum = UrlObject[i].menuIndex		}	}	if(!MenuNum)	{		MenuNum="";	}	return MenuNum;}//