package com.noob.dao.impl;

import com.noob.dao.EmployeeDAO;
import com.noob.domain.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {
    JdbcTemplate jdbcTemplate;

    public void addEmployee(Employee employee) {
        String sql = " INSERT INTO tb_employee VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) ";

        jdbcTemplate.update(sql, employee.getEmployeeID(), employee.getEmployeeName(),
                employee.isEmployeeSex(), employee.getEmployeeBirth(), employee.getEmployeePhone(),
                employee.getEmployeePlace(),  new Date(),
                employee.getPassword(), employee.isLead());
    }

    public void updateEmployee(Employee employee) {
        String sql = " UPDATE tb_employee SET " +
                " employeeName=?, employeeSex=?, employeeBirth=?, " +
                " employeePhone=?, employeePlace=?, password=?, isLead=?  " +
                " WHERE employeeID=? ";

        jdbcTemplate.update(sql, employee.getEmployeeName(), employee.isEmployeeSex(), employee.getEmployeeBirth(),
                employee.getEmployeePhone(), employee.getEmployeePlace(), employee.getPassword(),
                employee.isLead(), employee.getEmployeeID());
    }

    public void deleteEmployee(int employeeID) {
        String sql = " DELETE FROM tb_employee WHERE employeeID=? ";

        jdbcTemplate.update(sql, employeeID);
    }

    public List<Employee> findAllEmployee() {
        String sql = " SELECT * FROM tb_employee ";
        final List<Employee> list;

        list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Employee>(Employee.class));

        return list;
    }

    public Employee findEmployeeById(final int employeeID) {
        String sql = " SELECT * FROM tb_employee WHERE employeeID=? ";
        Employee employee;

        try {
            employee = jdbcTemplate.queryForObject(sql,
                    new BeanPropertyRowMapper<Employee>(Employee.class), employeeID);
        } catch (EmptyResultDataAccessException e) {
            e.printStackTrace();
            employee = null;
        }

        return employee;
    }

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
