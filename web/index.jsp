<%--
  Created by IntelliJ IDEA.
  User: jiawenqing
  Date: 2018/6/5
  Time: 下午10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.DataSource" %>
<html>
<head>
  <title>Tomcat6.0 JNDI!</title>
</head>
<body>
Tomcat连接池测试,获取数据源 <br>
<%
  try {
    //初始化查找命名空间
    Context ctx = new InitialContext();
    //参数java:/comp/env为固定路径
    Context envContext = (Context)ctx.lookup("java:/comp/env");
    //参数jdbc/mysqlds为数据源和JNDI绑定的名字
    DataSource ds = (DataSource)envContext.lookup("jdbc/mysqlds");
    Connection conn = ds.getConnection();
    conn.close();
    out.print("<span style='color:red;'>JNDI测试成功<span>");
  } catch (NamingException e) {
    e.printStackTrace();
    out.print(" ---NamingException--- "+e.getMessage());
  } catch (SQLException e) {
    e.printStackTrace();
    out.print("----SQLException----"+e.getMessage());

  }
%>
</body>
</html>
