package model;

import java.util.Date;

public class SalaryRecord {
    private int id;
    private int employeeId;
    private Date issueDate;
    private double baseSalary;
    private double allowance;
    private double deduction;
    private double actualSalary;

    public SalaryRecord() {
    }

    public SalaryRecord(int id, int employeeId, Date issueDate, double baseSalary, double allowance, double deduction, double actualSalary) {
        this.id = id;
        this.employeeId = employeeId;
        this.issueDate = issueDate;
        this.baseSalary = baseSalary;
        this.allowance = allowance;
        this.deduction = deduction;
        this.actualSalary = actualSalary;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public double getBaseSalary() {
        return baseSalary;
    }

    public void setBaseSalary(double baseSalary) {
        this.baseSalary = baseSalary;
    }

    public double getAllowance() {
        return allowance;
    }

    public void setAllowance(double allowance) {
        this.allowance = allowance;
    }

    public double getDeduction() {
        return deduction;
    }

    public void setDeduction(double deduction) {
        this.deduction = deduction;
    }

    public double getActualSalary() {
        return actualSalary;
    }

    public void setActualSalary(double actualSalary) {
        this.actualSalary = actualSalary;
    }
}
