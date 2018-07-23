<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	$(function() {
		$.ajax({
			url:"typeList",
			type:"post",
			dataType:"json",
			success:function(data){
				var t= data;
				alert(t);
				for(var i=0;i<t.length;i++){
					$("#he").append("<option value="+t[i].tid+">"+t[i].tname+"</option>");
				}
			}
		});
	})
</script>
</head>
<body>
	<form action="save" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>产品标号</td>
			<td><input type="text" name="sid"></td>
		</tr>
		<tr>
			
			<td>产品标题</td>
			<td><input type="text" name="sname"></td>
		</tr>
		<tr>
			<td>间接描述</td>
			<td><input type="text" name="miao"></td>
		</tr>
		<tr>
			<td>商品分类</td>
			<td><select name="tid" id="he"></select></td>
		</tr>
		<tr>
			<td>产品展示价格</td>
			<td><input type="text" name="price">元</td>
		</tr>
		<tr>
			<td>库存数量</td>
			<td><input type="text" name="ku">件</td>
		</tr>
		<tr>
			<td>购买限制数量</td>
			<td><input type="text" name="xain">件</td>
		</tr>
		<tr>
			<td>展示缩略图片上传</td>
			<td><input type="file" name="file">点击选中图片</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="保存"></td>
		</tr>
	</table>
	</form>
</body>
</html>