/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 *
 * @author myth
 */
public class News {

    String id;
    String title;
    String CreateDate;
    String ModifyDate;
    String CreateBy;
    String ModifyBy;
    String Image;
    String CategoryName;
    String Content;
    int CategoryID;
    String Summary;

    public News(String id, String title, int categoryId) {
        this.id = id;
        this.title = title;
        this.CategoryID = categoryId;
    }
    public News(String id, String title, String image,String content) {
        this.id = id;
        this.title = title;
        this.Image = image;
        this.Content = content;
    }

    public News(String id, String title, String content) {
        this.id = id;
        this.title = title;
        this.Content = content;
    }

    public News(String title, String content) {

        this.title = title;
        this.Content = content;
    }

    public String getSummary() {
        return Summary;
    }

    public void setSummary(String Summary) {
        this.Summary = Summary;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public News() {
        connect();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public News(String id, String title, String CreateDate, String ModifiDate, String CreateBy, String ModifyBy, String Image, String Content, int CategoryID) {
        this.id = id;
        this.title = title;
        this.CreateDate = CreateDate;
        this.ModifyDate = ModifiDate;
        this.CreateBy = CreateBy;
        this.ModifyBy = ModifyBy;
        this.Image = Image;
        this.Content = Content;
        this.CategoryID = CategoryID;
    }

    public News(String title, String CreateDate, String ModifiDate, String CreateBy, String ModifyBy, String Content, int CategoryID) {
        this.id = id;
        this.title = title;
        this.CreateDate = CreateDate;
        this.ModifyDate = ModifiDate;
        this.CreateBy = CreateBy;
        this.ModifyBy = ModifyBy;
        this.Image = Image;
        this.Content = Content;
        this.CategoryID = CategoryID;
    }

    public News(String id, String title, String Summary, int CategoryID, String Content) {
        this.id = id;
        this.title = title;
        this.Summary = Summary;
        this.Content = Content;
        this.CategoryID = CategoryID;
    }

    public News(String title, String CreateDate, String ModifiDate, String CreateBy, String ModifyBy, String Image, String Content, int CategoryID) {
        this.title = title;
        this.CreateDate = CreateDate;
        this.ModifyDate = ModifiDate;
        this.CreateBy = CreateBy;
        this.ModifyBy = ModifyBy;
        this.Image = Image;
        this.Content = Content;
        this.CategoryID = CategoryID;
    }

    public News(String title, String CreateDate, String ModifiDate, String CreateBy, String ModifyBy, String Image, String Content, int CategoryID, String Summary) {
        this.title = title;
        this.CreateDate = CreateDate;
        this.ModifyDate = ModifiDate;
        this.CreateBy = CreateBy;
        this.ModifyBy = ModifyBy;
        this.Image = Image;
        this.Content = Content;
        this.CategoryID = CategoryID;
        this.Summary = Summary;
    }

    public News(String id, String title, String CreateDate, String ModifiDate, String CreateBy, String ModifyBy, String Image, String Content, int CategoryID, String CategoryName) {
        this.id = id;
        this.title = title;
        this.CreateDate = CreateDate;
        this.ModifyDate = ModifiDate;
        this.CreateBy = CreateBy;
        this.ModifyBy = ModifyBy;
        this.Image = Image;
        this.Content = Content;
        this.CategoryID = CategoryID;
        this.CategoryName = CategoryName;
    }

    public News(String id, String title, String CreateDate, String ModifiDate, String CreateBy, String ModifyBy, String Image, String Content, int CategoryID, String CategoryName, String summary) {
        this.id = id;
        this.title = title;
        this.CreateDate = CreateDate;
        this.ModifyDate = ModifiDate;
        this.CreateBy = CreateBy;
        this.ModifyBy = ModifyBy;
        this.Image = Image;
        this.Content = Content;
        this.CategoryID = CategoryID;
        this.CategoryName = CategoryName;
        this.Summary = summary;
    }

    public News(String id, String title, String CreateDate, String ModifiDate, String CreateBy, String ModifyBy, String Content, int CategoryID, String CategoryName, String Summary) {
        this.id = id;
        this.title = title;
        this.CreateDate = CreateDate;
        this.ModifyDate = ModifiDate;
        this.CreateBy = CreateBy;
        this.ModifyBy = ModifyBy;
        this.Content = Content;
        this.CategoryID = CategoryID;
        this.CategoryName = CategoryName;
        this.Summary = Summary;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(String CreateDate) {
        this.CreateDate = CreateDate;
    }

    public String getModifyDate() {
        return ModifyDate;
    }

    public void setModifyDate(String ModifyDate) {
        this.ModifyDate = ModifyDate;
    }

    public String getCreateBy() {
        return CreateBy;
    }

    public void setCreateBy(String CreateBy) {
        this.CreateBy = CreateBy;
    }

    public String getModifyBy() {
        return ModifyBy;
    }

    public void setModifyBy(String ModifyBy) {
        this.ModifyBy = ModifyBy;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    Connection cnn; //ket noi
    Statement stm; //thuc thi cac cau lenh sql
    PreparedStatement pstm;
    ResultSet rs; //luu tru va xu ly du lieu

    private void connect() {
        try {
            cnn = (new DBContext()).connection;
            if (cnn != null) {
                System.out.println("Connect success");
            } else {
                System.out.println("Connect fail!");
            }
        } catch (Exception e) {
        }
    }

    public void AddNews() {
        try {
            cnn = (new DBContext()).connection;
            String strSelect = "insert into News (Title,CreatedDate,CreatedBy,Content,CategoryID,NewsImage,Summary) values (?,?,?,?,?,?,?)";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, title);
            pstm.setString(2, CreateDate);
            pstm.setString(3, CreateBy);
            pstm.setString(4, Content);
            pstm.setInt(5, CategoryID);
            pstm.setString(6, Image);
            pstm.setString(7, Summary);

            pstm.execute();

        } catch (Exception e) {
            System.out.println("checkAdd:" + e.getMessage());
        }

    }

    public int getNumberPage() {

        String strSelect = "select count(*) from News n join News_Category nc on n.CategoryID=nc.CategoryID where nc.Type=3";
        try {
            cnn = (new DBContext()).connection;
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = total % 2 == 0 ? total / 2 : (total / 2 + 1);
                return countPage;
            }
        } catch (Exception e) {
            System.out.println("getNewsAll(): " + e.getMessage());
        }
        return 0;
    }

    public ArrayList<News> GetNewsPage(int index) {
        cnn = (new DBContext()).connection;
        ArrayList<News> data = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        try {
            String strSelect = "select n.NewsID,n.Title,n.CategoryID,n.CreatedDate,n.ModifiedDate,n.CreatedBy,n.ModifiedBy,n.NewsImage,n.Content,nc.CategoryName,n.Summary from News n join News_Category nc on n.CategoryID=nc.CategoryID where nc.Type=3  ORDER BY n.CreatedDate DESC OFFSET ? ROWS FETCH FIRST 2 ROWS ONLY";

            pstm = cnn.prepareStatement(strSelect);

            pstm.setInt(1, (index - 1) * 2);

            rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                int categoryId = rs.getInt(3);
                Timestamp createDate = rs.getTimestamp(4);
                Timestamp ModifiDate = rs.getTimestamp(5);
                String createBy = rs.getString(6);
                String ModifyBy = rs.getString(7);
                String Image = rs.getString(8);
                String content = rs.getString("Content");
                String categoryName = rs.getString(10);
                String summary = rs.getString(11);
                data.add(new News(id, title, (createDate != null) ? sdf.format(createDate) : "N/A", (ModifiDate != null) ? sdf.format(ModifiDate) : "N/A", createBy, ModifyBy, Image, content, categoryId, categoryName, summary));
            }

        } catch (Exception e) {
            System.out.println("getNewsAll(): " + e.getMessage());
        }

        return data;

    }

    public ArrayList<News> GetNews() {
        cnn = (new DBContext()).connection;
        ArrayList<News> data = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        try {
            String strSelect = "select * from News ORDER BY CreatedDate desc";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                int categoryId = rs.getInt(3);
                Timestamp createDate = rs.getTimestamp(4);
                Timestamp ModifiDate = rs.getTimestamp(5);
                String createBy = rs.getString(6);
                String ModifyBy = rs.getString(7);
                String Image = rs.getString(8);
                String content = rs.getString("Content");
                data.add(new News(id, title, (createDate != null) ? sdf.format(createDate) : "N/A", (ModifiDate != null) ? sdf.format(ModifiDate) : "N/A", createBy, ModifyBy, Image, content, categoryId));
            }

        } catch (Exception e) {
            System.out.println("getNewsAll(): " + e.getMessage());
        }

        return data;

    }

