<%@page import="com.sun.appserv.jdbc.DataSource"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
    <head>
        <title>index</title>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    </head>
    <body>
        <h1>index</h1>
<%--         <sql:setDataSource dataSource="jdbc/oracle_test" var="db" scope="application" />
        <sql:query var="rs" dataSource="${db}" >select TEST_UTIL.TEST_SLEEP() from dual</sql:query> --%>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%
    try {
    	Context context=new InitialContext();
    	DataSource dataSource=(DataSource)context.lookup("jdbc/org_chintaidb");
    	Connection conn=dataSource.getConnection();
    	PreparedStatement statement
        =conn.prepareStatement("select TEST_UTIL.TEST_SLEEP() from dual");
    	ResultSet result=statement.executeQuery();
    } catch (NamingException e) {
    	throw new ServletException(e);
    } catch (SQLException e) {
    	throw new ServletException(e);
    }


%>
    </body>
</html>