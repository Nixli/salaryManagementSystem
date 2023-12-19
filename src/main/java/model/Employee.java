package model;

import java.util.Date;

public class Employee {
    private int id;
    private String username;
    private String name;
    private String position;
    private Date hireDate;
    private double basicSalary;

    public Employee() {
    }

    public Employee(int id, String username, String name, String position, Date hireDate, double basicSalary) {
        this.id = id;
        this.username = username;
        this.name = name;
        this.position = position;
        this.hireDate = hireDate;
        this.basicSalary = basicSalary;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Date getHireDate() {
        return hireDate;
    }

    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }

    public double getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(double basicSalary) {
        this.basicSalary = basicSalary;
    }
}
