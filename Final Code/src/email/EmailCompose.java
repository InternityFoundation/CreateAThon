package email;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author user
 */
public class EmailCompose {
    private final String email;
    private final String password;
    private  String subject;
    private  String message;
    private  String[] drecipents;
    private  String[] ccrecipents;
    public EmailCompose(String email,String password)
    {
        this.email=email;
        this.password=password;
    }
    public void setSubject(String sub)
    {
        this.subject=sub;
    }
    public void setMessage(String msg)
    {
        this.message=msg;
    }
    public void addRecievers(String[] rec)
    {
        this.drecipents=rec;
    }
    public void addRecievers(String rec)
    {
        
        this.drecipents=new String[1];
        this.drecipents[0]=rec;
    }
    public void addCarbonCopy(String[] rec)
    {
        this.ccrecipents=rec;
    }
    public void addCarbonCopy(String rec)
    {
        
        this.ccrecipents=new String[1];
        this.ccrecipents[1]=rec;
    }
    public boolean sendMail(boolean html)
    {
        
        final String from = email;
   
        Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");    
          //get Session   
          Session session = Session.getDefaultInstance(props,    
           new javax.mail.Authenticator() {    
           @Override
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(from,password);  
           }    
          });    
          //compose message    
          try {    
           MimeMessage mmessage = new MimeMessage(session);    
           for(String to : drecipents)
           {
            mmessage.addRecipient(Message.RecipientType.TO,new InternetAddress(to)); 
           }
           if(ccrecipents!=null)
           
            {
                for(String to : ccrecipents)
                {
                    mmessage.addRecipient(Message.RecipientType.CC,new InternetAddress(to)); 
                }
           }
           mmessage.setSubject(subject);      
           //send message 
           String subType;
           if(html){
		subType = "html";
            }else{
		subType = "plain";
            }
	 mmessage.setText(message, "UTF-8", subType);
           Transport.send(mmessage);    
           
           return true;
          }
          catch (Exception e) 
          {
              System.out.println(e);
              return false;
          }}
    
}
