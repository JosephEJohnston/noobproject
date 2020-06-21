<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>萌新论坛</title>

        <!-- jquery -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js" ></script>

        <!-- bootstrap -->
        <link href="${pageContext.request.contextPath}/webjars/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet"/>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div id="login">
            <form class="text-center" action="<c:url value="/loginCheck.html" />" method="post">
                <div class="form-group row justify-content-center">
                    <c:if test="${!empty error}">
                        <font color="red"><c:out value="${error}" /></font>
                    </c:if>
                </div>

                <!-- 输入非数字时出现 400 错误 -->
                <div class="form-group row justify-content-center">
                    <label for="id" class="col-sm-2 col-form-label">员工编号</label>
                    <div class="col-sm-4">
                        <input id="id" type="text" name="employeeID" class="form-control">
                    </div>
                </div>
                <div class="form-group row justify-content-center">
                    <label for="password" class="col-sm-2 col-form-label">系统口令</label>
                    <div class="col-sm-4">
                        <input id="password" type="password" name="password" class="form-control">
                    </div>
                </div>
                <button type="submit" class="btn btn-outline-dark">提交</button>
            </form>
        </div>


        <%--<div class="container">
            <div class="row justify-content-center bg-light" style="height: 500px">
                <div class="align-self-center">
                    水平垂直居中
                </div>
            </div>
        </div>--%>
    </body>
</html>