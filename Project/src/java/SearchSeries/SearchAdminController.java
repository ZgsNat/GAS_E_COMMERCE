/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package SearchSeries;

import Model.Admin;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author minhn
 */
public class SearchAdminController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Admin> admin = new ArrayList<>();
        if (req.getParameter("category") != null) {
            Admin a = new Admin();
            int choice = Integer.parseInt(req.getParameter("category"));
            switch (choice) {
                case 0:
                    admin = a.getEmployeeList();
                    break;
                case 1:
                    if (req.getParameter("txtSearch") != null) {
                        if (checkInteger(req.getParameter("txtSearch"))) {
                            int id = Integer.parseInt(req.getParameter("txtSearch"));
                            admin = a.getEmployeeById(id);
                        }
                    }
                    break;
                case 2:
                    if (req.getParameter("txtSearch") != null) {
                        String search = req.getParameter("txtSearch");
                        admin = a.getEmpployeebyName(search);
                    }
                    break;
                case 3:
                    if (req.getParameter("txtSearch") != null) {
                        String search = req.getParameter("txtSearch");
                        admin = a.getEmpployeebyPhone(search);
                    }
                    break;
                case 4:
                    if (req.getParameter("txtSearch") != null) {
                        String search = req.getParameter("txtSearch");
                        admin = a.getEmpployeebyEmail(search);
                    }
                    break;
            }
            req.setAttribute("admin", admin);
            req.getRequestDispatcher("Employee.jsp").forward(req, resp);
        } else {
            req.setAttribute("admin", admin);
            req.getRequestDispatcher("Employee.jsp").forward(req, resp);
        }
    }

    private boolean checkInteger(String search) {
        try {
            int a = Integer.parseInt(search);
        } catch (Exception e) {
            System.out.println("Invalid input");
            return false;
        }
        return true;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        
        
        req.setCharacterEncoding("UTF-8");
        String txtSearch = "";
        if(req.getParameter("txt")!=null){
            txtSearch = req.getParameter("txt");
        }
        int pageNumber = 1;
        if(req.getParameter("page")!=null){
            pageNumber = Integer.parseInt(req.getParameter("page"));
        }
        int pageSize = 5;
        System.out.println(txtSearch);
        String categoryIdParam = req.getParameter("category");
        int categoryId = 0;
        if (categoryIdParam != null) {
            categoryId = Integer.parseInt(categoryIdParam);
        }
        System.out.println(categoryId);
        Admin a = new Admin();
        List<Admin> admin = new ArrayList<>();
        switch (categoryId) {
            case 0:
                admin = a.getEmployeeList();
                break;
            case 1:
                int id = Integer.parseInt(txtSearch);
                admin = a.getEmployeeById(id);
                break;
            case 2:
                admin = a.getEmpployeebyName(txtSearch);
                break;
            case 3:
                admin = a.getEmpployeebyPhone(txtSearch);
                break;
            case 4:
                admin = a.getEmpployeebyEmail(txtSearch);
                break;
        }
        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, admin.size());
        List<Admin> currentPageAdmin = admin.subList(startIndex, endIndex);
        String tableRows = "<div class=\"table-responsive\">\n" +
