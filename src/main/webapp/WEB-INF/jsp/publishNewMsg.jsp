<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>萌新论坛</title>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/webjars/ckeditor/18.0.0/classic/ckeditor.js"></script>

        <!-- jquery -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js" ></script>

        <!-- bootstrap -->
        <link href="${pageContext.request.contextPath}/webjars/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet"/>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <body>

        <div>
            <label>
                <input type="text" name="title" id="title">
            </label>
            <label for="editor"></label>
            <div id="editor">
                <p>Hello World!!!</p>
            </div>
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
                let title = $("#title").val();

                if (title == null || title.length === 0) {
                    alert("标题不能为空");
                    return false;
                }

                if (content == null || content.length === 0) {
                    alert("内容不能为空");
                    return false;
                }

                $.ajax({
                    url:"/msg/sendMsg.html",
                    type:"POST",
                    //将提交的表单数据序列化为 key 和 value 数据
                    data:{
                        "content":content,
                        "title":title
                    },
                    success:function () {
                        window.location.href="/msg/msgList.html";
                    }
                });
            });
        </script>
    </body>
</html>