<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

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
        <!-- 具体消息展示页 -->
        <div>
            <!-- 消息主体 -->
            <div>
                <h2>${message.messageTitle}</h2>
                <p>${message.messageContent}</p>
            </div>

            <div>
                发布人ID：${message.employeeID}
                发布时间：${message.publishTime}
            </div>

            <hr/>

            <div id="reply">
                <h2>回复：</h2>
                <c:forEach items="${requestScope.replyList}" var="reply">
                    <div>
                        ${reply.replyContext}
                        <div align="right">
                            回复人ID：${reply.employeeID}
                            回复时间：${reply.replyTime}
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- 回复 -->
        </div>

        <hr/>

        <h2>发送回复：</h2>
        <!-- 文本编辑器 -->
        <div>
            <label for="editor"></label>
            <div id="editor">
                <p></p>
            </div>
            <input type="hidden" id="messageID" value="${message.messageID}">
            <p><button id="sub_btn">提交</button></p>
        </div>

        <script type="text/javascript">
            let data;
            ClassicEditor
                .create( document.querySelector( '#editor' ) )
                .then(editor => {
                    // 将 editor 置为全局变量
                    window.editor = editor;
                    data = editor.getData();
                    console.log(data);
                })
                .catch(error => {
                    console.error( error );

                });


            $("#sub_btn").click(function () {
                let content = editor.getData();
                let messageID = $("#messageID").val();

                if (content == null || content.length === 0) {
                    alert("内容不能为空");
                    return false;
                }

                $.ajax({
                    url:"/reply/commitReply.action",
                    type:"POST",
                    //将提交的表单数据序列化为 key 和 value 数据
                    data:{
                        "content":content,
                        "messageID":messageID
                    },
                    success:function (reply) {
                        $("<div></div>")
                            .append(reply.replyContext)
                            .append($("<div></div>")
                                .attr("align", "right")
                                .append("回复人ID：" + reply.employeeID)
                                .append("回复时间：" + reply.replyTime))
                            .appendTo($("#reply"));
                    }
                });
            });
        </script>
    </body>
</html>