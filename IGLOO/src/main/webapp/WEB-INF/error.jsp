<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
	//	/IGLOO
%>

<jsp:include page="header.jsp"></jsp:include>
<div class="container">
	<p class="h2 text-danger mt-4">장애발생</p>
    <img src="<%= ctxPath%>/images/error.gif" class="img-fluid" /> <%-- 반응형 이미지 --%>
    <p class="h4 text-primary mt-3">빠른 복구를 위해 최선을 다하겠습니다</p>
</div>
<jsp:include page="footer.jsp"></jsp:include>