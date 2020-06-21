package com.noob.dao;

import com.noob.domain.Employee;

import java.util.List;

public interface EmployeeDAO {
    //添加员工信息
    void addEmployee(Employee employee);

    //定义修改员工信息
    void updateEmployee(Employee employee);

    //定义删除员工信息
    void deleteEmployee(int employeeID);

    //定义查询所有员工信息
    List<Employee> findAllEmployee();

    //按 ID 查询员工信息
    Employee findEmployeeById(int employeeID);
}
