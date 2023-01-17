<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Space</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <script>
    	window.onload = function() {
    		setTimeout($("#fm").submit(),100);
		}
	</script>
</head>
<body>
        <div>
        	<form id="fm" name="fm" action="NaverJoin" method="post">
        		<input type="hidden" id="userid" name="userid" value="<c:out value='${result.id }'/>"/>
        		<input type="hidden" id="hp" name="hp" value="<c:out value='${result.mobile.replace("-","")}'/>"/>
        		<input type="hidden" id="mname" name="mname" value="<c:out value='${result.name }'/>"/>
        		<input type="hidden" id="mpwd" name="mpwd" value="naversnslogin"/>
        		<input type="hidden" id="birth" name="birth" value="<c:out value='${result.birthyear}${result.birthday.replace("-","")}'/>"/>
        	</form>
        </div>
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</body>

</html>