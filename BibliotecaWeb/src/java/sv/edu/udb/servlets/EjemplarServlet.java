/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.udb.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import sv.edu.udb.beans.EjemplarPrestamo;

/**
 *
 * @author Gustavo Müller
 */
@WebServlet(name = "EjemplarServlet", urlPatterns = {"/EjemplarServlet"})
public class EjemplarServlet extends HttpServlet {

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
        response.setContentType("application/json");
        try (PrintWriter out = response.getWriter()) {
            
            String error = "";
            String titulo = "";
            int idEj = 0;
            boolean disp = true;
            
            String str = request.getParameter("id");
            
            if (numeroValido(str)) {
                int id = Integer.parseInt(str);
                EjemplarPrestamo ejemplar = new EjemplarPrestamo(id);
                
                if (ejemplar.getExiste()) {
                    titulo = ejemplar.getTitulo();
                    disp = ejemplar.getDisponible();
                    idEj = ejemplar.getId();
                    //SessionVar id
                } else {
                    //Limpiar SessionVar id
                    error = "El id ingresado no existe";
                }
            } else {
                //Limpiar SessionVar id
                error = "El id ingresado no existe";
            }
            
            JSONObject obj = new JSONObject();
            obj.put("error", error);
            obj.put("titulo", titulo);
            obj.put("disp", disp);
            obj.put("id", idEj);
            
            out.print(obj);
        }
    }
    
    private boolean numeroValido(String str){
        try {
            return Integer.parseInt(str) > 0;
        } catch (NumberFormatException e) {
            return false;
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