"                                        <form action=\"employee\" method=\"post\" id=\"frm\">\n" +
"                                            <table class=\"table text-start align-middle table-bordered table-hover mb-0\">\n" +
"                                                <thead>\n" +
"                                                    <tr class=\"text-dark\">\n" +
"                                                        <th scope=\"col\">Employee ID</th>\n" +
"                                                        <th scope=\"col\">Name</th>\n" +
"                                                        <th scope=\"col\">Phone</th>\n" +
"                                                        <th scope=\"col\">Email</th>\n" +
"                                                        <th scope=\"col\">Address</th>\n" +
"                                                        <th scope=\"col\">Access</th>\n" +
"                                                        <th scope=\"col\">Submit</th>\n" +
"                                                    </tr>\n" +
"                                                </thead>\n" +
"                                                <tbody>\n";

        for (Admin item : currentPageAdmin) {
            tableRows
                    += "                                                    <tr>\n"
                    + "                                                        <td>" + item.getId() + "</td>\n"
                    + "                                                        <td>" + item.getName() + "</td>\n"
                    + "                                                        <td>" + item.getPhone() + "</td>\n"
                    + "                                                        <td>" + item.getEmail() + "</td>\n"
                    + "                                                        <td>" + item.getAddress() + "</td>\n"
                    + "                                                        <td>\n";

            //general, product, coupon
            boolean check1 = false, check2 = false, check3 = false, check4 = false, check5 = false, check6 = false;
            for (String role : item.getRoles()) {
                if (role.equalsIgnoreCase("General Page") && check1 != true) {
                    check1 = true;
                }

                if (role.equalsIgnoreCase("ProductInfo Page") && check2 != true) {
                    check2 = true;
                }

                if (role.equalsIgnoreCase("CustomerList Page") && check3 != true) {
                    check3 = true;
                }

                if (role.equalsIgnoreCase("Coupon Page") && check4 != true) {
                    check4 = true;
                }

                if (role.equalsIgnoreCase("News Page") && check5 != true) {
                    check5 = true;
                }

                if (role.equalsIgnoreCase("Employees Page") && check6 != true) {
                    check6 = true;
                }
            }

            if (check1) {
                tableRows += "<input type=\"checkbox\" value=\"true\" name =\"" + item.getId() + "_General_Page\" checked=\"checked\"/> General Page<br/>\n";
            } else {
                tableRows += "<input type=\"checkbox\" value=\"true\" name =\"" + item.getId() + "_General_Page\"/> General Page<br/>\n";
            }

            if (check2) {
                tableRows += "<input type=\"checkbox\" value=\"true\" name =\"" + item.getId() + "_ProductInfo_Page\" checked=\"checked\"/> ProductInfo Page<br/>\n";
            } else {
                tableRows += "<input type=\"checkbox\" value=\"true\" name =\"" + item.getId() + "_ProductInfo_Page\"/> ProductInfo Page<br/>\n";
            }

            if (check3) {
                tableRows += "<input type=\"checkbox\" value=\"true\" name =\"" + item.getId() + "_CustomerList_Page\" checked=\"checked\"/> CustomerList Page<br/>\n";
            } else {
                tableRows += "<input type=\"checkbox\" value=\"true\" name =\"" + item.getId() + "_CustomerList_Page\"/> CustomerList Page<br/>\n";
            }

            if (check4) {
                tableRows += "<input type=\"checkbox\" value=\"true\" name =\"" + item.getId() + "_Coupon_Page\" checked=\"checked\"/> Coupon Page<br/>\n";
            } else {
                tableRows += "<input type=\"checkbox\" value=\"true\" name =\"" + item.getId() + "_Coupon_Page\"/> Coupon Page<br/>\n";
            }

            if (check5) {
                tableRows += "<input type=\"checkbox\" value=\"true\" name =\"" + item.getId() + "_News_Page\" checked=\"checked\"/> News Page<br/>\n";
            } else {
                tableRows += "<input type=\"checkbox\" value=\"true\" name =\"" + item.getId() + "_News_Page\"/> News Page<br/>\n";
            }

            if (check6) {
                tableRows += "<input type=\"checkbox\" value=\"true\" name =\"" + item.getId() + "_Employees_Page\" checked=\"checked\"/> Employees Page<br/>\n";
            } else {
                tableRows += "<input type=\"checkbox\" value=\"true\" name =\"" + item.getId() + "_Employees_Page\"/> Employees Page<br/>\n";
            }

            tableRows += "                                                        </td>\n"
                    + "                                                        <td>\n"
                    + "                                                            <input type=\"submit\" class=\"btn btn-sm btn-primary\" value=\"Update\" name=\"submit\"><br><br>\n" +
"                                                                                  <a class=\"btn btn-sm btn-primary\" href=\"employee?id=" + item.getId() + "\" name=\"delete\">Delete</a>\n"
                    + "                                                        </td>\n"
                    + "                                                    </tr>\n";
            
        }
        tableRows += "                          </tbody>\n" +
"                                            </table>\n" +
"                                        </form> \n" +
"                                    </div>\n";
        tableRows += "<nav aria-label=\"Page navigation\">\n"
                + "                                                    <ul class=\"pagination justify-content-center\">\n";
        int totalPages = (int) Math.ceil((double) admin.size() / pageSize);
        for (int i = 1; i <= totalPages; i++) {
            if (pageNumber == i) {
                tableRows += "<li class=\"page-item active\">\n";
            } else {
                tableRows += "<li class=\"page-item \">\n";
            }
            tableRows += "                                                                <a class=\"page-link\" onclick=\"goToPage(" + i + ")\"\n"
                    + "                                                                   >" + i + "</a>\n"
                    + "                                                            </li>\n";

        }
        tableRows += "</ul>\n"
                + "                                                </nav>";
        ResponseData responseData = new ResponseData(tableRows, totalPages);

        // Convert the response object to JSON
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(responseData);

        // Send the JSON response
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(jsonResponse);
    }

    class ResponseData {

        private String tableRows;
        private int totalPages;

        public ResponseData(String tableRows, int totalPages) {
            this.tableRows = tableRows;
            this.totalPages = totalPages;
        }

        public String getTableRows() {
            return tableRows;
        }

        public int getTotalPages() {
            return totalPages;
        }
    }
}