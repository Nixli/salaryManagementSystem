package model;

public class User {
    private int userId;
    private String name;
    private String password;
    private String role;
    private int employeeId;
    public static final String ROLE_ADMIN = "admin";
    public static final String ROLE_EMPLOYEE = "employee";

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public User(String name, String password, String role) {
        this.name = name;
        this.password = password;
        this.role = role;
    }

    public User(int userId, String name, String password, String role,int employeeId) {
        this.userId = userId;
        this.name = name;
        this.password = password;
        this.role = role;
        this.employeeId = employeeId;
    }

    public User() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getId() {
        return userId;
    }

    public void setId(int userId) {
        this.userId = userId;
    }
}
