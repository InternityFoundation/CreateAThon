package email;
import javax.mail.MessagingException;

public class EmailOperation {
	public 
	EmailOperation()
	{
	}
public  void sendRegistrationMail(String mail) throws MessagingException
{
	String body="Thanks for registering";
	EmailCompose ec = new EmailCompose("createathon1998@gmail.com","create16create");
	String subject="Registration success";
	ec.setSubject(subject);
	ec.addRecievers(mail);
	ec.setMessage(body);
	ec.sendMail(true);
	
}

public  void sendNewQuestionMail(String mail,String statement) throws MessagingException
{
	String body="new question :-"+statement;
	EmailCompose ec = new EmailCompose("createathon1998@gmail.com","create16create");
	String subject="new question";
	ec.setSubject(subject);
	ec.addRecievers(mail);
	ec.setMessage(body);
	ec.sendMail(true);
	
}
}
