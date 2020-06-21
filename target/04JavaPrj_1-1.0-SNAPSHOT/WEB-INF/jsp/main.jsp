<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- jquery -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js" ></script>

        <!-- bootstrap -->
        <link href="${pageContext.request.contextPath}/webjars/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet"/>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <title>萌新论坛</title>
    </head>
    <body>
        <table class="table table-dark">
            <tr>
                <th>员工编号</th>
                <th>员工姓名</th>
                <th>员工性别</th>
                <th>出生日期</th>
                <th>办公室电话</th>
                <th>住址</th>
                <th>管理层领导</th>
            </tr>
            <tr>
                <th>${employee.employeeID}</th>
                <th>${employee.employeeName}</th>
                <th>${employee.employeeSex ? "男":"女"}</th>
                <th>${employee.employeeBirth}</th>
                <th>${employee.employeeBirth}</th>
                <th>${employee.employeePlace}</th>
                <th>${employee.lead ? '是':'否'}</th>
            </tr>
        </table>
        <div class="text-center">
            <a class="btn btn-primary" href="/msg/msgList.html">消息列表</a>
            <a class="btn btn-primary" href="/msg/message.html">发布消息</a>
        </div>
    </body>
</html>