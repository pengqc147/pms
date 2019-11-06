<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>发件箱</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/moment.min.js"></script>
	<script type="application/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
	<script type="application/javascript">
	$(function(){
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/notice/jsonList",
			success:function(msg){
			    //1.遍历数据
				$(msg.map.page.list).each(function(index,item){
				    var dateInfo= new Date(item.ndate);
				    var month = dateInfo.getMonth()+1;
				    var date = dateInfo.getDate()
					if(month<10){
					    month = "0"+month;
					}
                    if(date<10){
                        date = "0"+date;
                    }
				    var fianlDate= dateInfo.getFullYear()+"-"+month+"-"+date;
					var tr =" <tr name='appendtr'class='addtr' align='center' bgcolor='#FFFFFF' onMouseMove='javascript:this.bgColor='#FCFDEE';'onMouseOut='javascript:this.bgColor='#FFFFFF';' height='22' > <td><input name='id' type='checkbox' id='id' value='"+index.nid+"' class='np'></td>"
					+"<td>"+((msg.map.page.pageNum-1)*msg.map.page.pageSize+(index+1))+"</td>"
					+"<td>"+item.ntitle+"</td>";
					if(item.remark.length >6 ){
                        tr+="<td align='center'>"+item.remark.substring(0,40)+"......</td>";
					}else{
                        tr+="<td align='center'>"+item.remark+"</td>";
					}
					tr+="<td>"+fianlDate+"</td>"
					+"<td><a href='#'>删除</a> |<a href='#'>编辑</a> | <a href='#'>查看详情</a></td> </tr>";
					$("#tr2").before(tr);
				});
				//2.遍历分页
				var div = "<div></div>";
				var firstPage="<a onclick='findList(this.name)' href='javascript:void(0)' name='"+msg.map.requestURI+"?pageNum=1"+msg.map.queryStr+"'>首页&nbsp;</a>";
				var prePage="<a onclick='findList(this.name)' href='javascript:void(0)' name='"+msg.map.requestURI+"?pageNum="+(msg.map.page.pageNum-1)+msg.map.queryStr+"'>上一页&nbsp;</a>";
                var nowPage="";
				$(msg.map.page.navigatepageNums).each(function (index,item) {

				    nowPage=nowPage+"<a onclick='findList(this.name)' href='javascript:void(0)' name='"+msg.map.requestURI+"?pageNum="+item+msg.map.queryStr+"'>"+item+"&nbsp;</a>";

                })



				var nextPage="<a onclick='findList(this.name)' href='javascript:void(0)' name='"+msg.map.requestURI+"?pageNum="+(msg.map.page.pageNum+1)+msg.map.queryStr+"'>下一页&nbsp;</a>";
				var lastPage="<a onclick='findList(this.name)' href='javascript:void(0)' name='"+msg.map.requestURI+"?pageNum="+msg.map.page.pages+msg.map.queryStr+"'>尾页</a>";
				$(div).append(firstPage).append(prePage).append(nowPage).append(nextPage).append(lastPage).appendTo($("#pageCut"));
			},
			error:function(){
				alert("-----");
			}
		});
	});
	function findList(obj) {
        $.ajax({
            type:"GET",
            url:obj,
            success:function(msg){
                //原来的tr删除
				$("tr[name=appendtr]").remove();
                //1.遍历数据
                $(msg.map.page.list).each(function(index,item){
                    var dateInfo= new Date(item.ndate);
                    var month = dateInfo.getMonth()+1;
                    var date = dateInfo.getDate()
                    if(month<10){
                        month = "0"+month;
                    }
                    if(date<10){
                        date = "0"+date;
                    }
                    var fianlDate= dateInfo.getFullYear()+"-"+month+"-"+date;
                    var tr =" <tr name='appendtr' class='addtr' align='center' bgcolor='#FFFFFF' onMouseMove='javascript:this.bgColor='#FCFDEE';'onMouseOut='javascript:this.bgColor='#FFFFFF';' height='22' > <td><input name='id' type='checkbox' id='id' value='"+index.nid+"' class='np'></td>"
                        +"<td>"+((msg.map.page.pageNum-1)*msg.map.page.pageSize+(index+1))+"</td>"
                        +"<td>"+item.ntitle+"</td>";
                    if(item.remark.length >6 ){
                        tr+="<td align='center'>"+item.remark.substring(0,40)+"......</td>";
                    }else{
                        tr+="<td align='center'>"+item.remark+"</td>";
                    }
                    tr+="<td>"+fianlDate+"</td>"
                        +"<td><a href='#'>删除</a> |<a href='#'>编辑</a> | <a href='#'>查看详情</a></td> </tr>";
                    $("#tr2").before(tr);
                });

            },
            error:function(){
                alert("-----");
            }
        });

		return false;//异步请求
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
    当前位置:信息箱>>通知公告
 </td>
	  <td>
		  <input type='button' class="coolbg np" onClick="location='notice-send.jsp';" value='发布新通告' />
	  </td>
 </tr>
</table>
</td>
</tr>
</table>

<!--  搜索表单  -->

<!--  内容列表   -->
<form name="form2">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;发件箱&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FAFAF1" height="22">
	<td width="4%">选择</td>
	<td width="6%">序号</td>
	<td width="10%">标题</td>
	<td width="10%">内容</td>
	<td width="8%">发送时间</td>
	<td width="8%">操作</td>
</tr>

<%--<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
	<td><input name="id" type="checkbox" id="id" value="101" class="np"></td>
	<td>1</td>
	<td>项目完成的咋样?</td>
	<td align="center"><span >最近工作累不？项目完成的咋样?加油哈</span></td>
	<td>2015-02-03</td>
	<td><a >删除</a></td>
</tr>--%>


<tr bgcolor="#FAFAF1" id="tr2">
<td height="28" colspan="12">
	&nbsp;
	<a href="" class="coolbg">全选</a>
	<a href="" class="coolbg">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="" class="coolbg">&nbsp;删除&nbsp;</a>
	<a href="" class="coolbg">&nbsp;导出Excel&nbsp;</a>
</td>
</tr>
<tr align="right" bgcolor="#EEF4EA">
	<td height="36" colspan="12" align="center" id="pageCut">

	</td>
</tr>

</table>

</form>
  

</body>
</html>