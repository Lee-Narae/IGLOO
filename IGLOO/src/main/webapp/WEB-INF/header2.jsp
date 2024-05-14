<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String ctxPath = request.getContextPath();
    //    /IGLOO
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IGLOO</title>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-Avb2QiuDEEvB4bZJYdft2mNjVShBftLdPG8FJ0V7irTLQ8Uo0qcPxh4Plq7G5tGm0rU+1SPhVotteLpBERwTkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQuery UI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/header.css" />
<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/js/main/main.js"></script>


</head>
<body>
	<nav id="nav_top" class="navbar navbar-expand-lg navbar-light fixed-top ">
		<a class="navbar-brand" href="<%= ctxPath%>/">
			<i class="fa-solid fa-ice-cream fa-3x"></i>
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto"> <!-- .mr-auto 는 css 의  margin-right: auto; 임. 즉, 가로축 미사용 공간 너비의 일부를 바깥 여백에 할당한다는 의미임. -->
		    	<li class="nav-item active">
		        	<a class="nav-link" href="#">
		        		<span class="color-first">메뉴</span>
		        	</a>
		      	</li>
		      	<li class="nav-item active">
		        	<a class="nav-link text-info" href="#">
						<span class="color-first">주문하기</span>
					</a>
		      	</li>
		      	<li class="nav-item active">
		        	<a class="nav-link" href="#">
						<span class="color-first">지점 찾기</span>
					</a>
		      	</li>
		      	<li class="nav-item active">
		        	<a class="nav-link" href="#">
						<span class="color-first">이벤트</span>
					</a>
		      	</li>
		      	<li class="nav-item active">
		        	<a class="nav-link" href="#">
						<span class="color-first">고객센터</span>
					</a>
		      	</li>
		      	<c:if test="${not empty sessionScope.login_user and sessionScope.login_user.userid != 'admin'}">
			      	<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">
				        	회원전용
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
				        	<a class="dropdown-item" href="#">Action</a>
				          	<a class="dropdown-item" href="#">Another action</a>
				          	<div class="dropdown-divider"></div>
				          	<a class="dropdown-item" href="#">Something else here</a>
				        </div>
			      	</li>
		      	</c:if>
		      	<c:if test="${not empty sessionScope.login_user and sessionScope.login_user.userid == 'admin'}">
			      	<li class="nav-item dropdown">
			        	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">
			          		관리자전용
			        	</a>
			        	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          		<a class="dropdown-item" href="#">Action</a>
			          		<a class="dropdown-item" href="#">Another action</a>
			          		<div class="dropdown-divider"></div>
			          		<a class="dropdown-item" href="#">Something else here</a>
		        		</div>
			      	</li>
		      	</c:if>
		      	<li class="nav-item">
		        	<a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
		      	</li>
		    </ul>
		    
			<form name="searchFrm" action="<%= ctxPath%>/icecream/icecreamSearch.ice" method="get" class="form-inline my-2 my-lg-0" >
		      	<input id="search" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
		      	<button id="btnSearch" class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
		    </form>
		    
	       <div class="text-end" style="margin-left: 2%;">
              <a style="color:black; text-decoration: none;" href="<%= ctxPath %>/login/장바구니.up"><i class="fa-solid fa-user fa-xl"></i>&nbsp;&nbsp;<span style="font-size: 10pt;">000님 로그인중</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
              <a style="color:black; text-decoration: none;" href="<%= ctxPath %>/login/마이페이지.up"><i class="fa-solid fa-cart-arrow-down fa-xl"></i>&nbsp;&nbsp;<span style="font-size: 10pt;">장바구니</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
              <a style="color:black; text-decoration: none;" href="<%= ctxPath %>/login/logout.up"><i class="fa-solid fa-right-from-bracket fa-xl"></i>&nbsp;&nbsp;<span style="font-size: 10pt;">로그아웃</span></a> 
          </div>
		</div>
	</nav>
<%-- 로그인 처리 --%>