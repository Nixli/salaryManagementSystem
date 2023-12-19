package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/payrollmanagementsystem?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "lx13983155478";
    private static final String classname = "com.mysql.cj.jdbc.Driver";
    public Connection connection;
    public Connection getConnection() {


        try {
            Class.forName(classname);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return connection;
    }
}
