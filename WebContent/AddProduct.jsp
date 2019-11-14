<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
</head>
<body>
<c:if test="${ empty param.productname or empty param.colour or empty param.warranty_date or empty param.price or empty param.brandname}">
            <c:redirect url="ProductDetails.jsp" >
                <c:param name="errMsg" value="Please Enter All Details" />
            </c:redirect>
 
        </c:if>
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/group_project"
                           user="root"  password="root"/>
                           <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO product(`productname`,`colour`,`warranty_date`,`price`,`brandname`) VALUES (?,?,?,?,?);
            <sql:param value="${param.productname}" />
            <sql:param value="${param.colour}"/>
            <sql:param value="${param.warranty_date}" />
            <sql:param value="${param.price}" />
            <sql:param value="${param.brandname}" />
            
        </sql:update>
        <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
            <c:redirect url="ProductDetails.jsp" >
            </c:redirect>
        </c:if> 
</body>
</html>