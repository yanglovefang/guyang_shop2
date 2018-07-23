<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path=request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path %>/css/style.css" type="text/css">
<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	var c=1;
	function muhu() {
		var miao = $("input[name=miao]").val();
		var sname = $("input[name=sname]").val();
		var kai = $("input[name=kai]").val();
		var jie = $("input[name=jie]").val();
		location.href="getList?sname="+sname+"&&miao="+miao+"&&kai="+kai+"&&jie="+jie;
	}
	function fan() {
		if(c==1){
			$(".cks").attr("checked",true);
			c=2;
		}else{
			$(".cks").attr("checked",false);
			c=1;
		}
		
	}
	function pl() {
		var cks = document.getElementsByName("cks");
		var ids = "";
		for(var i = 0;i < cks.length ; i++){
			if(cks[i].checked){
				ids += "," + cks[i].value;
			}
		}
		ids = ids.substring(1);
		alert(ids);
		$.ajax({
			url:"plsc",
			data:{ids:ids},
			dataType:"json",
			type:"post",
			success:function(data){
				alert("删除成功");
				location.href="getList";
			}
		})
	}
	function save() {
		location.href="save.jsp";
	}
</script>
</head>
<body>
	<input type="button" value="批量删除" onclick="pl()">
	<input type="button" value="添加" onclick="save()">
	<table>
		<tr>
			<td></td>
			<td colspan="7">
			<input type="text" onClick="WdatePicker()" name="kai" value="${param.kai}">--
			<input type="text" onClick="WdatePicker()" name="jie" value="${param.jie}">
			<input type="text" name="miao" value="${param.miao}">
			<input type="text" name="sname" value="${param.sname}">
			</td>
			<td colspan="3">
			<input type="button" value="搜商品" onclick="muhu()">
			</td>
		</tr>
		<tr>
			<td><input type="checkbox" id="quan" onchange="fan()"></td>
			<td>ID</td>
			<td>缩略图</td>
			<td>商品名称</td>
			<td>描述</td>
			<td>单价</td>
			<td>创建日期</td>
			<td>更新日期</td>
			<td>发布状态</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${s}" var="ss">
			<tr>
				<td><input type="checkbox" name="cks" class="cks" value="${ss.sid}"></td>
				<td>${ss.sid}</td>
				<td><img alt="" src="<%=path %>/${ss.url}"  width="90px;" height="60px;"></td>
				<td>${ss.sname}</td>
				<td>${ss.miao}</td>
				<td>${ss.price}</td>
				<td>${ss.creatTime}</td>
				<td>${ss.updateTime}</td>
				<td>${ss.tai}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><a href="getList?page=${p.prevPage}">上一页</a></td>
			<td colspan="5"><a href="getList?page=${p.nextPage}">下一页</a></td>
		</tr>
	</table>
</body>
</html>