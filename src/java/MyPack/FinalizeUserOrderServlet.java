/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class FinalizeUserOrderServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        CurrentUser cu2 = (CurrentUser) session.getAttribute("cu");

        double totalAmountPurchased = 0.0;
        double totalCostOfPurchasedProducts = 0.0;

        DatabaseConnector dc = new DatabaseConnector();
        dc.setConnectionWithOracle();

        if (dc.checkAlreadyUsedCoin(Integer.parseInt(cu2.getID())) == false) {

            for (int i = 0; i < cu2.getVegCount(); ++i) {
                totalCostOfPurchasedProducts += cu2.vegCost[i];
            }

            for (int i = 0; i < cu2.getGroceryCount(); ++i) {
                totalCostOfPurchasedProducts += cu2.groceryCost[i];
            }

            for (int i = 0; i < cu2.getLiquidsCount(); ++i) {
                totalCostOfPurchasedProducts += cu2.liquidsCost[i];
            }

            for (int i = 0; i < cu2.getChockolatesCount(); ++i) {
                totalCostOfPurchasedProducts += cu2.chockolatesCost[i];
            }

            for (int i = 0; i < cu2.getEggsCount(); ++i) {
                totalCostOfPurchasedProducts += cu2.eggsCost[i];
            }

            for (int i = 0; i < cu2.getMeatsCount(); ++i) {
                totalCostOfPurchasedProducts += cu2.meatsCost[i];
            }

            for (int i = 0; i < cu2.getFishesCount(); ++i) {
                totalCostOfPurchasedProducts += cu2.fishesCost[i];
            }

            for (int i = 0; i < cu2.getColddrinksCount(); ++i) {
                totalCostOfPurchasedProducts += cu2.colddrinksCost[i];
            }

            for (int i = 0; i < cu2.getCosmeticsCount(); ++i) {
                totalCostOfPurchasedProducts += cu2.cosmeticsCost[i];
            }

            for (int i = 0; i < cu2.getOthersCount(); ++i) {
                totalCostOfPurchasedProducts += cu2.othersCost[i];
            }

            int failedFlag = 0;

            if ((request.getParameter("action") != null) && (cu2.getSellerID().equals("none"))) {
                int userCoins = Integer.parseInt(dc.getColumn("usercoins", "coins", Integer.parseInt(cu2.getID())));
                if (userCoins < totalCostOfPurchasedProducts) {
                    failedFlag = 1;
                } else {
                    dc.insertIntoPaymentInfo(Integer.parseInt(cu2.getID()), "used");
                }
            }

            if (failedFlag == 0) {

                String supplierViewTableName = "id" + cu2.getID();

                int count = 0;
                boolean flag = false;

                if (cu2.getSellerID().equals("none")) {
                    count = dc.getTableCount();
                    String str[] = new String[200];
                    str = dc.getTableNames();

                    for (int i = 0; i < count; ++i) {
                        if (supplierViewTableName.equals(str[i])) {
                            flag = true;
                        }
                    }
                    if (flag == false) {
                        dc.createTable(supplierViewTableName);

                    }
                }

                //update vegetable information
                for (int i = 0; i < cu2.getVegCount(); ++i) {

                    String totalSold = dc.getColumn("vegetablelist", "total_sold", cu2.vegNames[i]);
                    String recentSold = dc.getColumn("vegetablelist", "recent_sold", cu2.vegNames[i]);

                    double dTotalSold = Double.parseDouble(totalSold);
                    double dRecentSold = Double.parseDouble(recentSold);

                    String amount = cu2.vegAmounts[i];

                    double dAmount = Double.parseDouble(amount);

                    totalAmountPurchased += dAmount;

                    double dFinalTotalSold = dTotalSold + dAmount;
                    double dFinalRecentSold = dRecentSold + dAmount;

                    dc.updateColumn("vegetablelist", "total_sold", cu2.vegNames[i], dFinalTotalSold);
                    dc.updateColumn("vegetablelist", "recent_sold", cu2.vegNames[i], dFinalRecentSold);

                    if (cu2.getSellerID().equals("none")) {
                        dc.insertIntoTable(supplierViewTableName, cu2.vegNames[i], cu2.vegAmounts[i], cu2.vegCost[i]);
                    }

                }

                //update grocery information
                for (int i = 0; i < cu2.getGroceryCount(); ++i) {

                    String totalSold = dc.getColumn("grocerylist", "total_sold", cu2.groceryNames[i]);
                    String recentSold = dc.getColumn("grocerylist", "recent_sold", cu2.groceryNames[i]);

                    double dTotalSold = Double.parseDouble(totalSold);
                    double dRecentSold = Double.parseDouble(recentSold);

                    String amount = cu2.groceryAmounts[i];

                    double dAmount = Double.parseDouble(amount);

                    totalAmountPurchased += dAmount;

                    double dFinalTotalSold = dTotalSold + dAmount;
                    double dFinalRecentSold = dRecentSold + dAmount;

                    dc.updateColumn("grocerylist", "total_sold", cu2.groceryNames[i], dFinalTotalSold);
                    dc.updateColumn("grocerylist", "recent_sold", cu2.groceryNames[i], dFinalRecentSold);

                    if (cu2.getSellerID().equals("none")) {
                        dc.insertIntoTable(supplierViewTableName, cu2.groceryNames[i], cu2.groceryAmounts[i], cu2.groceryCost[i]);
                    }
                }

                //update liquids information
                for (int i = 0; i < cu2.getLiquidsCount(); ++i) {

                    String totalSold = dc.getColumn("liquidslist", "total_sold", cu2.liquidsNames[i]);
                    String recentSold = dc.getColumn("liquidslist", "recent_sold", cu2.liquidsNames[i]);

                    double dTotalSold = Double.parseDouble(totalSold);
                    double dRecentSold = Double.parseDouble(recentSold);

                    String amount = cu2.liquidsAmounts[i];

                    double dAmount = Double.parseDouble(amount);

                    totalAmountPurchased += dAmount;

                    double dFinalTotalSold = dTotalSold + dAmount;
                    double dFinalRecentSold = dRecentSold + dAmount;

                    dc.updateColumn("liquidslist", "total_sold", cu2.liquidsNames[i], dFinalTotalSold);
                    dc.updateColumn("liquidslist", "recent_sold", cu2.liquidsNames[i], dFinalRecentSold);

                    if (cu2.getSellerID().equals("none")) {
                        dc.insertIntoTable(supplierViewTableName, cu2.liquidsNames[i], cu2.liquidsAmounts[i], cu2.liquidsCost[i]);
                    }
                }

                //update chockolates information
                for (int i = 0; i < cu2.getChockolatesCount(); ++i) {

                    String totalSold = dc.getColumn("chockolateslist", "total_sold", cu2.chockolatesNames[i]);
                    String recentSold = dc.getColumn("chockolateslist", "recent_sold", cu2.chockolatesNames[i]);

                    double dTotalSold = Double.parseDouble(totalSold);
                    double dRecentSold = Double.parseDouble(recentSold);

                    String amount = cu2.chockolatesAmounts[i];

                    double dAmount = Double.parseDouble(amount);

                    totalAmountPurchased += dAmount;

                    double dFinalTotalSold = dTotalSold + dAmount;
                    double dFinalRecentSold = dRecentSold + dAmount;

                    dc.updateColumn("chockolateslist", "total_sold", cu2.chockolatesNames[i], dFinalTotalSold);
                    dc.updateColumn("chockolateslist", "recent_sold", cu2.chockolatesNames[i], dFinalRecentSold);

                    if (cu2.getSellerID().equals("none")) {
                        dc.insertIntoTable(supplierViewTableName, cu2.chockolatesNames[i], cu2.chockolatesAmounts[i], cu2.chockolatesCost[i]);
                    }
                }

                //update eggs information
                for (int i = 0; i < cu2.getEggsCount(); ++i) {

                    String totalSold = dc.getColumn("eggslist", "total_sold", cu2.eggsNames[i]);
                    String recentSold = dc.getColumn("eggslist", "recent_sold", cu2.eggsNames[i]);

                    double dTotalSold = Double.parseDouble(totalSold);
                    double dRecentSold = Double.parseDouble(recentSold);

                    String amount = cu2.eggsAmounts[i];

                    double dAmount = Double.parseDouble(amount);

                    totalAmountPurchased += dAmount;

                    double dFinalTotalSold = dTotalSold + dAmount;
                    double dFinalRecentSold = dRecentSold + dAmount;

                    dc.updateColumn("eggslist", "total_sold", cu2.eggsNames[i], dFinalTotalSold);
                    dc.updateColumn("eggslist", "recent_sold", cu2.eggsNames[i], dFinalRecentSold);

                    if (cu2.getSellerID().equals("none")) {
                        dc.insertIntoTable(supplierViewTableName, cu2.eggsNames[i], cu2.eggsAmounts[i], cu2.eggsCost[i]);
                    }
                }

                //update meats information
                for (int i = 0; i < cu2.getMeatsCount(); ++i) {

                    String totalSold = dc.getColumn("meatslist", "total_sold", cu2.meatsNames[i]);
                    String recentSold = dc.getColumn("meatslist", "recent_sold", cu2.meatsNames[i]);

                    double dTotalSold = Double.parseDouble(totalSold);
                    double dRecentSold = Double.parseDouble(recentSold);

                    String amount = cu2.meatsAmounts[i];

                    double dAmount = Double.parseDouble(amount);

                    totalAmountPurchased += dAmount;

                    double dFinalTotalSold = dTotalSold + dAmount;
                    double dFinalRecentSold = dRecentSold + dAmount;

                    dc.updateColumn("meatslist", "total_sold", cu2.meatsNames[i], dFinalTotalSold);
                    dc.updateColumn("meatslist", "recent_sold", cu2.meatsNames[i], dFinalRecentSold);

                    if (cu2.getSellerID().equals("none")) {
                        dc.insertIntoTable(supplierViewTableName, cu2.meatsNames[i], cu2.meatsAmounts[i], cu2.meatsCost[i]);
                    }
                }

                //update fishes information
                for (int i = 0; i < cu2.getFishesCount(); ++i) {

                    String totalSold = dc.getColumn("fisheslist", "total_sold", cu2.fishesNames[i]);
                    String recentSold = dc.getColumn("fisheslist", "recent_sold", cu2.fishesNames[i]);

                    double dTotalSold = Double.parseDouble(totalSold);
                    double dRecentSold = Double.parseDouble(recentSold);

                    String amount = cu2.fishesAmounts[i];

                    double dAmount = Double.parseDouble(amount);

                    totalAmountPurchased += dAmount;

                    double dFinalTotalSold = dTotalSold + dAmount;
                    double dFinalRecentSold = dRecentSold + dAmount;

                    dc.updateColumn("fisheslist", "total_sold", cu2.fishesNames[i], dFinalTotalSold);
                    dc.updateColumn("fisheslist", "recent_sold", cu2.fishesNames[i], dFinalRecentSold);

                    if (cu2.getSellerID().equals("none")) {
                        dc.insertIntoTable(supplierViewTableName, cu2.fishesNames[i], cu2.fishesAmounts[i], cu2.fishesCost[i]);
                    }
                }

                //update colddrinks information
                for (int i = 0; i < cu2.getColddrinksCount(); ++i) {

                    String totalSold = dc.getColumn("colddrinkslist", "total_sold", cu2.colddrinksNames[i]);
                    String recentSold = dc.getColumn("colddrinkslist", "recent_sold", cu2.colddrinksNames[i]);

                    double dTotalSold = Double.parseDouble(totalSold);
                    double dRecentSold = Double.parseDouble(recentSold);

                    String amount = cu2.colddrinksAmounts[i];

                    double dAmount = Double.parseDouble(amount);

                    totalAmountPurchased += dAmount;

                    double dFinalTotalSold = dTotalSold + dAmount;
                    double dFinalRecentSold = dRecentSold + dAmount;

                    dc.updateColumn("colddrinkslist", "total_sold", cu2.colddrinksNames[i], dFinalTotalSold);
                    dc.updateColumn("colddrinkslist", "recent_sold", cu2.colddrinksNames[i], dFinalRecentSold);

                    if (cu2.getSellerID().equals("none")) {
                        dc.insertIntoTable(supplierViewTableName, cu2.colddrinksNames[i], cu2.colddrinksAmounts[i], cu2.colddrinksCost[i]);
                    }
                }

                //update cosmeticss information
                for (int i = 0; i < cu2.getCosmeticsCount(); ++i) {

                    String totalSold = dc.getColumn("cosmeticslist", "total_sold", cu2.cosmeticsNames[i]);
                    String recentSold = dc.getColumn("cosmeticslist", "recent_sold", cu2.cosmeticsNames[i]);

                    double dTotalSold = Double.parseDouble(totalSold);
                    double dRecentSold = Double.parseDouble(recentSold);

                    String amount = cu2.cosmeticsAmounts[i];

                    double dAmount = Double.parseDouble(amount);

                    totalAmountPurchased += dAmount;

                    double dFinalTotalSold = dTotalSold + dAmount;
                    double dFinalRecentSold = dRecentSold + dAmount;

                    dc.updateColumn("cosmeticslist", "total_sold", cu2.cosmeticsNames[i], dFinalTotalSold);
                    dc.updateColumn("cosmeticslist", "recent_sold", cu2.cosmeticsNames[i], dFinalRecentSold);

                    if (cu2.getSellerID().equals("none")) {
                        dc.insertIntoTable(supplierViewTableName, cu2.cosmeticsNames[i], cu2.cosmeticsAmounts[i], cu2.cosmeticsCost[i]);
                    }
                }

                //update others information
                for (int i = 0; i < cu2.getOthersCount(); ++i) {

                    String totalSold = dc.getColumn("otherslist", "total_sold", cu2.othersNames[i]);
                    String recentSold = dc.getColumn("otherslist", "recent_sold", cu2.othersNames[i]);

                    double dTotalSold = Double.parseDouble(totalSold);
                    double dRecentSold = Double.parseDouble(recentSold);

                    String amount = cu2.othersAmounts[i];

                    double dAmount = Double.parseDouble(amount);

                    totalAmountPurchased += dAmount;

                    double dFinalTotalSold = dTotalSold + dAmount;
                    double dFinalRecentSold = dRecentSold + dAmount;

                    dc.updateColumn("otherslist", "total_sold", cu2.othersNames[i], dFinalTotalSold);
                    dc.updateColumn("otherslist", "recent_sold", cu2.othersNames[i], dFinalRecentSold);

                    if (cu2.getSellerID().equals("none")) {
                        dc.insertIntoTable(supplierViewTableName, cu2.othersNames[i], cu2.othersAmounts[i], cu2.othersCost[i]);
                    }
                }

                cu2.totalAmountPurchased = totalAmountPurchased;
                cu2.totalCostOfPurchasedProducts = totalCostOfPurchasedProducts;
                
                if (request.getParameter("action") == null) {
                    int coinToBeAdded = (int) (totalCostOfPurchasedProducts / (double) dc.getCoinLimitValue());
                    System.out.println(coinToBeAdded);

                    coinToBeAdded *= dc.getCoinRate();
                    System.out.println(coinToBeAdded);
                    int userCoins = Integer.parseInt(dc.getColumn("usercoins", "coins", Integer.parseInt(cu2.getID())));
                    coinToBeAdded+=userCoins;
                    dc.coinsaveText(Integer.toString(coinToBeAdded), cu2.getID());
                }

                String previousBuys = dc.getColumn("userinfo", "total_purchased", Integer.parseInt(cu2.getID()));
                totalCostOfPurchasedProducts += Double.parseDouble(previousBuys);

                

                //if (failedFlag == 0) {
                dc.updateColumn("userinfo", "total_purchased", Integer.parseInt(cu2.getID()), totalCostOfPurchasedProducts);
                response.sendRedirect("UserOrderReceived.jsp");
            } else {
                response.sendRedirect("ReqFailed.jsp");
            }
        } else {
            response.sendRedirect("ReqFailed.jsp");
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
