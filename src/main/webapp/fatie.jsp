<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/js/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/js/utf8-jsp/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/js/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
    <form action="${pageContext.request.contextPath}/tiezi/saveInfo" method="post">
        标题： <input type="text" name="forumtitle" placeholder="请输入标题"></br>
        内容： <script id="editor" name="forumcontent" type="text/plain" style="width:1024px;height:500px;"></script></br>
        <div align="center"><input type="submit" style="align:center" value="发帖"></div>

    </form>


    <script type="text/javascript">
        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('editor');
    </script>


</body>
</html>
