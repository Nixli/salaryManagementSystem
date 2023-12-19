package dao;

import model.Employee;
import model.SalaryRecord;

import java.util.List;

public interface AdminDao {
    public List<Employee> getAllEmployees();
    List<SalaryRecord> getAllSalary();
}
