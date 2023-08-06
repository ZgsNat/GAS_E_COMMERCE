/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author myth
 */
public class NewsCategory {
    int id;
    String name;

    public NewsCategory() {
    }

    public NewsCategory(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    Connection cnn; //ket noi
    Statement stm; //thuc thi cac cau lenh sql
    PreparedStatement pstm;
    ResultSet rs; //luu tru va xu ly du lieu
    public List<NewsCategory> GetCategory() {
        List<NewsCategory> list= new ArrayList<>();
        cnn = (new DBContext()).connection;
        try {
            String strSelect = "select CategoryID,CategoryName from News_Category where Type = 3 ";
            pstm = cnn.prepareStatement(strSelect);
            rs =pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                list.add(new NewsCategory(id, name));
            }
                
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("getCategory(): " + e.getMessage());
        }
        return list;
    }
    public List<NewsCategory> GetCategory(int type) {
        List<NewsCategory> list= new ArrayList<>();
        cnn = (new DBContext()).connection;
        try {
            String strSelect = "select CategoryID,CategoryName from News_Category where Type = ? ";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, type);
            rs =pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                list.add(new NewsCategory(id, name));
            }
                
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("getCategory(): " + e.getMessage());
        }
        return list;
    }

    @Override
    public String toString() {
        return "NewsCategory{" + "id=" + id + ", name=" + name + '}';
    }

    public void GetCate(String id) {
        cnn = (new DBContext()).connection;
        try {
            String strSelect = "select CategoryName from News_Category where CategoryID = ? ";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, id);
            rs =pstm.executeQuery();
            while (rs.next()) {
                this.id = Integer.parseInt(id);
                name = rs.getString(1);
               
            }
                
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("getCategory(): " + e.getMessage());
        }
    }
    
    
}
