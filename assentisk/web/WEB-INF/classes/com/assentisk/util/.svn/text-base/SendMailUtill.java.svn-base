

package com.assentisk.util;

import java.util.Properties;


import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.EmailException;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;


public class SendMailUtill
{


    protected String host;
    protected String from;
    
    public SendMailUtill()
    {
    }

    public String getHost()
    {
        return host;
    }

    public String getFrom()
    {
        return from;
    }

    public void setFrom(String from)
    {
        this.from = from;
    }

    public void setHost(String host)
    {
        this.host = host;
    }

    public void sendMessage(HttpServletRequest req, String to, String subject, String body) throws EmailException, MessagingException
{
	System.out.println("to----"+to);
	System.out.println("subject----"+subject);
	System.out.println("body----"+body);
	Properties props = new Properties();
	props.put("mail.smtp.host", "103.47.150.61");
	props.put("mail.smtp.socketFactory.port", "465");
	props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.port", 587);

	Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
				    
					return new PasswordAuthentication("projtest@otssolutions.com","ots@4737");
					
					
				}
			});

	try {

		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("projtest@otssolutions.com"));
		
		message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
//		InternetAddress addressTo = new InternetAddress(to);
//		message.setRecipient(RecipientType.TO,addressTo);
		message.setSubject(subject);
		
		  // Create the message part
        BodyPart messageBodyPart = new MimeBodyPart();

        // Now set the actual message
        messageBodyPart.setText(body);

        // Create a multipar message
        Multipart multipart = new MimeMultipart();

        // Set text message part
        multipart.addBodyPart(messageBodyPart);

        // Part two is attachment
        messageBodyPart = new MimeBodyPart();
        String filename = req.getRealPath("").toString()+"policy.pdf";
        DataSource source = new FileDataSource(filename);
        messageBodyPart.setDataHandler(new DataHandler(source));
        messageBodyPart.setFileName(filename);
        
        multipart.addBodyPart(messageBodyPart);
        

        // Send the complete message parts
        message.setContent(multipart);
		
		System.out.println("before Done");
		
		Transport.send(message);

		System.out.println("Done");

	} catch (MessagingException e) {
		System.out.println(e);
		throw new RuntimeException(e);
	}
	

}


    
    
    
}
