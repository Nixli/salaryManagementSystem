package dao;

import model.Employee;
import model.SalaryRecord;
import utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDaoImpl implements AdminDao {

    public static Employee employee;
    public static SalaryRecord salaryRecord;
    public static DBConnection dbConnection;
    public static Connection connection;

    @Override
    public List<Employee> getAllEmployees() {

        List<Employee> employees = new ArrayList<>();

        String sql = "SELECT * FROM employee";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            dbConnection = new DBConnection();
            connection = dbConnection.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                employee = new Employee();
                employee.setId(rs.getInt("employee_id"));
                employee.setName(rs.getString("name"));
                employee.setPosition(rs.getString("position"));
                employee.setHireDate(rs.getDate("hire_date"));
                employee.setBasicSalary(rs.getDouble("basic_salary"));
                employees.add(employee);

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

        return employees;
    }

    @Override
    public List<SalaryRecord> getAllSalary() {

        List<SalaryRecord> salaryRecords = new ArrayList<>();

        String sql = "SELECT * FROM salary_record";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            dbConnection = new DBConnection();
            connection = dbConnection.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                salaryRecord = new SalaryRecord();
                salaryRecord.setId(rs.getInt("employee_id"));
                salaryRecord.setEmployeeId(rs.getInt("employee_id"));
                salaryRecord.setIssueDate(rs.getDate("issue_date"));
                salaryRecord.setBaseSalary(rs.getDouble("base_salary"));
                salaryRecord.setAllowance(rs.getDouble("allowance"));
                salaryRecord.setDeduction(rs.getDouble("deduction"));
                salaryRecord.setActualSalary(rs.getDouble("actual_salary"));
                salaryRecords.add(salaryRecord);

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

        return salaryRecords;
    }
}
