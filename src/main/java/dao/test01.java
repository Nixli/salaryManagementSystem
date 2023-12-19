package dao;

import model.User;

import java.sql.*;

public class test01 {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/payrollmanagementsystem?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "lx13983155478";
    private static final String classname = "com.mysql.cj.jdbc.Driver";
    public static User user;
    static String username = "user1";

    public static void main(String[] args) {
        try {
            Class.forName(classname);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String sql = "SELECT * FROM user WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection connection = null;
        try {

            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("user_id");
                String pwd = rs.getString("password");
                String role = rs.getString("role");
                int employeeID = rs.getInt("employee_id");
                System.out.println(pwd);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
