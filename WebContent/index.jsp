<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작페이지</title>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
</head>
<body>
<input id="input" type="text">
<input id="btn" type="button" value="상세페이지로">
<script>
	$("#btn").on("click",function(){
		location.href = "index.classInfo?classId="+$("#input").val();
	})
</script>
</body>
</html>