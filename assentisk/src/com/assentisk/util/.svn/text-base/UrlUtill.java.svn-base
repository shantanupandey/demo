package com.assentisk.util;

import java.net.URL;

public class UrlUtill {

	public static String UrlName(String url) {

		String parmUrl = url.substring(url.lastIndexOf("/") + 1, url
				.indexOf("."));
		return parmUrl;

	}
	
	public static String getDomainName(String url){
		
		String host = "";
		try
		{
			   if(!url.startsWith("http") && !url.startsWith("https")){
			         url = "http://" + url;
			    }        
			    URL netUrl = new URL(url);
			    host = netUrl.getHost();
			   			    
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
	 
	    return host;
	}

}
