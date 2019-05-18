/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.proyectop3;

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.NamingException;


/**
 *
 * @author josea
 */
public class SubirArchivos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        System.out.println("ENTRO AL SERVLET");
        try {
        //obtener conexiones
        
        Context init = new InitialContext();
        Context context = (Context) init.lookup("java:comp/env");
        DataSource dataSource =(DataSource)context.lookup("jdbc/mysql");
        Connection conexion = dataSource.getConnection();
        //obtener url física de la carpeta img
        String direc=getServletContext().getRealPath("/resources");
        System.out.println("URL: "+ direc);
        //Permite subir el archico 3 parametros
        //1. reques, 2. direccion fisica, 3. Tamaño
        
        MultipartRequest multi = new MultipartRequest(request,direc,1*1024*1024);
        //Obteniendo los campos del formulario
        String solicitud=multi.getParameter("idSolicitud");
        
        String ruta=multi.getFile("archivoPdf").toString();
        // obtiene el fichero
        File ficheroTemp = multi.getFile("archivoPdf");
        
        out.println("<a href=mainJefeArea_solicitudes.jsp class=\\\"btn btn-success\\\">Regresar</a>");
        //obtenemos el nombre del archivo
        String nombreArchivo = ficheroTemp.getName();
        Statement s = conexion.createStatement();
        s.executeUpdate("update solicitudes set archivoPdf = "+ "\"" + nombreArchivo + "\"" + " where idSolicitud = " + "\"" + solicitud + "\"");
        }
        catch(FileNotFoundException e){
            out.println("La ruta de ubicacion no existe");
        }
        catch(IOException e){
            out.print("El archivo seleccionado supera el maximo de 1MB");
            
        }
        catch (SQLException | NamingException e)
        {
            
        e.printStackTrace();
        }
        finally {
        out.close();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
