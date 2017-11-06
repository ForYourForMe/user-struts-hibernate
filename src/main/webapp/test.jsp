<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	
	<script type="text/javascript" src="plugins/jquery-2.1.3.js"></script>
	<script type="text/javascript" src="js/jquery-html5Validate.js"></script>
</head>
<body>
	<form>
		<input type="text" name="name" required  data-min="4" data-max="6"/>
		<input type="password" name="password" required  data-min="4" data-max="6"/>
		
		<button>提交</button>
	</form>
	<script>
		$(function(){
			$('form').html5Validate(function(){
				alert("success");
			});
		});
	</script>
</body>
</html>