    public ArrayList<News> GetNewsByCategory(int Category, int page) {
        cnn = (new DBContext()).connection;
        ArrayList<News> data = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        try {
            String strSelect = "select n.NewsID,n.Title,n.CategoryID,n.CreatedDate,n.ModifiedDate,n.CreatedBy,n.ModifiedBy,n.NewsImage,n.Content,nc.CategoryName,n.Summary from News n join News_Category nc on n.CategoryID=nc.CategoryID where n.CategoryID=? and nc.Type=3  ORDER BY n.CreatedDate desc OFFSET ? ROWS FETCH FIRST 2 ROWS ONLY";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, Category);
            pstm.setInt(2, (page - 1) * 2);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                int categoryId = rs.getInt(3);
                Timestamp createDate = rs.getTimestamp(4);
                Timestamp ModifiDate = rs.getTimestamp(5);
                String createBy = rs.getString(6);
                String ModifyBy = rs.getString(7);
                String Image = rs.getString(8);
                String content = rs.getString("Content");
                String categoryName = rs.getString(10);
                String summary = rs.getString(11);
                data.add(new News(id, title, (createDate != null) ? sdf.format(createDate) : "N/A", (ModifiDate != null) ? sdf.format(ModifiDate) : "N/A", createBy, ModifyBy, Image, content, categoryId, categoryName, summary));
            }

        } catch (Exception e) {
            System.out.println("getNewsCategory(): " + e.getMessage());
        }

        return data;
    }
    public ArrayList<News> GetNewsByCategoryClient(int Category, int page) {
        cnn = (new DBContext()).connection;
        ArrayList<News> data = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        try {
            String strSelect = "select n.NewsID,n.Title,n.CategoryID,n.CreatedDate,n.ModifiedDate,n.CreatedBy,n.ModifiedBy,n.NewsImage,n.Content,nc.CategoryName,n.Summary from News n join News_Category nc on n.CategoryID=nc.CategoryID where n.CategoryID=?  ORDER BY n.CreatedDate desc OFFSET ? ROWS FETCH FIRST 2 ROWS ONLY";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, Category);
            pstm.setInt(2, (page - 1) * 2);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                int categoryId = rs.getInt(3);
                Timestamp createDate = rs.getTimestamp(4);
                Timestamp ModifiDate = rs.getTimestamp(5);
                String createBy = rs.getString(6);
                String ModifyBy = rs.getString(7);
                String Image = rs.getString(8);
                String content = rs.getString("Content");
                String categoryName = rs.getString(10);
                String summary = rs.getString(11);
                data.add(new News(id, title, (createDate != null) ? sdf.format(createDate) : "N/A", (ModifiDate != null) ? sdf.format(ModifiDate) : "N/A", createBy, ModifyBy, Image, content, categoryId, categoryName, summary));
            }

        } catch (Exception e) {
            System.out.println("getNewsCategory(): " + e.getMessage());
        }

        return data;
    }

    public int getNumberPage1(String id) {

        String strSelect = "select count(*) from News n join News_Category nc on n.CategoryID=nc.CategoryID where nc.Type=3 and n.CategoryID = ? ";
        try {
            cnn = (new DBContext()).connection;
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = total % 2 == 0 ? total / 2 : (total / 2 + 1);
                return countPage;
            }
        } catch (Exception e) {
            System.out.println("getNewsAll(): " + e.getMessage());
        }
        return 0;
    }

    public void GetNews(String id) {
        cnn = (new DBContext()).connection;
        try {
            String strSelect = "select n.NewsID,n.Title,n.CategoryID,n.CreatedDate,a.AdminName,n.NewsImage,n.Content,nc.CategoryName,n.Summary \n"
                    + "from News n join Admin a on n.CreatedBy=a.AdminID \n"
                    + "join News_Category nc on n.CategoryID=nc.CategoryID \n"
                    + "where n.NewsID=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                this.id = id;
                title = rs.getString(2);
                CategoryID = rs.getInt(3);
                CreateDate = rs.getString(4);
                CreateBy = rs.getString(5);
                Image = rs.getString(6);
                Content = rs.getString(7);
                CategoryName = rs.getString(8);
                Summary = rs.getString(9);
            }

        } catch (Exception e) {
            System.out.println("getNews(): " + e.getMessage());
        }
    }

    public void update() {
        cnn = (new DBContext()).connection;
        try {
            String strSelect = "update News set Title=? ,Content=?, ModifiedDate=?,ModifiedBy=?,NewsImage=?  where NewsID=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, title);
            pstm.setString(2, Content);
            pstm.setString(3, ModifyDate);
            pstm.setString(4, ModifyBy);
            pstm.setString(5, Image);
            pstm.setString(6, id);
            pstm.executeQuery();

        } catch (Exception e) {
            System.out.println("Update(): " + e.getMessage());
        }
    }

    public void delete(int id) {
        cnn = (new DBContext()).connection;
        try {
            String strSelect = "delete from News where NewsID=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, id);
            pstm.executeQuery();

        } catch (Exception e) {
            System.out.println("Delete(): " + e.getMessage());
        }
    }

    public List<News> search(String txtSearch) {
        cnn = (new DBContext()).connection;
        List<News> data = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        try {
            String strSelect = "select * from News where Title like ? ORDER BY CreatedDate desc";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, "%" + txtSearch + "%");
            rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                int categoryId = rs.getInt(3);
                Timestamp createDate = rs.getTimestamp(4);
                Timestamp ModifiDate = rs.getTimestamp(5);
                String createBy = rs.getString(6);
                String ModifyBy = rs.getString(7);
                String Image = rs.getString(8);
                String content = rs.getString("Content");
                data.add(new News(id, title, (createDate != null) ? sdf.format(createDate) : "N/A", (ModifiDate != null) ? sdf.format(ModifiDate) : "N/A", createBy, ModifyBy, Image, content, categoryId));
            }

        } catch (Exception e) {
            System.out.println("getNewsAll(): " + e.getMessage());
        }

        return data;

    }

    public List<News> search(String txtSearch, int categoryId) {
        cnn = (new DBContext()).connection;
        List<News> data = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        try {
            String strSelect;

            if (categoryId == 0) {
                strSelect = "SELECT * FROM News n join News_Category nc on n.CategoryID=nc.CategoryID where nc.Type=3 and n.Title LIKE ? ORDER BY n.CreatedDate DESC";
                pstm = cnn.prepareStatement(strSelect);
                pstm.setString(1, "%" + txtSearch + "%");
            } else {
                strSelect = "SELECT * FROM News n join News_Category nc on n.CategoryID=nc.CategoryID where nc.Type=3 and n.Title LIKE ? AND n.CategoryID = ? ORDER BY n.CreatedDate DESC";
                pstm = cnn.prepareStatement(strSelect);
                pstm.setString(1, "%" + txtSearch + "%");
                pstm.setInt(2, categoryId);
            }

            rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                int dbCategoryId = rs.getInt(3);
                Timestamp createDate = rs.getTimestamp(4);
                Timestamp modifyDate = rs.getTimestamp(5);
                String createBy = rs.getString(6);
                String modifyBy = rs.getString(7);
                String image = rs.getString(8);
                String content = rs.getString("Content");
                data.add(new News(id, title, (createDate != null) ? sdf.format(createDate) : "N/A", (modifyDate != null) ? sdf.format(modifyDate) : "N/A", createBy, modifyBy, image, content, dbCategoryId));
            }
        } catch (Exception e) {
            System.out.println("search&sort(): " + e.getMessage());
        }

        return data;
    }

    public ArrayList<News> GetNewsByCategory(int Category) {
        cnn = (new DBContext()).connection;
        ArrayList<News> data = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        try {
            String strSelect = "select * from News where CategoryID=? ORDER BY CreatedDate desc";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, Category);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                int categoryId = rs.getInt(3);
                Timestamp createDate = rs.getTimestamp(4);
                Timestamp ModifiDate = rs.getTimestamp(5);
                String createBy = rs.getString(6);
                String ModifyBy = rs.getString(7);
                String Image = rs.getString(8);
                String content = rs.getString("Content");
                data.add(new News(id, title, (createDate != null) ? sdf.format(createDate) : "N/A", (ModifiDate != null) ? sdf.format(ModifiDate) : "N/A", createBy, ModifyBy, Image, content, categoryId));
            }

        } catch (Exception e) {
            System.out.println("getNewsCategory(): " + e.getMessage());
        }

        return data;
    }

    @Override
    public String toString() {
        return "News{" + "id=" + id + ", title=" + title + ", CreateDate=" + CreateDate + ", ModifyDate=" + ModifyDate + ", CreateBy=" + CreateBy + ", ModifyBy=" + ModifyBy + ", Image=" + Image + ", Content=" + Content + ", CategoryID=" + CategoryID + '}';
    }

    public ArrayList<News> getFooter() {
        cnn = (new DBContext()).connection;
        ArrayList<News> data = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        try {
            String strSelect = "select n.NewsID,n.Title,n.CategoryID\n"
                    + "from News n  join News_Category nc on n.CategoryID=nc.CategoryID  \n"
                    + "where nc.Type = 2 ";
            pstm = cnn.prepareStatement(strSelect);

            rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                int categoryId = rs.getInt(3);

                data.add(new News(id, title, categoryId));
            }

        } catch (Exception e) {
            System.out.println("getFooter(): " + e.getMessage());
        }
        return data;
    }

     public String slugify() {
        // Loại bỏ các ký tự không hợp lệ và dấu
        String noAccent = Normalizer.normalize(title, Normalizer.Form.NFD)
                .replaceAll("[^\\p{ASCII}]", "");

        // Chuyển đổi thành chữ thường
        String lowerCase = noAccent.toLowerCase();

        // Thay thế khoảng trắng bằng dấu gạch ngang
        String slug = lowerCase.replaceAll("\\s+", "-");

        // Xử lý trường hợp có nhiều dấu gạch ngang liền nhau
        slug = slug.replaceAll("-{2,}", "-");

        return slug;
    }

    public void addHeader() {
        try {
            cnn = (new DBContext()).connection;
            String strSelect = "insert into News (Title,CreatedDate,CreatedBy,Content,CategoryID) values (?,?,?,?,?)";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, title);
            pstm.setString(2, CreateDate);
            pstm.setString(3, CreateBy);
            pstm.setString(4, Content);
            pstm.setInt(5, CategoryID);

            pstm.execute();

        } catch (Exception e) {
            System.out.println("checkAdd:" + e.getMessage());
        }

    }

    public List<News> getHeader() {
        cnn = (new DBContext()).connection;
        ArrayList<News> data = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        try {
            String strSelect = "select n.NewsID,n.Title,n.Content\n"
                    + "from News n  join News_Category nc on n.CategoryID=nc.CategoryID  \n"
                    + "where nc.Type = 1 ";
            pstm = cnn.prepareStatement(strSelect);

            rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                String content = rs.getString(3);

                data.add(new News(id, title, content));
            }

        } catch (Exception e) {
            System.out.println("getFooter(): " + e.getMessage());
        }
        return data;
    }

    public void ChangeHeader(List<News> data) {
        try {
            cnn = (new DBContext()).connection;
            String strSelect = "delete from News where CategoryID = 9";
            pstm = cnn.prepareStatement(strSelect);
            pstm.execute();

        } catch (Exception e) {
            System.out.println("checkChange:" + e.getMessage());
        }
        try {
            String strSelect = "INSERT INTO News (Title,Content,CategoryID) values (?,?,9)";
            pstm = cnn.prepareStatement(strSelect);

            for (News obj : data) {
                // Thiết lập các tham số trong câu lệnh SQL dựa trên đối tượng hiện tại
                pstm.setString(1, obj.getTitle());
                pstm.setString(2, obj.getContent());

                pstm.executeUpdate();
            }

            System.out.println("Thêm dữ liệu thành công!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void GetHeader(int id) {
        cnn = (new DBContext()).connection;

        try {
            String strSelect = "select n.NewsID,n.Title,n.Content\n"
                    + "from News n  join News_Category nc on n.CategoryID=nc.CategoryID  \n"
                    + "where nc.Type = 1 and n.NewsID = ? ";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                this.id = rs.getString(1);
                title = rs.getString(2);
                Content = rs.getString(3);
            }

        } catch (Exception e) {
            System.out.println("getFooter(): " + e.getMessage());
        }

    }

    public void GetFooter(int id) {
        cnn = (new DBContext()).connection;

        try {
            String strSelect = "select n.NewsID,n.Title,n.Content,n.Summary,n.CategoryID\n"
                    + "from News n  join News_Category nc on n.CategoryID=nc.CategoryID  \n"
                    + "where nc.Type = 2 and n.NewsID = ? ";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                this.id = rs.getString(1);
                title = rs.getString(2);
                Content = rs.getString(3);
                Summary = rs.getString(4);
                CategoryID = rs.getInt(5);
            }

        } catch (Exception e) {
            System.out.println("getFooter(): " + e.getMessage());
        }
    }

    public void updateHeader() {
        cnn = (new DBContext()).connection;
        try {
            String strSelect = "update News set Title=? ,Content=? where NewsID=? and CategoryID=9";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, title);
            pstm.setString(2, Content);
            pstm.setString(3, id);
            pstm.executeQuery();

        } catch (Exception e) {
            System.out.println("UpdateHeader(): " + e.getMessage());
        }
    }

    public void updateFooter() {
        cnn = (new DBContext()).connection;
        try {
            String strSelect = "update News set Title=? ,Content=?, Summary=? where NewsID=? and CategoryID=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, title);
            pstm.setString(2, Content);
            pstm.setString(3, Summary);
            pstm.setString(4, id);
            pstm.setInt(5, CategoryID);
            pstm.executeQuery();

        } catch (Exception e) {
            System.out.println("UpdateHeader(): " + e.getMessage());
        }
    }

    public void addBanner(String title, String imageName) {
        try {
            cnn = (new DBContext()).connection;
            String strSelect = "insert into News (Title,NewsImage,CategoryID,Content) values (?,?,11,'active') ";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, title);
            pstm.setString(2, imageName);
            

            pstm.execute();

        } catch (Exception e) {
            System.out.println("AddBanner:" + e.getMessage());
        }
    }

    public List<News> getContact() {
        cnn = (new DBContext()).connection;
        ArrayList<News> data = new ArrayList<>();
        try {
            String strSelect = "select NewsID,Title,Content\n"
                    + "from News where CategoryID = 10 ";
                    
            pstm = cnn.prepareStatement(strSelect);

            rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                String content = rs.getString(3);

                data.add(new News(id, title, content));
            }

        } catch (Exception e) {
            System.out.println("getContact(): " + e.getMessage());
        }
        return data;
    }

    public void updateContact(String id, String content) {
        cnn = (new DBContext()).connection;
        try {
            String strSelect = "update News set Content=? where NewsID=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, content);
            pstm.setString(2, id);
            
            pstm.executeQuery();

        } catch (Exception e) {
            System.out.println("UpdateContact(): " + e.getMessage());
        }
    }

    public News getPhone() {
        cnn = (new DBContext()).connection;
       News data = new News();
        try {
            String strSelect = "select NewsID,Title,Content\n"
                    + "from News where Title = 'Phone' ";
                    
            pstm = cnn.prepareStatement(strSelect);

            rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                String content = rs.getString(3);

                data = new News(id, title, content);
            }

        } catch (Exception e) {
            System.out.println("getContact(): " + e.getMessage());
        }
        return data;
    }
    public List<News> getBanner() {
        cnn = (new DBContext()).connection;
        ArrayList<News> data = new ArrayList<>();
        
        try {
            String strSelect = "select n.NewsID,n.Title,n.NewsImage,n.Content \n"
                    + "from News n  join News_Category nc on n.CategoryID=nc.CategoryID  \n"
                    + "where nc.Type = 4  ";
            pstm = cnn.prepareStatement(strSelect);

            rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                String image = rs.getString(3);
                String content = rs.getString(4);
                data.add(new News(id, title,image, content));
            }

        } catch (Exception e) {
            System.out.println("getBanner(): " + e.getMessage());
        }
        return data;
    }
     public List<News> getBannerClient() {
        cnn = (new DBContext()).connection;
        ArrayList<News> data = new ArrayList<>();
        
        try {
            String strSelect = "select n.NewsID,n.Title,n.NewsImage,n.Content \n"
                    + "from News n  join News_Category nc on n.CategoryID=nc.CategoryID  \n"
                    + "where nc.Type = 4 and n.Content = 'active' ";
            pstm = cnn.prepareStatement(strSelect);

            rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                String image = rs.getString(3);
                String content = rs.getString(4);
                data.add(new News(id, title,image, content));
            }

        } catch (Exception e) {
            System.out.println("getBanner(): " + e.getMessage());
        }
        return data;
    }
    

    public void getBanner(String id) {
        try {
            String strSelect = "select n.Title,n.NewsImage,n.Content \n"
                    + "from News n  join News_Category nc on n.CategoryID=nc.CategoryID  \n"
                    + "where nc.Type = 4 and n.NewsId = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                this.id = id;
                title = rs.getString(1);
                Image = rs.getString(2);
                Content = rs.getString(3);
                
            }

        } catch (Exception e) {
            System.out.println("getBanner(): " + e.getMessage());
        }
    }

    public void updateBanner(String id, String title, String imageName) {
        cnn = (new DBContext()).connection;
        try {
            String strSelect = "update News set Title=? ,NewsImage=?  where NewsID=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, title);
            
            pstm.setString(2, imageName);
            pstm.setString(3, id);
            pstm.executeQuery();

        } catch (Exception e) {
            System.out.println("UpdateBanner(): " + e.getMessage());
        }
    }

    public void changeStatus() {
        cnn = (new DBContext()).connection;
        try {
            String strSelect = "update News set Content = ?  where NewsID=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, Content.equals("active")?"not":"active");
            
            pstm.setString(2, id);
          
            pstm.executeQuery();
            System.out.println("oke nhe");
        } catch (Exception e) {
            System.out.println("UpdateBanner(): " + e.getMessage());
        }
    }

}
