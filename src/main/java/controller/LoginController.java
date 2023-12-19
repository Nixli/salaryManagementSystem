package controller;

import model.Employee;
import model.SalaryRecord;
import model.User;
import service.AdminServiceImpl;
import service.UserServiceImpl;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


public class LoginController extends HttpServlet {
    private AdminServiceImpl adminService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取用户名和密码参数
        String username = req.getParameter("username");
        String password = req.getParameter("pwd");

        if (username.equals("admin")&&password.equals("admin")) {
                // 转发到雇员信息页面（例如：admin.jsp）
                resp.sendRedirect("admin.jsp");
        } else if (username.equals("user")&&password.equals("0000")) {
                resp.sendRedirect("employee.jsp");
            }else {
            // 登录失败
            // 登录失败，设置错误消息并重定向回登录页面
            req.setAttribute("errorMessage", "用户名或密码错误，请重试。");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
