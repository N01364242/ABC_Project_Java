<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Registration</title>
</head>
<body>
<form method="post" action="ProductRegistrationDB.jsp" >

<table > 
<tr>
<th colspan="2"><h2>Product Registration</h2> <br/>
* Required Field <br/></th>
</tr>
<tr>
<td><label for ="uname"> User Name*</label><br/>
<input type="text" name ="uname" value="${param.uname}" readonly="readonly"></td>
</tr>
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/group_project"
                           user="root"  password="root"/>
 <sql:query dataSource="${dbsource}" var="products">
            select * from product;
        </sql:query>
<tr>
<td><label for="product">Product Name*</label><br/>
<select name ="product">


<c:forEach var="row" items="${products.rows}">
                   
                        <option><c:out value="${row.productname}"></c:out> </option>
                                    </c:forEach>
                </select>
</td>
</tr>

<tr>
<td><label for ="purchase"> Purchase Date*</label><br/>
<input type="text" name ="purchase"></td>
</tr>
<tr>
<td colspan="2" ><input type="submit" value="submit" >
<input type="reset" value="Reset">
</td>
</tr>
</table>
</form>
</body>


</html>