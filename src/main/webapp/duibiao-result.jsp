<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>对标管理</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/static/js/echarts.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/coll/list/2019-10-31",
                success: function (msg) {
                    var dacname = [];
                    var daturnover = [];
                    $(msg).each(function (index,item) {
                        dacname.push(item.dacname);
                        daturnover.push(item.daturnover);
                    });
                    // 基于准备好的dom，初始化echarts实例
                    var myChart = echarts.init(document.getElementById("box"));
                    // 指定图表的配置项和数据
                    var option = {
                        title: {
                            text: '2019年教育行业营业表',
                            left:"center",
                            top:"bottom"
                        },
                        legend: {
                            data:['营业额']
                        },
                        xAxis: {
                            data: dacname,
                            name:"企业名称"
                        },
                        yAxis: {
                            axisLabel:{
                                formatter:'{value} 亿'
                            },
                            name:"营业额"
                        },
                        series: [{
                            name: '销量',
                            type: 'bar',
                            data: daturnover,
                        }]
                    };
                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
                }
            })
        })
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
    当前位置:对标管理>>对标分析
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<div id="box" style="width:800px;height:600px;"></div>
</body>
</html>