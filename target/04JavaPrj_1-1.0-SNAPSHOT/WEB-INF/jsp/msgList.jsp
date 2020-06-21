<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- ckeditor -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/webjars/ckeditor/18.0.0/classic/ckeditor.js"></script>

        <!-- jquery -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js" ></script>

        <!-- bootstrap -->
        <link href="${pageContext.request.contextPath}/webjars/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet"/>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <title>萌新论坛</title>
    </head>
    <body>
        <!-- 消息展示 -->
        <table class="table table-striped">
            <c:forEach items="${requestScope.messages}" var="message"><br/>
                <tr>
                    <td>
                        <a href="/msg/showMsg.html?messageID=${message.messageID}">
                            ${message.messageTitle}
                        </a>
                    </td>
                    <td>
                        <div align="right">
                            发布人 ID：${message.employeeID}
                            发布时间：${message.publishTime}
                        </div>
                    </td>
                </tr>
            </c:forEach><br/>
        </table>


        <!-- 下部分页栏 -->
        <div align="center">
            <c:choose>
                <c:when test="${page.hasPrePage}">
                    <a type="button" class="btn btn-info" href="/msg/msgList.html?currentPage=1">首页</a>
                    <a type="button" class="btn btn-info" href="/msg/msgList.html?currentPage=${page.currentPage - 1}">上一页</a>
                </c:when>
                <c:otherwise>首页 上一页</c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${page.hasNextPage}">
                    <a type="button" class="btn btn-info" href="/msg/msgList.html?currentPage=${page.currentPage + 1}">下一页</a>
                    <a type="button" class="btn btn-info" href="/msg/msgList.html?currentPage=${page.totalPage}">尾页</a>
                </c:when>
                <c:otherwise>下一页 尾页</c:otherwise>
            </c:choose>

            <p>当前为第 ${page.currentPage} 页，共 ${page.totalPage} 页</p>
        </div>

    </body>
</html>