package com.wxj.meeting.controller;

import com.wxj.meeting.model.Department;
import com.wxj.meeting.model.Employee;
import com.wxj.meeting.service.DepartmentService;
import com.wxj.meeting.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 登录
 */
@Controller
public class LoginController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DepartmentService departmentService;

    //登陆页面
    @RequestMapping("/")
    public String login() {
        return "login";
    }

    /**
     * 判断登录信息
     *
     * @param username    用户名
     * @param password    密码
     * @param model
     * @param httpSession 会话，用来保存用户登录信息
     * @return 登录成功到通知页面  登录失败不跳转呆在登陆页面
     */
    @PostMapping("/doLogin")
    public String doLogin(String username, String password, Model model, HttpSession httpSession) {
        Employee employee = employeeService.doLogin(username, password);
        if (employee == null) {
            model.addAttribute("error", "用户或密码输入错误，登陆失败");
            return "forward:/";
        } else {
            if (employee.getStatus() == 0) {
                model.addAttribute("error", "用户待审批");
                return "forward:/";
            } else if (employee.getStatus() == 2) {
                model.addAttribute("error", "用户审批未通过");
                return "forward:/";
            } else {
                httpSession.setAttribute("currentUser", employee);
                return "redirect:/notifications";
            }
        }
    }

    /**
     * 注册
     *
     * @param model
     * @return 返回register页面
     */
    @RequestMapping("/register")
    public String register(Model model) {
        List<Department> deps = departmentService.getAllDeps();
        model.addAttribute("deps", deps);
        return "register";
    }

    /**
     * 判断注册信息
     * @param employee 用户注册的信息
     * @param model
     * @return 成功返回到登录页面   失败数据回填，继续呆在注册页面
     */
    @RequestMapping("/doReg")
    public String doReg(Employee employee, Model model) {
        Integer result = employeeService.doReg(employee);
        if (result == 1) {
            return "redirect:/";
        } else {
            model.addAttribute("error", "注册失败");
            model.addAttribute("employee", employee);
            return "forward:/register";
        }
    }
}
