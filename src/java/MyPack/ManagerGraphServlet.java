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

/**
 *
 * @author DELL
 */
public class ManagerGraphServlet extends HttpServlet {

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
        String[] tableNames = new String[10];
        tableNames[0] = "grocerylist";
        tableNames[1] = "vegetablelist";
        tableNames[2] = "eggslist";
        tableNames[3] = "meatslist";
        tableNames[4] = "fisheslist";
        tableNames[5] = "cosmeticslist";
        tableNames[6] = "colddrinkslist";
        tableNames[7] = "chockolateslist";
        tableNames[8] = "liquidslist";
        tableNames[9] = "otherslist";
        String action = request.getParameter("action");
        //if (action.equals("total_sold")) {
        System.out.println(action);
        DatabaseConnector dc = new DatabaseConnector();
        dc.setConnectionWithOracle();
        if (action.equals("remaining_item") || action.equals("total_sold") || action.equals("recent_sold") || action.equals("expdate")) {
            String[] totalSoldOfEachType = new String[10];

            for (int i = 0; i < 10; ++i) {
                totalSoldOfEachType[i] = dc.getGraphData(action, tableNames[i]);
            }

            GraphData gd = new GraphData(action);
            gd.setTotalSoldOfEachType(totalSoldOfEachType);
            request.setAttribute("dao", gd);
            if (action.equals("remaining_item")) {
                RequestDispatcher rd = request.getRequestDispatcher("MyManager3.jsp");
                rd.forward(request, response);
            } else if (action.equals("total_sold")) {
                RequestDispatcher rd = request.getRequestDispatcher("MyManager2.jsp");
                rd.forward(request, response);
            } else if (action.equals("recent_sold")) {
                RequestDispatcher rd = request.getRequestDispatcher("MyManager4.jsp");
                rd.forward(request, response);
            } else if (action.equals("expdate")) {
                RequestDispatcher rd = request.getRequestDispatcher("MyManager5.jsp");
                rd.forward(request, response);
            }
        }
        else if (action.equals("gro")){
            GraphData gd = new GraphData(action);
            gd.setTn(tableNames[0]);
            request.setAttribute("dao", gd);
            RequestDispatcher rd = request.getRequestDispatcher("MyManager6.jsp");
            rd.forward(request, response);
        }
        else if (action.equals("veg")){
            GraphData gd = new GraphData(action);
            gd.setTn(tableNames[1]);
            request.setAttribute("dao", gd);
            RequestDispatcher rd = request.getRequestDispatcher("MyManager6.jsp");
            rd.forward(request, response);
        }
        else if (action.equals("egg")){
            GraphData gd = new GraphData(action);
            gd.setTn(tableNames[2]);
            request.setAttribute("dao", gd);
            RequestDispatcher rd = request.getRequestDispatcher("MyManager6.jsp");
            rd.forward(request, response);
        }
        else if (action.equals("meat")){
            GraphData gd = new GraphData(action);
            gd.setTn(tableNames[3]);
            request.setAttribute("dao", gd);
            RequestDispatcher rd = request.getRequestDispatcher("MyManager6.jsp");
            rd.forward(request, response);
        }
        else if (action.equals("fish")){
            GraphData gd = new GraphData(action);
            gd.setTn(tableNames[4]);
            request.setAttribute("dao", gd);
            RequestDispatcher rd = request.getRequestDispatcher("MyManager6.jsp");
            rd.forward(request, response);
        }
        else if (action.equals("cos")){
            GraphData gd = new GraphData(action);
            gd.setTn(tableNames[5]);
            request.setAttribute("dao", gd);
            RequestDispatcher rd = request.getRequestDispatcher("MyManager6.jsp");
            rd.forward(request, response);
        }
        else if (action.equals("cold")){
            GraphData gd = new GraphData(action);
            gd.setTn(tableNames[6]);
            request.setAttribute("dao", gd);
            RequestDispatcher rd = request.getRequestDispatcher("MyManager6.jsp");
            rd.forward(request, response);
        }
        else if (action.equals("chock")){
            GraphData gd = new GraphData(action);
            gd.setTn(tableNames[7]);
            request.setAttribute("dao", gd);
            RequestDispatcher rd = request.getRequestDispatcher("MyManager6.jsp");
            rd.forward(request, response);
        }
        else if (action.equals("liq")){
            GraphData gd = new GraphData(action);
            gd.setTn(tableNames[8]);
            request.setAttribute("dao", gd);
            RequestDispatcher rd = request.getRequestDispatcher("MyManager6.jsp");
            rd.forward(request, response);
        }
        else if (action.equals("oth")){
            GraphData gd = new GraphData(action);
            gd.setTn(tableNames[9]);
            request.setAttribute("dao", gd);
            RequestDispatcher rd = request.getRequestDispatcher("MyManager6.jsp");
            rd.forward(request, response);
        }
        else if (action.equals("yeardata")){
            GraphData gd = new GraphData(action);
            gd.setTn("yeardata");
            request.setAttribute("dao", gd);
            RequestDispatcher rd = request.getRequestDispatcher("MyManager7.jsp");
            rd.forward(request, response);
        }
        else if (action.equals("monthdata")){
            GraphData gd = new GraphData(action);
            gd.setTn("monthdata");
            request.setAttribute("dao", gd);
            RequestDispatcher rd = request.getRequestDispatcher("MyManager7.jsp");
            rd.forward(request, response);
        }
        //}
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
