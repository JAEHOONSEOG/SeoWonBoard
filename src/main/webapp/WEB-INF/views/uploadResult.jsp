<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<title>Upload Result</title>
</head>
<body>
<script>
	var result = "${savedName}";

	parent.addFilePath(result);
</script>
</body>
</html>