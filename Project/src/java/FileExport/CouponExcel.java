package FileExport;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.IOException;
import java.util.List;
import Model.Coupon;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import jakarta.servlet.ServletOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import org.apache.poi.hssf.record.PaletteRecord;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFSheet;

/**
 *
 * @author CAT PHUONG
 */
public class CouponExcel extends HttpServlet {

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
            out.println("<title>Servlet CouponExcel</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CouponExcel at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
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
        Coupon cou = new Coupon();
        List<Coupon> data = cou.getAllCoupon();
        try {
            //khai báo tên file muốn tạo

            //gọi phương thức creatSheet() và truyền tên file muốn tạo //tạo một đối tượng của lớp HSSFWorkbook
            HSSFWorkbook workbook = new HSSFWorkbook();
            //gọi phương thức creatSheet() và truyền tên file muốn tạo
            HSSFSheet sheet = workbook.createSheet("Coupon");
            //tạo hàng thứ 0 sử dụng phương thức createRow()
            HSSFRow rowhead = sheet.createRow((short) 0);
            //tạo ô bằng cách sử dụng phương thức createCell() và thiết lập giá trị cho ô bằng cách sử dụng phương thức setCellValue()
            rowhead.createCell(0).setCellValue("No");
            rowhead.createCell(1).setCellValue("Code");
            rowhead.createCell(2).setCellValue("Message");
            rowhead.createCell(3).setCellValue("Value");
            rowhead.createCell(4).setCellValue("Valid from");
            rowhead.createCell(5).setCellValue("Valid to");
//                rowhead.createCell(6).setCellValue("Status");
            int rownum = 1;
            //tạo hàng 
            for (Coupon c : data) {
                HSSFRow row = sheet.createRow(rownum);
                row.createCell(0).setCellValue(rownum);
                row.createCell(1).setCellValue(c.getName());
                row.createCell(2).setCellValue(c.getMessage());
                row.createCell(3).setCellValue(c.getValue());
                row.createCell(4).setCellValue(c.getValid_fromString());
                row.createCell(5).setCellValue(c.getValid_toString());
//                    row.createCell(5).setCellValue(c.getStatus());
                rownum++;
            }

            response.setContentType("text/xls");
            response.setHeader("Content-disposition", "attachment;filename=" + "Coupon" + ".xls");
            try ( ServletOutputStream fileOut = response.getOutputStream()) {
                workbook.write(fileOut);
                //đóng stream
                fileOut.close();
                //đóng workbook
                workbook.close();
            }

        } catch (IOException e) {

        }
        try ( PrintWriter out = response.getWriter()) {
            out.print("<script>\n"
                    + "  setTimeout(function() {\n"
                    + "      window.close()\n"
                    + "  }, 0);\n"
                    + "</script>");
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
