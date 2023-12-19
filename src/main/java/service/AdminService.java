package service;

import model.Employee;
import model.SalaryRecord;

import java.util.List;

public interface AdminService {
    public List<Employee> getAllEmployees();
    public List<SalaryRecord> getAllSalaryRecord();

}
