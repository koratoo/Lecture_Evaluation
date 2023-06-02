package util;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("ssykk220@gmail.com","rhfemaos1");//보내는 사람의 gmail
	
	
	}

	
	
	
}
