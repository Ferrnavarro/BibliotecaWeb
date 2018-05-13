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
import sv.edu.udb.beans.Prestamo;

/**
 *
 * @author Gustavo Müller
 */
@WebServlet(name = "PrestamosUsuario", urlPatterns = {"/PrestamosUsuario"})
public class PrestamosUsuario extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String carnet = request.getParameter("id");
            Prestamo p = new Prestamo();
            p.setIdUsuario(carnet);
            String[][] prestamos = p.getListaPrestamos();
            
            String tabla = "<table class='table table-striped table-hover'>"
                    + "<thead>\n" +
                "        <tr>\n" +
                "            <th>N°</th>\n" +
                "            <th>Fecha Prestamo</th>\n" +
                "            <th>Fecha Devolución</th>\n" +
                "            <th>Título</th>\n" +
                "            <th>Id Ejemplar</th>\n" +
                "            <th>Acciones</th>\n" +
                "        </tr>\n" +
                "    </thead>" +
                "    <tbody>";
            
            int i = 0;
            for (String[] prestamo : prestamos) {
                tabla += "<tr>";
                tabla += "<td>" + ++i + "</td>";
                for (int j = 1; j < prestamo.length; j++) {
                    tabla += "<td>" + prestamo[j] + "</td>";
                }
                tabla += "<td><a class=\"btn btn-default btn-circle\" href=\"devoluciones.jsp?dev=" + prestamo[0] + "\"><i class=\"fa fa-share\"></i></a></td>";
                tabla += "</tr>";
            }
            tabla += "</tbody></table>";
            
            if (prestamos.length == 0) {
                tabla = "<div class=\"alert alert-info alert-dismissable\">\n" +
"                                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n" +
"                                El usuario no posee prestamos activos\n" +
"                            </div>";
            }
            
            out.print(tabla);
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
