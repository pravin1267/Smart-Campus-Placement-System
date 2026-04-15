package com.campusplacement.util;

import java.util.Properties;

import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailUtil {

    public static void sendOTP(String toEmail, int otp) {

        String fromEmail = "kshirsagarpravin847@gmail.com";
        String password = "mejw ullf kxvy jkpp";

        Properties properties = new Properties();

        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties,new jakarta.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(fromEmail, password);
                    }
                });

        try {

            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            
            message.setSubject("Campus Placement System OTP");
            
            String messageText =
                    "Dear User,\n\n" +
                    "We received a request to reset the password for your Campus Placement System account.\n\n" +
                    "Your One-Time Password (OTP) for password verification is:\n\n" +
                    "OTP: " + otp + "\n\n" +
                    "This OTP is valid for the next 5 minutes. Please do not share this code with anyone.\n\n" +
                    "If you did not request a password reset, please ignore this email. Your account will remain secure.\n\n" +
                    "Thank you,\n" +
                    "Campus Placement System Team";
            message.setText(messageText);

            Transport.send(message);

            System.out.println("OTP Email Sent Successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}