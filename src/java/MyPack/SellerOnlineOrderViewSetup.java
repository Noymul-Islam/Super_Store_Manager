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
public class SellerOnlineOrderViewSetup extends HttpServlet {

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
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("view")) {
            DatabaseConnector dc = new DatabaseConnector();
            dc.setConnectionWithOracle();
            String tableNames[];

            if (request.getParameter("action2") != null) {
                System.out.println("inside action2");
                String removeTableName = "ID" + request.getParameter("action2");
                String userID = request.getParameter("action2");
                if (request.getParameter("action3") != null) {
                    System.out.println("inside action3");
                    String coins = request.getParameter("action3");
                    if (Integer.parseInt(coins) >= 0) {
                        dc.checkAndInsertCoin(Integer.parseInt(userID), Integer.parseInt(coins));
                    }
                }

                dc.deleteTable(removeTableName);
            }

            int id[] = new int[200];
            tableNames = dc.getTableNames();
            int numbOfOrders = 0;
            for (int i = 0; i < tableNames.length; ++i) {
                if (tableNames[i] != null) {
                    //System.out.println(tableNames[i]);
                    String stringID = "";
                    for (int j = 2; j < tableNames[i].length(); ++j) {
                        stringID += tableNames[i].charAt(j);
                    }
                    //System.out.println(stringID);
                    id[i] = Integer.parseInt(stringID);
                    //System.out.println(id[i]);
                    ++numbOfOrders;
                } else {
                    break;
                }
            }
            SellerPageObject spo = new SellerPageObject();
            spo.setId(id);
            spo.setTableNames(tableNames);
            spo.setNumberOfOrders(numbOfOrders);
            request.setAttribute("dao", spo);
            RequestDispatcher rd = request.getRequestDispatcher("SellerOnlineOrdersPage.jsp");
            rd.forward(request, response);
        }

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
