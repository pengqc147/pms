<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>创建任务</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/pro/proListInAnal",
                success:function (msg) {
                    $(msg).each(function (index,item) {
                        var option = "<option value='"+item.pid+"'>"+item.pname+"</option>";
                        $("#proname").append(option);
                    });
                }
            });
        });
        function parseAnalysis(pid) {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/anal/Info",
                success:function (msg) {
                    $(msg).each(function (index,item) {
                        var option = "<option value=''>"+item.title+"</option>";
                        $("#analTitle").append(option);
                    });
                }
            });
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/mod/list",
                success:function (msg) {
                    $(msg).each(function (index,item) {
                        var option = "<option value='"+item.id+"'>"+item.modname+"</option>";
                        $("#moduleName").append(option);
                    });
                }
            });
        }
        function parseFunction(id) {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/func/list",
                success:function (msg) {
                    $(msg).each(function (index,item) {
                        var option = "<option value=''>"+item.functionname+"</option>";
                        $("#functionName").append(option);
                    });
                }
            });
        }
    </script>
</head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
<tr>
 <td height="26" background="skin/images/newlinebg3.gif">
  <table width="58%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td >
    当前位置:任务管理>>创建任务
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;创建任务&nbsp;</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">参考位置：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
        <select id="proname" onchange="parseAnalysis(this.value)">
            <option>请选择...</option>
        </select>-
        <select id="analTitle">
            <option value=1>请选择...</option>
            <option value=1>帐户管理需求分析</option>
        </select>-
        <select id="moduleName" onchange="parseFunction(this.value)">
            <option>请选择...</option>
            <option value=1>帐户管理模块</option>
        </select>-
        <select id="functionName">
            <option>请选择...</option>
            <option value=1>添加帐户功能</option>
        </select>
    </td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">任务标题：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">开始时间：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">结束时间：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">执行者：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><select><option value=1>张含馨--初级程序员</option><option value=1>张&nbsp;&nbsp;伟--中级程序员</option><option value=1>孙传杰--项目经理</option></select></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">优先级：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><select><option>高</option><option>中</option><option>低</option><option>暂缓</option></select></td>
</tr>

<tr >
	<td align="right" bgcolor="#FAFAF1" >详细说明：</td>
	<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
		<textarea rows=10 cols=130></textarea>
	</td>
</tr>


<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a href="task-add.jsp" class="coolbg">保存</a>
</td>
</tr>
</table>

</form>
  

</body>
</html>