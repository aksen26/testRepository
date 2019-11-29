<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //1. 전달 파라미터 인코딩 처리
    request.setCharacterEncoding("UTF-8");
    
    //2. 전달된 파라미터 변수에 담기
    String name = request.getParameter("name");
    String color = request.getParameter("color");
    String animal = request.getParameter("animal");
    String[] food = request.getParameterValues("food");
    
    %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		$(function(){
			<%
				switch(color){
				case "빨강": 
				
			%>
							$("#color").append("<img src='<%=request.getContextPath()%>/images/red.png'>");
			
			<%
				break;
				case "파랑":
			%>				
							$("#color").append("<img src='<%=request.getContextPath()%>/images/blue.png'>");
			
			<%
				break;
				case "노랑":
			%>
							$("#color").append("<img src='<%=request.getContextPath()%>/images/yellow.png'>");
			
			
			
			<%
				break;
				}
			%>
			
			<%
			switch(animal){
			case"강아지":
			
			%>
			
						$("#animal").append("<img src='<%=request.getContextPath()%>/images/dog.png'>");
			
			<%
				break;
			case"고양이":
			%>			
						$("#animal").append("<img src='<%=request.getContextPath()%>/images/cat.png'>");		
			
						
			<%
				break;
			case"금붕어":
			%>			
			
						$("#animal").append("<img src='<%=request.getContextPath()%>/images/fish.png'>");
			
			<%
				break;
				}
			%>
			
			<%
			if(food==null){
			
			}else{
			
			for(int i=0; i<food.length; i++){
			switch(i){
			case 0:
			
			%>
					$("#food").append("<img src='<%=request.getContextPath()%>/images/jjm.png'>");
					
			<%
			break;
			case 1: 
			%>		
					$("#food").append("<img src='<%=request.getContextPath()%>/images/jjbong.png'>");
			
			<%
			break;
			case 2: 
			%>
					$("#food").append("<img src='<%=request.getContextPath()%>/images/tangsy.png'>");
			
			<%
			break;
			case 3: 
			%>		
					$("#food").append("<img src='<%=request.getContextPath()%>/images/yang.png'>");		
			
			<%
			break;
			case 4: 
			%>
					$("#food").append("<img src='<%=request.getContextPath()%>/images/palbc.png'>");
			
			
			
			<%
			break;
			}
			}
			}
			%>
		});
	</script>

<div id="container">
	<div id="header">
		<h2><span style="color:orangered;"></span>님의 개인 취향 테스트 결과</h2>
	</div>
	<div id="color">
		<span class="title">당신이 좋아하는 색깔은? </span><br>
	</div>
	<div id="animal">
		<span class="title">당신이 좋아하는 동물은? </span><br>
	</div>
	<div id="food">
		<span class="title">당신이 좋아하는 음식은? </span><br>
	</div>
</div>

</body>
</html>