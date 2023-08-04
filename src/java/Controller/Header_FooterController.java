package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import Model.Admin;
import Model.News;
import Model.NewsCategory;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;

/**
 *
 * @author mp3th
 */
public class Header_FooterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (req.getParameter("mod") != null) {
            if (req.getParameter("mod").equals("ChangeHeader")) {
                String json = req.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);

                // Convert the JSON data to a list of ordered items
                List<OrderItem> orderedList = new ArrayList<>();
                Type listType = new TypeToken<ArrayList<OrderItem>>() {
                }.getType();
                Gson gson = new Gson();
                orderedList = gson.fromJson(json, listType);
                List<News> data = new ArrayList<>();
                // Process the orderedList as needed
                for (OrderItem item : orderedList) {
                    // Perform your logic with each ordered item (content and title)
                    data.add(new News(item.getTitle(), item.getContent()));
                }
                News n = new News();
                n.ChangeHeader(data);
                // Send a response if necessary
                resp.setContentType("text/plain");

            }
            if (req.getParameter("mod").equals("EditHeader")) {
                String id = req.getParameter("id");
                String title = req.getParameter("title");
                String url = req.getParameter("url");
                News n = new News(id, title, url);
                n.updateHeader();
            }
            if (req.getParameter("mod").equals("EditFooter")) {
                String id = req.getParameter("id");
                String title = req.getParameter("title");
                String Content = req.getParameter("editor_text");
                String summary = req.getParameter("summary");
                int Category = Integer.parseInt(req.getParameter("Cate"));
                News n = new News(id, title, summary, Category, Content);
                n.updateFooter();
            }

        } else if (req.getParameter(
                "url") != null) {
            String url = req.getParameter("url");
            String title = req.getParameter("title");
            LocalDateTime currentDateTime = LocalDateTime.now();
            News n = new News(title, currentDateTime.toString(), "", session.getAttribute("id").toString(), "", url, 9);
            n.addHeader();
        } else {
            String title = req.getParameter("title");

            String editorContent = req.getParameter("editor_text");
            LocalDateTime currentDateTime = LocalDateTime.now();
            String summary = req.getParameter("summary");

            String imageName = "";

            int Category = Integer.parseInt(req.getParameter("Cate"));
            News n = new News(title, currentDateTime.toString(), "", session.getAttribute("id").toString(), "", imageName, editorContent, Category, summary);
            n.AddNews();

        }
        News n = new News();
        List<News> footer = n.getFooter();

        NewsCategory nc = new NewsCategory();
        List<NewsCategory> footerCate = nc.GetCategory(2);
        List<News> header = n.getHeader();
        List<News> contact = n.getContact();
        session.setAttribute("c", contact);
        req.setAttribute(
                "headerHA", header);
        req.setAttribute(
                "footer", footer);
        req.setAttribute(
                "footerCate", footerCate);
        req.getRequestDispatcher(
                "Header_FooterManagement.jsp").forward(req, resp);
    }

    private static class OrderItem {

        private String content;
        private String title;

        public OrderItem(String content, String title) {
            this.content = content;
            this.title = title;
        }

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        //Redirect if it doesn't have the permission
        if (session.getAttribute("mode") != null) {
            String mode = (String) session.getAttribute("mode");
            if (!mode.contains("5") && !mode.equals("0")) {
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
                }
            } else {
                System.out.println("run");
                if (req.getParameter("mod") != null) {
                    if (req.getParameter("mod").equals("Footer")) {
                        NewsCategory nc = new NewsCategory();
                        List<NewsCategory> footerCate = nc.GetCategory(2);
                        req.setAttribute("cate", footerCate);
                        req.getRequestDispatcher("AddFooter.jsp").forward(req, resp);
                    }
                    if (req.getParameter("mod").equals("Header")) {
                        req.getRequestDispatcher("AddHeader.jsp").forward(req, resp);
                    }
                    if (req.getParameter("mod").equals("Delete")) {
                        News n = new News();
                        int id = Integer.parseInt(req.getParameter("id"));
                        n.delete(id);
                        List<News> footer = n.getFooter();
                        List<News> header = n.getHeader();

                        NewsCategory nc = new NewsCategory();
                        List<NewsCategory> footerCate = nc.GetCategory(2);
                        List<News> contact = n.getContact();
                        req.setAttribute("c", contact);
                        req.setAttribute("footer", footer);
                        req.setAttribute("headerHA", header);
                        req.setAttribute("footerCate", footerCate);
                        req.getRequestDispatcher("Header_FooterManagement.jsp").forward(req, resp);
                    }
                    if (req.getParameter("mod").equals("Edit")) {
                        if (req.getParameter("section").equals("Header")) {
                            int id = Integer.parseInt(req.getParameter("id"));
                            News n = new News();
                            n.GetHeader(id);
                            req.setAttribute("h", n);
                            req.getRequestDispatcher("EditHeader.jsp").forward(req, resp);
                        }
                        if (req.getParameter("section").equals("Footer")) {
                            int id = Integer.parseInt(req.getParameter("id"));
                            News n = new News();
                            n.GetFooter(id);
                            req.setAttribute("f", n);
                            System.out.println(n.getContent());
                            NewsCategory nc = new NewsCategory();
                            List<NewsCategory> footerCate = nc.GetCategory(2);
                            req.setAttribute("cate", footerCate);
                            req.getRequestDispatcher("EditFooter.jsp").forward(req, resp);
                        }
                    }
                } else {
                    News n = new News();
                    List<News> footer = n.getFooter();
                    List<News> header = n.getHeader();

                    NewsCategory nc = new NewsCategory();
                    List<NewsCategory> footerCate = nc.GetCategory(2);
                    List<News> contact = n.getContact();
                    req.setAttribute("c", contact);
                    req.setAttribute("footer", footer);
                    req.setAttribute("headerHA", header);
                    req.setAttribute("footerCate", footerCate);
                    req.getRequestDispatcher("Header_FooterManagement.jsp").forward(req, resp);
                }
            }
        }

    }

}
