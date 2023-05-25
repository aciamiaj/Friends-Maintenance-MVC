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
      <title>Jaimaica's Friends</title>
   </head>
   <body>
      <h1>Jaimaica's Friends</h1>
      <c:set var="newRowAdded" value="false" />
      <sql:setDataSource 
         var="mydb" 
         driver="com.mysql.cj.jdbc.Driver" 
         url="jdbc:mysql://localhost:3306/w11_jaimaica" 
         user="root" 
         password="navarr0Jds1.." />
      <div>
         <table border="1">
            <tr>
               <th>Friend ID</th>
               <th>Name</th>
               <th>Email</th>
               <th>Age</th>
               <th>Favorite Color</th>
               <th></th>
            </tr>
            <sql:query dataSource="${mydb}" var="rs"> SELECT * FROM friends </sql:query>
            <c:forEach items="${rs.rows}" var="friend">
               <tr>
                  <td>${friend.friendID}</td>
                  <td>${friend.friendName}</td>
                  <td>${friend.emailAddr}</td>
                  <td>${friend.age}</td>
                  <td>${friend.favoriteColor}</td>
                  <td>
                     <form action="C_97_DeleteQuery" method="POST">
                        <input type="hidden" name="friendID" value="${friend.friendID}">
                        <button type="submit">Delete</button>
                     </form>
                  </td>
               </tr>
            </c:forEach>
            <c:if test="${status.last && newRowAdded}">
               <tr>
                  <td>
                     <c:out value="${param.friendID}" />
                  </td>
                  <td>
                     <c:out value="${param.friendName}" />
                  </td>
                  <td>
                     <c:out value="${param.emailAddr}" />
                  </td>
                  <td>
                     <c:out value="${param.age}" />
                  </td>
                  <td>
                     <c:out value="${param.favoriteColor}" />
                  </td>
               </tr>
            </c:if>
            <c:if test="${not empty param.friendID}">
               <sql:update dataSource="${mydb}">
                  INSERT INTO friends VALUES (?, ?, ?, ?, ?)
                  <sql:param value="${param.friendID}" />
                  <sql:param value="${param.friendName}" />
                  <sql:param value="${param.emailAddr}" />
                  <sql:param value="${param.age}" />
                  <sql:param value="${param.favoriteColor}" />
               </sql:update>
               <c:set var="newRowAdded" value="true" />
               <!-- Retrieve all products from the database -->
               <sql:query dataSource="${mydb}" var="rs"> SELECT * FROM friends </sql:query>
               <!-- Add the new row to the table -->
               <c:set var="lastRow" value="${fn:length(rs.rows) - 1}" />
               <tr>
                  <td>
                     <c:out value="${rs.rows[lastRow].friendID}" />
                  </td>
                  <td>
                     <c:out value="${rs.rows[lastRow].friendName}" />
                  </td>
                  <td>
                     <c:out value="${rs.rows[lastRow].emailAddr}" />
                  </td>
                  <td>
                     <c:out value="${rs.rows[lastRow].age}" />
                  </td>
                  <td>
                     <c:out value="${rs.rows[lastRow].favoriteColor}" />
                  </td>
               </tr>
            </c:if>
         </table>
      </div>
      <br/>
      <a href="V_97_AddForm.jsp">Add A New Friend</a>
   </body>
</html>