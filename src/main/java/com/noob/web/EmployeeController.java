package com.noob.web;

import com.noob.domain.Employee;
import com.noob.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class EmployeeController {
    private EmployeeService employeeService;

    @RequestMapping(value = "/index.html")
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value = "/loginCheck.html")
    public ModelAndView loginCheck(HttpServletRequest request,
                                   @RequestParam("employeeID") String id,
                                   @RequestParam("password") String password) {

        Employee tmp;
        if (id == null || "".equals(id)) {
            return new ModelAndView("login", "error", "员工编号错误");
        } else {
            int ID = 0;
            try {
                ID = Integer.parseInt(id);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            tmp = employeeService.findUserByID(ID);
            if (tmp == null) {
                return new ModelAndView("login", "error", "员工不存在");
            } else if (!password.equals(tmp.getPassword())) {
                return new ModelAndView("login", "error", "员工密码错误");
            }
        }

        request.getSession().setAttribute("employee", tmp);
        return new ModelAndView("main");
    }


    @Autowired
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }
}
