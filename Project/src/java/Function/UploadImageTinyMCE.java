package Function;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.Collection;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UploadImageTinyMCE extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contentType = request.getContentType();
        if (contentType != null && contentType.contains("multipart/form-data")) {
            try {
                Collection<Part> parts = request.getParts();

                for (Part part : parts) {
                    String imageName = "image_" + System.currentTimeMillis() + ".jpg";
                    if (imageName != null && !imageName.isEmpty()) {
                        String uploadPath = getServletContext().getRealPath("") + "/uploads";
                        String uploadPath1 = getServletContext().getRealPath("") + "../../web/uploads";
                        part.write(uploadPath + File.separator + imageName);
                        part.write(uploadPath1 + File.separator + imageName);
                        // Trả về URL của ảnh đã tải lên
                        String imageUrl = request.getContextPath() + "/uploads/" + imageName;
                        response.setContentType("application/json");
                        response.getWriter().write("{\"location\": \"" + imageUrl + "\"}");
                        return;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"error\": \"" + e.getMessage() + "\"}");
            }
        }

        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        response.getWriter().write("{\"error\": \"No file data found\"}");
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");

        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }

        return null;
    }
}
