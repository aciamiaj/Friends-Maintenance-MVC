<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add A New Friend</title>
</head>
<body>
<h1>Add A New Friend</h1>
<form method="post" action="C_97_AddQuery">
	<pre>

     Friend ID: <input type="number" name="friendID">
   Friend Name: <input type="text" name="friendName">
 Email Address: <input type="email" name="emailAddr">
	   Age: <input type="number" name="age">
Favorite Color: <input type="text" name="favoriteColor"><br />
		<button type="submit">Submit</button> <button type="reset">Clear</button>			     
	</pre>
</form>
</body>
</html>
