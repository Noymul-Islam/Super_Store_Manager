package MyPack;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class Password {
    public static void mailsend(String mail, String name,String msg)
    {
        String to = mail;
        String txt = "Dear "+name+" "+msg;
        String from = "quazirafi51@gmail.com";
        final String username = "quazirafi51";
        final String password = "mediocre";
        String host = "smtp.gmail.com";
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props,
      new javax.mail.Authenticator() {
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
         }
      });
      try {
         Message message = new MimeMessage(session);
         message.setFrom(new InternetAddress(from));
         message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
         message.setSubject("From ABC Super Store Manager");
         message.setText(txt);
         Transport.send(message);
      } catch (MessagingException e) {
            //throw new RuntimeException(e);
      }
    }
}