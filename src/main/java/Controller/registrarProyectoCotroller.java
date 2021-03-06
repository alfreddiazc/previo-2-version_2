/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dto.Alumno;
import Dto.Proyecto;
import Negocio.Ferias;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USUARIO
 */
public class registrarProyectoCotroller extends HttpServlet {

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
         String nombre = request.getParameter("nom");
        String resumen = request.getParameter("res");
        String video = request.getParameter("vid");
        String asig = request.getParameter("asignatura");
        String cate = request.getParameter("categoria");
        String tipo = request.getParameter("tipo");
        String evento = request.getParameter("evento");
       
        Ferias f=new Ferias();
        Proyecto p=new Proyecto();
        p.setNombre(nombre);
        p.setResumen(resumen);
        p.setVideo(video);
        p.setAsignatura(f.findAsignaturaById(asig));
        p.setCategoria(f.findCategoriaById(cate));
        p.setTipo(f.findTipoById(tipo));
        p.setEvento(f.findEventoById(evento));
        Alumno a=(Alumno) request.getSession().getAttribute("alumno");
        
        if(f.RegistrarProyecto(p)){
            
            f.asignarAlumnoaProy(p, a);
            List<Proyecto> lp=f.participa2(a);
            request.getSession().setAttribute("alumno", a);
            request.setAttribute("listProyect", lp);
            request.getRequestDispatcher("./jsp/logueado.jsp").forward(request, response);
        }
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
