package SearchSeries;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import Model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CAT PHUONG
 */
public class CustomerSearch extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerSearch</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerSearch at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        System.out.println("post search");
        Customer customer = new Customer();
        String name = req.getParameter("Name");
        System.out.println(name);
        int choice = Integer.parseInt(req.getParameter("TypeofSort"));
        List<Customer> data = customer.searchCustomer(choice, name);
        if (!data.isEmpty()) {
            PrintWriter out = resp.getWriter();
            for (Customer s : data) {
                System.out.println("fuck");
                out.print("<tr>\n"
                        + "                                                    <td class=\"col-md-2\">" + s.getCustomerID() + "</td>\n"
                        + "                                                    <td>" + s.getCustomerName() + "</td>\n"
                        + "                                                    <td>" + s.getPhoneNumber() + "</td>\n"
                        + "                                                    <td class=\"col-md-3\" style=\"word-break: break-all\">" + s.getEmail() + "</td>\n"
                        + "                                                    <td class=\"col-md-3\" style=\"word-break: normal\">" + s.getAddress() + "</td>\n"
                        + "                                                    <td>" + s.getRegistrationDate() + "</td>\n"
                        + "                                                    <td class=\"col-md-4\" style=\"word-break: keep-all\">" + s.getDOB() + "</td>\n"
                        + "                                                    <td><button type=\"button\" class=\"btn btn-sm-square btn-warning m-2 btn-sm\" onclick=\"editCustomer('" + s.getCustomerID() + "', '1')\"><i class=\"fas fa-pen fa-xs\"></i></button>\n"
                        + "                                                        <button type=\"button\" class=\"btn btn-sm-square btn-danger m-2 btn-sm\" onclick=\"editCustomer('" + s.getCustomerID() + "', '2')\"><i class=\"bi bi-trash fa-xs\"></i></button>\n"
                        + "                                                        <button type=\"button\" class=\"btn btn-sm-square btn-info m-2 btn-sm\" onclick=\"orderList('" + s.getCustomerID() + "', '1')\"><i class=\"fas fa-info fa-xs\"></i></button>\n"
                        + "\n"
                        + "                                                </tr>");

            }
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
