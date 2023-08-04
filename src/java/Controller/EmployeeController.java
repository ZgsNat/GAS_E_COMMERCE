/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Admin;
import Model.News;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author minhn
 */
public class EmployeeController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("submit") != null) {
            Admin a = new Admin();
            //Find out the id of the admin's role in which we would change
            int adminSize = a.getAdminSize();
            int adminTotal[] = new int[adminSize];
            adminTotal = a.getAllAdminID(adminSize);

            //lay ra phan role cua admin
            for (int id : adminTotal) {
                String temp = "";
                if (req.getParameter(id + "_General_Page") != null) {
                    temp += "1";
                }
                if (req.getParameter(id + "_ProductInfo_Page") != null) {
                    temp += "2";
                }
                if (req.getParameter(id + "_CustomerList_Page") != null) {
                    temp += "3";
                }
                if (req.getParameter(id + "_Coupon_Page") != null) {
                    temp += "4";
                }
                if (req.getParameter(id + "_News_Page") != null) {
                    temp += "5";
                }
                if (req.getParameter(id + "_Employees_Page") != null) {
                    temp += "6";
                }
                if (temp.length() == 6) {
                    temp = "0";
                }
                //Update role cu bang role moi lay du lieu dua tren Admin ID
                a.setId(id);
                a.updateRole(temp);
            }
            //Redirect back to the previous page 
            resp.sendRedirect("employee");
        } else if (req.getParameter("delete") != null) {
            int id = 0;
            id = Integer.parseInt(req.getParameter("delete"));
            String page = req.getParameter("page");
            if (page == null) {
                page = "1";
            }
            int indexPage = Integer.parseInt(page);
            List<Admin> admin = new ArrayList<>();
            Admin a = new Admin();
            admin = a.getEmployeeList(indexPage);
            int endPage = a.getNumberPage();
            

            a.setId(id);
            a.deleteAdmin(id);
            //Redirect back to the previous page 
            req.setAttribute("endPage", endPage);
            req.setAttribute("page", indexPage);
            req.setAttribute("admin", admin);
            req.getRequestDispatcher("Employee.jsp").forward(req, resp);

        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("mode") != null) {
            String mode = (String) session.getAttribute("mode");
            if (!mode.equals("0")) {
                if (mode.contains("1")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("general").forward(req, resp);
                } else if (mode.contains("2")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("productInfo").forward(req, resp);
                } else if (mode.contains("3")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("customerInfo").forward(req, resp);
                } else if (mode.contains("4")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("coupon_admin").forward(req, resp);
                } else if (mode.contains("5")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("news").forward(req, resp);
                }
            } else {
                String page = req.getParameter("page");
                if (page == null) {
                    page = "1";
                }

                if (req.getParameter("submit") != null) {

                    //Find out the id of the admin's role in which we would change
                    int id = 0;
                    if (req.getParameter("id") != null) {
                        id = Integer.parseInt(req.getParameter("id"));
                    }

                    //lay ra phan role cua admin
                    String temp = "";
                    if (req.getParameter(id + "_General_Page") != null) {
                        temp += "1";
                    }
                    if (req.getParameter(id + "_ProductInfo_Page") != null) {
                        temp += "2";
                    }
                    if (req.getParameter(id + "_CustomerList_Page") != null) {
                        temp += "3";
                    }
                    if (req.getParameter(id + "_Coupon_Page") != null) {
                        temp += "4";
                    }
                    if (req.getParameter(id + "_News_Page") != null) {
                        temp += "5";
                    }
                    if (req.getParameter(id + "_Employees_Page") != null) {
                        temp += "6";
                    }
                    if (temp.length() == 6) {
                        temp = "0";
                    }

                    //Update role cu bang role moi lay du lieu dua tren Admin ID
                    Admin a = new Admin();
                    a.setId(id);
                    a.updateRole(temp);

                    //Redirect back to the previous page 
                    resp.sendRedirect("employee");
                } else if (req.getParameter("id") != null) {
                    int id = 0;
                    id = Integer.parseInt(req.getParameter("id"));
                    Admin a = new Admin();
                    a.setId(id);
                    a.deleteAdmin(id);
                }

                int indexPage = Integer.parseInt(page);
                List<Admin> admin = new ArrayList<>();
                Admin a = new Admin();
                admin = a.getEmployeeList(indexPage);
                int endPage = a.getNumberPage();
                req.setAttribute("endPage", endPage);
                req.setAttribute("page", indexPage);
                req.setAttribute("admin", admin);
                req.getRequestDispatcher("Employee.jsp").forward(req, resp);
            }
        }

    }
}