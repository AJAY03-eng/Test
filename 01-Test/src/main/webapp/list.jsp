<%@ page import="java.sql.*" %>
<%@ page import="Conn.ConnectionPool" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>

    
</head>

<body>

<h2>Student Details</h2>

<table>
    <tr>
        <th>Student ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Standard</th>
        <th>Address</th>
    </tr>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = ConnectionPool.giveConnection();

        String fetch = "SELECT studentid, name, email, phone, standard, address FROM users";
        ps = con.prepareStatement(fetch);
        rs = ps.executeQuery();

        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getString("studentid") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("standard") %></td>
                <td><%= rs.getString("address") %></td>
            </tr>
<%
        }
    } catch (Exception e) {
        
        e.printStackTrace();
    }
%>

</table>
 <a href="index.jsp">BACK TO ADD PAGE</a>
</body>
</html>
