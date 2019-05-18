/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.proyectop3;

/**
 *
 * @author josea
 */
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendEmail {
    
    
    public String SendMailSolicitudAprobada (String solicitud, String jefeArea){
        String username = "proyectojavasgp@gmail.com";
        String password = "Contra123";
        Session session;
        
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("proyectojavasgp@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(jefeArea)
            );
            message.setSubject("Respuesta Solicitud " + solicitud);
            message.setText("La solicitud ha sido aprobada, dentro de poco un programador empezará a trabajar en ella,"
                    + "\n\n Tambien se le recuerda asignar a una persona de su área para que sea el revisor del caso cuando "
                    + "este haya sido completado. Feliz tarde");

            Transport.send(message);

            System.out.print("Se envio el correo");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        return username;
    }
    
    public String SendMailSolicitudRechazada (String solicitud, String jefeArea){
        String username = "proyectojavasgp@gmail.com";
        String password = "Contra123";
        Session session;
        
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("proyectojavasgp@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(jefeArea)
            );
            message.setSubject("Respuesta Solicitud #" + solicitud);
            message.setText("La solicitud ha sido rechazada, Si desea que la propuesta vuelva a ser evaluada nuevamente "
                    + "puede ingresar a la plataforma y desde ahi agregar mas información a la solicitud o puede agregar una solicitud completamente diferente. Feliz tarde.");

            Transport.send(message);

            System.out.print("Se envio el correo");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        return username;
    }
    
    public String SendMailCasoRevision (String caso, String revisor){
        String username = "proyectojavasgp@gmail.com";
        String password = "Contra123";
        Session session;
        
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("proyectojavasgp@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(revisor)
            );
            message.setSubject("Caso #" + caso);
            message.setText("El caso ha sido completado por el equipo de desarrollo y espera ser evaluado,"
                    + " en caso de no haber asignado aun a un revisor por favor enviar a la persona responsable,"
                    + "de esa manera agilizar el tiempo y permitir una implementación mas pronta. Feliz tarde.");

            Transport.send(message);

            System.out.print("Se envio el correo");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        return username;
    }
    
    public String SendMailCasoAsigando (String caso, String empleado){
        String username = "proyectojavasgp@gmail.com";
        String password = "Contra123";
        Session session;
        
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("proyectojavasgp@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(empleado)
            );
            message.setSubject("Caso Asignado #" + caso);
            message.setText("Se le informa que ha sido seleccionado para probar el nuevo sistema que se usará en planta"
                    + " y ademas de eso, podrá dar su veredicto sobre la funcionalidad del sistema, para obtener "
                    + "mayor información del caso por favor iniciar sesión y buscarlo en casos asignados. Felíz tarde.");

            Transport.send(message);

            System.out.print("Se envio el correo");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        return username;
    }
    
    public String SendMailCasoDevuelto (String caso, String empleado, String obs){
        String username = "proyectojavasgp@gmail.com";
        String password = "Contra123";
        Session session;
        
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("proyectojavasgp@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(empleado)
            );
            message.setSubject("Caso #" + caso);
            message.setText("El caso ha sido devuelto con observaciones: " + "\n "
                           + obs + "\n"
                           + "De arreglarse se podria dar como finalizado el caso. Feliz día.");

            Transport.send(message);

            System.out.print("Se envio el correo");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        return username;
    }
    
    public String SendMailCasoVencido (String caso, String empleado){
        String username = "proyectojavasgp@gmail.com";
        String password = "Contra123";
        Session session;
        
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("proyectojavasgp@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(empleado)
            );
            message.setSubject("Caso #" + caso + " Vencido");
            message.setText("Han pasado mas de siete días de que el caso fue creado y aun no ha habido entrega del mismo."
                    + " \n Se le recuerda que el trabajo ágil es puntual para la compañia");

            Transport.send(message);

            System.out.print("Se envio el correo");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        return username;
    }
    
    public String SendMailCasoFinalizado (String caso, String empleado){
        String username = "proyectojavasgp@gmail.com";
        String password = "Contra123";
        Session session;
        
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("proyectojavasgp@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(empleado)
            );
            message.setSubject("Caso #" + caso);
            message.setText("El caso ha finalizado luego de haber sido aprobado para uso en planta, "
                    + "su implementación queda para el próximo mes.");

            Transport.send(message);

            System.out.print("Se envio el correo");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        return username;
    }
    
    //Metodo para obtener el email del empleado en base a su IdEmpleado
    public String getEmailFromEmpleado(int id) throws SQLException, ClassNotFoundException{
        String email ="";
        
        String myDriver = "com.mysql.jdbc.Driver";
        Class.forName(myDriver);
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/proyectosgp", "root", "");

        String query = "SELECT email FROM empleados where idEmpleado = " + id;

        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
 
        while (rs.next())
        {
          email = rs.getString("email");
        }
        st.close();        
             
        
        return email;
    }
    
 
}