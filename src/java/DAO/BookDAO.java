
package DAO;

import Models.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Models.Category;
import Models.Book;
import Models.Publisher;



public class BookDAO extends DBContext {
    public static BookDAO INSTANCE = new BookDAO();
    private List<Book> listB;

    public List<Book> getListB() {
        return listB;
    }

    public void setListB(List<Book> listB) {
        this.listB = listB;
    }

    
    public List<Book> getAllBook() {
        List<Book> list = new ArrayList<>();
        String sql = "select * from Book";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBid(rs.getInt("bid"));
                b.setBname(rs.getString("bname"));
                Category c = getCategoryByCid(rs.getString("cid"));
                b.setCategory(c);
                b.setAuthor(rs.getString("author"));
                Publisher p = getPublisherByPid(rs.getString("pid"));
                b.setPublisher(p);
                b.setImage(rs.getString("image"));
                b.setQuantity(rs.getInt("quantity"));
                b.setDescribe(rs.getString("describe"));
                b.setPrice(rs.getFloat("price"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) [cid]\n"
                + "      ,[cname]\n"
                + "  FROM [PRJ301].[dbo].[Category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Publisher> getAllPublisher() {
        List<Publisher> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) [pid]\n"
                + "      ,[pname]\n"
                + "  FROM [PRJ301].[dbo].[Publisher]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Publisher p = new Publisher();
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("pname"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

//     doc tu bang book theo cid
    public List<Book> getBookByCid(String cid) {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "  FROM [Book]\n"
                + "  where cid = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBid(rs.getInt("bid"));
                b.setBname(rs.getString("bname"));
                Category c = getCategoryByCid(rs.getString("cid"));
                b.setCategory(c);
                b.setAuthor(rs.getString("author"));
                b.setImage(rs.getString("image"));
                Publisher p = getPublisherByPid(rs.getString("pid"));
                b.setPublisher(p);
                b.setQuantity(rs.getInt("quantity"));
                b.setDescribe(rs.getString("describe"));
                b.setPrice(rs.getFloat("price"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Book> getBookByPriceLow() {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "  FROM [Book]\n"
                + " order by price ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBid(rs.getInt("bid"));
                b.setBname(rs.getString("bname"));
                b.setAuthor(rs.getString("author"));
                b.setImage(rs.getString("image"));
                b.setQuantity(rs.getInt("quantity"));
                b.setDescribe(rs.getString("describe"));
                b.setPrice(rs.getFloat("price"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
//sap xep theo gia giam dan

    public List<Book> getBookByPriceHigh() {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "  FROM [Book]\n"
                + " order by price desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBid(rs.getInt("bid"));
                b.setBname(rs.getString("bname"));
                b.setAuthor(rs.getString("author"));
                b.setImage(rs.getString("image"));
                b.setQuantity(rs.getInt("quantity"));
                b.setDescribe(rs.getString("describe"));
                b.setPrice(rs.getFloat("price"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
// lay cname theo cid

    public Category getCategoryByCid(String cid) {
        String sql = "SELECT *\n"
                + "  FROM [Category]\n"
                + "  where cid = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));

                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //get publisher by pid
    public Publisher getPublisherByPid(String pid) {

        String sql = "select * from Publisher where pid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Publisher p = new Publisher();
                p.setPid(rs.getInt("Pid"));
                p.setPname(rs.getString("pname"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

//get detail book
    public Book getBookByBid(String bid) {

        String sql = "SELECT *\n"
                + "  FROM [Book]\n"
                + "  where bid = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBid(rs.getInt("bid"));
                b.setBname(rs.getString("bname"));
                Category c = getCategoryByCid(rs.getString("cid"));
                b.setCategory(c);
                b.setAuthor(rs.getString("author"));
                b.setImage(rs.getString("image"));
                Publisher p = getPublisherByPid(rs.getString("pid"));
                b.setPublisher(p);
                b.setQuantity(rs.getInt("quantity"));
                b.setDescribe(rs.getString("describe"));
                b.setPrice(rs.getFloat("price"));
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
//tim kiem sach

    public List<Book> SearchByName(String txtSearch) {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "  FROM [Book]\n"
                + " where [bname] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBid(rs.getInt("bid"));
                b.setBname(rs.getString("bname"));
                b.setAuthor(rs.getString("author"));
                b.setImage(rs.getString("image"));
                b.setQuantity(rs.getInt("quantity"));
                b.setDescribe(rs.getString("describe"));
                b.setPrice(rs.getFloat("price"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Account login(String email, String pass) {
        String sql = "SELECT *\n"
                + "  FROM [Account]\n"
                + "  where [email] = ?\n"
                + "  and [pass] = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    //xoa
    public void delete(String bid) {
        String sql = "DELETE FROM [dbo].[Book]\n"
                + "      WHERE bid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //them sach
    public void insert(String category, String bname, String author, String image, String publisher, String quantity, String describe, String price) {
        String sql = "INSERT into [PRJ301].[dbo].[Book] \n"
                + "values( ?,?, ?, ?, ?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, category);
            st.setString(2, bname);
            st.setString(3, author);
            st.setString(4, image);
            st.setString(5, publisher);
            st.setString(6, quantity);
            st.setString(7, describe);
            st.setString(8, price);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(String category, String bname, String author, String image, String publisher, String quantity, String describe, String price, int bid) {
        String sql = "update [PRJ301].[dbo].[Book]\n"
                + "         set\n"
                + "       [cid] = ?\n"
                + "      ,[bname] = ?\n"
                + "      ,[author] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[pid] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[describe] = ?\n"
                + "      ,[price] =?\n"
                + "  where [bid] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, category);
            st.setString(2, bname);
            st.setString(3, author);
            st.setString(4, image);
            st.setString(5, publisher);
            st.setString(6, quantity);
            st.setString(7, describe);
            st.setString(8, price);
            st.setInt(9, bid);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void Signup(String username, String email, String pass, String phone, String address, String avatar) {
        String sql = "INSERT into [PRJ301].[dbo].[Account] \n"
                + "values(?, ?,?,1,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, email);
            st.setString(3, pass);
            st.setString(4, phone);
            st.setString(5, address);
            st.setString(6, avatar);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Account checkAcc(String email) {
        String sql = "SELECT * FROM [PRJ301].[dbo].[Account]\n"
                + "  where email = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public static void main(String[] args) {
        BookDAO b = new BookDAO();
//        List<Publisher> list = b.getAllPublisher();
//        for (Publisher o : list) {
//            System.out.println(o);
//        }
        //                cid   bname                  pid    quanity     des    price                    
//        b.update("2", "3", "8", "2", "3", "1", "des", "6",  "102");
//        b.Signup("test", "test@gmail.com", "pass");
//        b.update("sach31", "tacgia", "hinhanh", "322", "mieuta", "100", 123456130);
            b.getBookByBid("5");
    }
}
