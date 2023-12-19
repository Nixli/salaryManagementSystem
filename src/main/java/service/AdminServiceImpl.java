package service;

import dao.AdminDao;
import dao.AdminDaoImpl;
import model.Employee;
import model.SalaryRecord;

import java.util.List;

public class AdminServiceImpl implements AdminService {
    @Override
    public List<Employee> getAllEmployees() {
        AdminDao adminDao = new AdminDaoImpl();
        return adminDao.getAllEmployees();
    }

    @Override
    public List<SalaryRecord> getAllSalaryRecord() {
        AdminDao adminDao = new AdminDaoImpl();
        return adminDao.getAllSalary();
    }
}
