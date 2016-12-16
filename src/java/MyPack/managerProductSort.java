/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class managerProductSort extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
           
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
          //session=request.getSession(false);
          
        
        String sortType=request.getParameter("selection").toString();
        String Iteam=request.getParameter("Item").toString();
        /*if(session==null)
          {
              session.setAttribute("type", Iteam);
             // System.out.println(session.getAttribute("type"));
          }*/
        /*else 
        {
          session.removeAttribute("type");
          session.setAttribute("type", Iteam);
        //System.out.println(session.getAttribute("type"));
        }*/
         ManagerInfoDAO mngr=null;
         HttpSession session = request.getSession();
            try{
                 mngr = (ManagerInfoDAO) session.getAttribute("mngrdao");
                 mngr.setItem(Iteam);
                 session.setAttribute("mngrdao",mngr);
            }
            catch(Exception e){}
        

// System.out.println(sortType+""+Iteam);
        DatabaseConnector db=new DatabaseConnector();
        db.setConnectionWithOracle();
        SavingData d=db.sortData(Iteam, sortType);
        request.setAttribute("obj", d);
        RequestDispatcher rd=request.getRequestDispatcher("managerProductInfo2.jsp");
            System.out.println("AAAAAAAAAAAA");
        rd.forward(request, response); 
        //response.sendRedirect("managerProductInfo2.jsp");
        
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
