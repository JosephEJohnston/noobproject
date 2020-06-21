package com.noob.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ServiceTest {

    @Autowired
    EmployeeService employeeService;

    @Test
    public void serviceTest() {
        /*employeeService.register(1, "张三", true, new Date(),
                "123456", "Nanjing", "123", true);*/

    }
}
