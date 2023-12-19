package dao;

import model.User;

import java.sql.*;

public class UserDaoImpl implements UserDao {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/payrollmanagementsystem";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "0000";
    private static final String classname = "com.mysql.cj.jdbc.Driver";
    public User user;

    @Override
    public User getPasswordByUsername(String username) {
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

                int userId = rs.getInt("user_id");
                String role = rs.getString("role");
                String pwd = rs.getString("password");
                int employeeId = rs.getInt("employee_id");
                user = new User(userId,username,pwd,role,employeeId);
                return user;
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
        return null;
    }
}
