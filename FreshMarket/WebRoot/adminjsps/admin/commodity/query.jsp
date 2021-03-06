<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>查询商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">

</style>

<script type="text/javascript" src="<c:url value='/ajax-lib/ajaxutils.js'/>"></script>
    <script type="text/javascript">
    window.onload = new function(){
    	ajax(
    		  {
	    		url:"<c:url value='/AdminCommodityTypeServlet?method=getAllCommodityType'/>",
	    		callback:function(data) {
						var arr = data.split(",");
						// 循环遍历每个商品(种类编号:商品种类名称)，每个名称生成一个option对象，添加到<select>中
						
							for(var i = 0; i < arr.length; i++) {
								var a = arr[i].split(":");
								var op = document.createElement("option");//创建一个指名名称元素
								op.value = a[0];//设置op的实际值为当前的商品种类编号
								var textNode = document.createTextNode(a[1]);//创建文本节点
								op.appendChild(textNode);//把文本子节点添加到op元素中，指定其显示值
								
								document.getElementById("type").appendChild(op);
							}
					}
			   }
    	);
    };
    
    
    </script>

  </head>
  
  <body>
    <h2>商品信息查询</h2>
    <form action="<c:url value='/AdminCommodityServlet'/>" method="get"><%--请求需要改为get方式 --%>
  	  <input type="hidden" name="method" value="queryCommodity"/>
    	商品名称:<input type="text" name="commodityName"><br>
    	商品类型:<select name="commodityTypeID" id="type">
    				<option value="-1">===请选择类型===</option>
  					
    			</select><br>
    	<input type="submit" value="查询">
    
    </form>
  </body>
</html>
