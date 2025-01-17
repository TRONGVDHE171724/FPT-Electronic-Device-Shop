/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dals;

import java.sql.Date;
import vn.fpt.edu.models.Bill1;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import vn.fpt.edu.models.Bill;
import vn.fpt.edu.models.Bill2;
import vn.fpt.edu.models.Cart;
import vn.fpt.edu.models.Item;
import vn.fpt.edu.models.Order;
import vn.fpt.edu.models.Price;
import vn.fpt.edu.models.Product1;
import vn.fpt.edu.models.ProductDetail;
import vn.fpt.edu.models.User;

/**
 *
 * @author Trong
 */
public class Bill_DAO extends DBContext {

    public HashMap<Date, Integer> TrendDone() {
        HashMap<Date, Integer> hash = new HashMap();
        String Sql = "SELECT [Date], Count(Bill_Id) as Total FROM [Bill] WHERE [Status] = 'Hoàn Thành' GROUP BY [Date] ORDER BY [Date]";
        try {
            PreparedStatement st = connection.prepareStatement(Sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                hash.put(rs.getDate("Date"), rs.getInt("Total"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return hash;
    }

    public HashMap<Date, Integer> TrendAll() {
        HashMap<Date, Integer> hash = new HashMap();
        String Sql = "SELECT [Date], Count(Bill_Id) as Total FROM [Bill] GROUP BY [Date] ORDER BY [Date]";
        try {
            PreparedStatement st = connection.prepareStatement(Sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                hash.put(rs.getDate("Date"), rs.getInt("Total"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return hash;
    }

    public int getNumOfBillCurrentDate() {
        int numOfBill = 0;
        String sql = "SELECT COUNT(*) AS NumberOfBills \n"
                + "FROM [Feds].[dbo].[Bill] \n"
                + "WHERE CONVERT(DATE, [Date]) = CONVERT(DATE, GETDATE());";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                numOfBill = rs.getInt("NumberOfBills");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return numOfBill;
    }

    public long totalRevenue() {
        long total = 0;
        String sql = "SELECT SUM(Total_price) as Total FROM Bill WHERE Status = 'Hoàn Thành'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                total = rs.getLong("Total");

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return total;
    }

    public HashMap<String, Long> totalRevenueByCate() {
        HashMap<String, Long> total = new HashMap();
        String sql = "SELECT * FROM [Product_Category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PreparedStatement ps = connection.prepareStatement("SELECT ((SELECT Price.Price - Price.Price * (Price.Sale / 100.0 * ISNULL((SELECT 1 WHERE [Order].Real_time_price >= Price.Date_start AND [Order].Real_time_price <= Price.Date_end), 0)) FROM Price WHERE Product_id = [Order].Product_id) * [Order].Order_quantity) as Total FROM [Order] join Product on Product.Product_id = [Order].Product_id join Brandd on Brandd.Brand_Id = Product.Brand_id WHERE Brandd.Category_id = ?");
                ps.setInt(1, rs.getInt("Category_id"));
                String name = rs.getString("Category_name");
                long totalVal = 0;
                ResultSet prs = ps.executeQuery();
                while(prs.next()) {
                    totalVal += prs.getLong("Total");
                }
                total.put(name, totalVal);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return total;
    }

    public List<Bill1> getSumRevenueByDay(String startDate, String endDate) {
        List<Bill1> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "    Date AS Ngay,\n"
                + "    SUM(Total_price) AS TongTien\n"
                + "FROM\n"
                + "    [Feds].[dbo].[Bill]\n"
                + "WHERE\n"
                + "    Date BETWEEN ? AND ?\n"
                + "    AND Status = N'Hoàn Thành'\n"
                + "GROUP BY\n"
                + "    Date\n"
                + "ORDER BY\n"
                + "    Date ASC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, startDate);
            st.setString(2, endDate);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Bill1 bill = new Bill1();
                bill.setDate(rs.getString(1));

                bill.setTotal_price(rs.getInt(2));
                list.add(bill);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getSumOfDoneBill() {
        int sumOfDoneBill = 0;
        String sql = "SELECT SUM(Total_price) AS Sum \n"
                + "FROM [Feds].[dbo].[Bill] \n"
                + "WHERE Status = 'Hoàn Thành' AND CONVERT(DATE, [Date]) = CONVERT(DATE, GETDATE());";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                sumOfDoneBill = rs.getInt("Sum");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sumOfDoneBill;
    }

    public List<Bill1> getBillAllWithUserToday() {
        List<Bill1> list = new ArrayList<>();
        String sql = "SELECT Bill.*, U.User_name\n"
                + "FROM Bill\n"
                + "JOIN [User] AS U ON Bill.User_Id = U.User_Id\n"
                + "WHERE CONVERT(date, Bill.Date) = CONVERT(date, GETDATE()) ORDER BY Bill_Id Desc;"; // Sử dụng GETDATE() để lấy ngày hiện tại
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill1 u = new Bill1(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getString("Date"), rs.getString("Address"), rs.getString("Status"), rs.getString("User_name"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Bill1> getBillAllWithUser() {
        List<Bill1> list = new ArrayList<>();
        String sql = "SELECT Bill.*, U.User_name\n"
                + "FROM Bill\n"
                + "JOIN [User] AS U ON Bill.User_Id = U.User_Id\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill1 u = new Bill1(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getString("Date"), rs.getString("Address"), rs.getString("Status"), rs.getString("User_name"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public double getSumOfBillByMonth(int month) {
        double sumOfDoneBill = 0;
        String sql = "SELECT SUM(Total_price) AS TongTienBanDuoc\n"
                + "FROM Bill\n"
                + "WHERE MONTH(Date) = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, month);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                sumOfDoneBill = rs.getDouble("TongTienBanDuoc");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sumOfDoneBill;
    }

    public int getNumberOrderUser(int id, String status) {
        int numberOrder = 0;
        String sql = "select count(b.Bill_Id)\n"
                + "from Bill as b \n"
                + "where b.Status = ? and b.User_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                numberOrder = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return numberOrder;
    }

    public int getTotalOrderUser(int id) {
        int numberOrder = 0;
        String sql = "select count(b.Bill_Id)\n"
                + "from Bill as b \n"
                + "where b.User_id = ? and Status != N'Hoàn Thành'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                numberOrder = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return numberOrder;
    }

    public double getSumOfBillByUserId(int id) {
        double sumOfDoneBill = 0;
        String sql = "SELECT SUM(Total_price)\n"
                + "FROM Bill\n"
                + "WHERE User_id = ? and Status = N'Hoàn Thành';";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                sumOfDoneBill = rs.getDouble(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sumOfDoneBill;
    }

    public Bill getBillByID(int bill_id) {
        String sql = "SELECT [Bill_Id]\n"
                + "      ,[Total_price]\n"
                + "      ,[Date]\n"
                + "      ,[User_id]\n"
                + "      ,[Address]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Bill]\n"
                + "  where Bill_Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bill_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User_DAO u = new User_DAO();
                return new Bill(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getDate("Date"), rs.getString("Address"), rs.getString("Status"), u.getCustomerByID(rs.getInt("User_id")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int conditionsForFeedback(int product_id, int user_id) {
        List<Bill> list = new ArrayList<>();
        String sql = "select b.[Bill_Id]\n"
                + "      ,[Total_price]\n"
                + "      ,[Date]\n"
                + "      ,[User_id]\n"
                + "      ,[Address]\n"
                + "      ,[Status]\n"
                + "from Bill as b\n"
                + "join [dbo].[Order] as o on o.Bill_id = b.Bill_Id\n"
                + "where o.Product_id = ? and b.User_id = ? and Status = N'Hoàn Thành'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);
            st.setInt(2, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User_DAO u = new User_DAO();
                list.add(new Bill(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getDate("Date"), rs.getString("Address"), rs.getString("Status"), u.getCustomerByID(rs.getInt("User_id"))));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list.size();
    }

    public Bill getBillByUID(int bill_id) {
        String sql = "SELECT [Bill_Id]\n"
                + "      ,[Total_price]\n"
                + "      ,[Date]\n"
                + "      ,[User_id]\n"
                + "      ,[Address]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Bill]\n"
                + "  where User_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bill_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User_DAO u = new User_DAO();
                return new Bill(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getDate("Date"), rs.getString("Address"), rs.getString("Status"), u.getCustomerByID(rs.getInt("User_id")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Bill1> searchBills(String value) {
        List<Bill1> list = new ArrayList<>();
        try {

            String sql = "SELECT Bill.*, U.User_name FROM Bill JOIN [User] AS U ON Bill.User_Id = U.User_Id "
                    + "WHERE Bill.Bill_Id LIKE ? OR U.User_name LIKE ?  OR Bill.Status LIKE ? OR Bill.Address LIKE ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + value + "%");
            ps.setString(2, "%" + value + "%");
            ps.setString(3, "%" + value + "%");
            ps.setString(4, "%" + value + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Bill1 u = new Bill1(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getString("Date"), rs.getString("Address"),
                        rs.getString("Status"), rs.getString("User_name"));
                list.add(u);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalSuccessOrder() {
        int totalDone = 0;
        String sql = "SELECT Count(Bill_Id) as Total \n"
                + "FROM [Feds].[dbo].[Bill] \n"
                + "WHERE Status = 'Hoàn Thành'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalDone = rs.getInt("Total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return totalDone;
    }

    public int getTotalSubmitedOrder() {
        int totalDone = 0;
        String sql = "SELECT Count(Bill_Id) as Total \n"
                + "FROM [Feds].[dbo].[Bill] \n"
                + "WHERE Status = 'Chờ xử lý'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalDone = rs.getInt("Total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return totalDone;
    }

    public int getTotalCanceledOrder() {
        int totalDone = 0;
        String sql = "SELECT Count(Bill_Id) as Total \n"
                + "FROM [Feds].[dbo].[Bill] \n"
                + "WHERE Status LIKE N'%Đã hủy%'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalDone = rs.getInt("Total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return totalDone;
    }

    public List<Bill1> getBillAllWithUserSortByValue(String type) {
        List<Bill1> list = new ArrayList<>();
        String sql = "SELECT Bill.*, U.User_name\n"
                + "FROM Bill\n"
                + "JOIN [User] AS U ON Bill.User_Id = U.User_Id\n"
                + "ORDER BY Bill.Total_price " + type + ";";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill1 u = new Bill1(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getString("Date"),
                        rs.getString("Address"), rs.getString("Status"), rs.getString("User_name"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Bill1> getBillAllWithUserPagingSQL(int pageIndex, int numOfBill) {
        List<Bill1> list = new ArrayList<>();
        String sql = "exec PagingBill ?,?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pageIndex);
            st.setInt(2, numOfBill);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill1 u = new Bill1(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getString("Date"), rs.getString("Address"),
                        rs.getString("Status"), rs.getString("UserName"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    

    public int getNumOfPageBillList(int numOfBillInScreen) {
        int numOfPages = 0;
        String sql = "DECLARE @NumberBillPerPage INT = ?\n"
                + "SELECT CEILING(COUNT(*) * 1.0 / @NumberBillPerPage) AS TotalPages\n"
                + "FROM Bill;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, numOfBillInScreen);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                numOfPages = rs.getInt("TotalPages");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return numOfPages;
    }

    public List<Bill1> getBillAllWithUserSortByDate(String type) {
        List<Bill1> list = new ArrayList<>();
        String sql = "SELECT Bill.*, U.User_name\n"
                + "FROM Bill\n"
                + "JOIN [User] AS U ON Bill.User_Id = U.User_Id\n"
                + "ORDER BY Bill.Date " + type + ";";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill1 u = new Bill1(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getString("Date"),
                        rs.getString("Address"), rs.getString("Status"), rs.getString("User_name"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Bill1> getBillAllWithUserSortByBillId(String type) {
        List<Bill1> list = new ArrayList<>();
        String sql = "SELECT Bill.*, U.User_name\n"
                + "FROM Bill\n"
                + "JOIN [User] AS U ON Bill.User_Id = U.User_Id\n"
                + "ORDER BY Bill.Bill_Id " + type + ";";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill1 u = new Bill1(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getString("Date"),
                        rs.getString("Address"), rs.getString("Status"), rs.getString("User_name"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        return list;
    }

    public void updateStatusBill(String status, String id) {
        String sql = "UPDATE [dbo].[Bill]\n"
                + "   SET [Status] = ?\n"
                + " WHERE Bill_Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setString(2, id);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addtoBill(User u, Cart cart, String address, String status, String tinh, String quan, String phuong, String payment) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            //add bill
            String sql = "insert into Bill values(?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, cart.getTotalMoney(u.getUser_Id()));
            st.setString(2, date);
            st.setInt(3, u.getUser_Id());
            st.setString(4, address);
            st.setString(5, status);
            st.setString(6, tinh);
            st.setString(7, quan);
            st.setString(8, phuong);
            st.executeUpdate();
            //lay id cua bill vua add
            String sql1 = "select top 1 Bill_Id\n"
                    + "from Bill \n"
                    + "Order by Bill_Id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //add bang orderse
            if (rs.next()) {
                int id = rs.getInt("Bill_Id");
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into [Order] values(?, ?, ?, ?, ?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, i.getProduct().getProduct_id());
                    st2.setInt(2, i.getQuantity());
                    st2.setInt(3, id);
                    st2.setString(4, date);
                    st2.setString(5, payment);
                    st2.executeUpdate();
                }
            }
            //cap nhat lai so luong san pham
            String sql3 = "update Product set Quantity = Quantity - ? where Product_id = ?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getProduct_id());
                st3.executeUpdate();
            }
        } catch (Exception e) {
        }
    }

    public Bill2 getInfoDeliveryByBillId(int bill_id) {
        String sql = "Select TOP 1  u.User_NAME, u.Email, u.Phone_number, b.Province, b.District, b.Country, b.Address, b.Date, o.Payment, b.Bill_Id\n"
                + "From [User] u join Bill b on u.User_Id = b.User_id\n"
                + "Join [Order] o on o.Bill_id = b.Bill_Id\n"
                + "Where b.Bill_Id = ?";
        Bill2 bill = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bill_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                bill = new Bill2();
                User user = new User();
                user.setUser_name(rs.getString(1));
                user.setEmail(rs.getString(2));
                user.setPhone_number(rs.getString(3));
                bill.setUser(user);
                bill.setProvince(rs.getString(4));
                bill.setDistrict(rs.getString(5));
                bill.setCountry(rs.getString(6));
                bill.setAddress(rs.getString(7));
                bill.setDate(rs.getDate(8));
                Order order = new Order();
                order.setPayment(rs.getString(9));
                bill.setOrder(order);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bill;
    }

    public List<Bill2> getInfoBillByBillId(int bill_id) {
        List<Bill2> list = new ArrayList<>();
        String sql = "Select b.Bill_Id, b.Total_price, o.Order_id, o.Product_id, o.Order_quantity,p.Product_name, p.Product_img, pd.Color, pr.Price, b.Status\n"
                + "From [Order] o Join Bill b on o.Bill_id = b.Bill_Id\n"
                + "Join Product p on o.Product_id = p.Product_id\n"
                + "Join Product_Detail pd on p.Product_id = pd.Product_id\n"
                + "Join Price pr on pr.Product_id= p.Product_id\n"
                + "Where b.Bill_Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bill_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill2 bill = new Bill2();
                bill.setBill_id(rs.getInt(1));
                bill.setTotal_price(rs.getDouble(2));
                Order order = new Order();
                order.setOrder_id(rs.getInt(3));
                order.setProduct_id(rs.getInt(4));
                order.setOrder_quantity(rs.getInt(5));
                bill.setOrder(order);
                Product1 product = new Product1();
                product.setProduct_name(rs.getString(6));
                product.setProduct_img(rs.getString(7));
                ProductDetail pd = new ProductDetail();
                pd.setColor(rs.getString(8));
                product.setDetail(pd);
                Price pr = new Price();
                pr.setPrice(rs.getDouble(9));
                product.setPrice(pr);
                bill.setProduct1(product);
                bill.setStatus(rs.getString(10));
                list.add(bill);
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        return list;
    }

    public void changeStatusBill(String status, String id) {
        String sql = "Update Bill set Status = ? where Bill_Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setString(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeDeliveryAddress(String province, String district, String country, String address, String id) {
        String sql = "update Bill set Province = ?, District =?, Country=?, Address=?\n"
                + "where Bill_Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, province);
            st.setString(2, district);
            st.setString(3, country);
            st.setString(4, address);
            st.setString(5, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getBillIdByUserId(int u) {
        String sql = "select top 1 Bill_Id \n"
                + "from Bill b join [User] u on b.User_id = u.User_Id\n"
                + "Where u.User_Id = ?\n"
                + "Order by b.Bill_Id desc";
        Bill2 bill = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                bill = new Bill2();
                bill.setBill_id(rs.getInt(1));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return bill.getBill_id();
    }

    public int newlyBoughtUser() {
        int total = 0;
        String sql = "SELECT count(User_id) as Total FROM [dbo].[Bill]\n"
                + " WHERE Date >= (getdate() - 7)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt("Total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return total;
    }

    public int getTotalOrder() {
        int totalDone = 0;
        String sql = "SELECT Count(Bill_Id) as Total \n"
                + "FROM [Feds].[dbo].[Bill] \n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalDone = rs.getInt("Total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return totalDone;

    }

    public List<Bill2> getBillAndOrderByUserId(int u) {
        List<Bill2> list = new ArrayList<>();
        String sql = "WITH BillOrderDetails AS (\n"
                + "    SELECT\n"
                + "        b.Bill_Id, b.Total_price, b.Status, b.Date, o.Product_id, o.Order_id, o.Order_quantity, p.Product_name, p.Product_img, pd.Color, ROW_NUMBER() OVER(PARTITION BY b.Bill_Id ORDER BY o.Order_id) AS RowNum\n"
                + "    FROM \n"
                + "        Bill b\n"
                + "    JOIN [User] u ON b.User_id = u.User_Id\n"
                + "    LEFT JOIN [Order] o ON b.Bill_Id = o.Bill_id\n"
                + "    LEFT JOIN Product p ON p.Product_id = o.Product_id\n"
                + "    LEFT JOIN Product_Detail pd ON p.Product_id = pd.Product_id\n"
                + "    WHERE u.User_Id = ?\n"
                + ")\n"
                + "SELECT\n"
                + "    Bill_Id, Total_price, Status, Date, Product_id, Order_id, Order_quantity, Product_name, Product_img, Color\n"
                + "FROM BillOrderDetails\n"
                + "WHERE RowNum = 1\n"
                + "ORDER BY Bill_Id DESC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill2 bill = new Bill2();
                bill.setBill_id(rs.getInt(1));
                bill.setTotal_price(rs.getDouble(2));
                bill.setStatus(rs.getString(3));
                bill.setDate(rs.getDate(4));
                Order order = new Order();

                order.setProduct_id(rs.getInt(5));
                order.setOrder_id(rs.getInt(6));
                order.setOrder_quantity(rs.getInt(7));
                bill.setOrder(order);
                Product1 product = new Product1();
                product.setProduct_name(rs.getString(8));
                product.setProduct_img(rs.getString(9));
                ProductDetail pd = new ProductDetail();
                pd.setColor(rs.getString(10));
                product.setDetail(pd);
                bill.setProduct1(product);
                list.add(bill);
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        return list;
    }

}
