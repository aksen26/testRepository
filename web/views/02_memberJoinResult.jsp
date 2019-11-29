<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
   <%
   	//1. 한글 인코딩 처리
   	request.setCharacterEncoding("UTF-8");
   
   	//2. 값 꺼내기
   	String userId = request.getParameter("userId");
   	String password = request.getParameter("password");
   	String userName = request.getParameter("userName");
   	int age = Integer.parseInt(request.getParameter("age"));
   	String gender = request.getParameter("gender");
   	String email = request.getParameter("email");
   	String phone = request.getParameter("phone");
   	String address = request.getParameter("address");
   	String[] hobbyArr = request.getParameterValues("hobby");
   	
   	String hobby = String.join(",", hobbyArr);
   	
   	//3. 비지니스 로직
   	Connection con = null;
   	PreparedStatement pstmt = null;
   	String msg = null;
   	
   	String query = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,?,SYSDATE)";
   	
   	Class.forName("oracle.jdbc.driver.OracleDriver");
   	
   	con = DriverManager.getConnection("jdbc:oracle:thin:@programmer7771.iptime.org:1521:xe", "jsp", "jsp");
   	pstmt = con.prepareStatement(query);
   	
   	pstmt.setString(1, userId);
   	pstmt.setString(2, password);
   	pstmt.setString(3, userName);
   	pstmt.setString(4, gender);
   	pstmt.setInt(5, age);
   	pstmt.setString(6, email);
   	pstmt.setString(7, phone);
   	pstmt.setString(8, address);
   	pstmt.setString(9, hobby);
   	
   	int result = pstmt.executeUpdate();
   	
   	if(result >0){
   		con.commit();
   		msg = "성공적으로 회원가입이 완료되었습니다.";
   	}else{
   		con.rollback();
   		msg = "회원가입에 실패했습니다.";
   	}
   	pstmt.close();
   	con.close();
   	
   	
   %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center"><span style="color:<%
	String success="";
	if(result>0){
		success="green";
	}else{
		success="red";
	}
	%><%=success%>"><%= msg %></span></h1>
</body>
</html>