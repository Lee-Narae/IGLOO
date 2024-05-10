<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
    String ctx_Path = request.getContextPath();
    //    /IGLOO
    // 반드시 변수명을 다르게 지정해주어야 한다. 같을 시 중복 될 수 있다.
%>

<jsp:include page="../header.jsp" />

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctx_Path%>/css/login/login.css" />
<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctx_Path%>/js/login/login.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//=== 로그인을 하지 않은 상태일 때 
	//     로컬스토리지(localStorage)에 저장된 key가 'saveid' 인 userid 값을 불러와서 
	//     input 태그 userid 에 넣어주기 ===
	if(${empty sessionScope.login_user}){
		
		const loginUserid = localStorage.getItem('saveid');
		// const loginPwd = localStorage.getItem('savepwd');
		
		console.log(loginUserid);
		if(loginUserid != null){
			$("input#loginUserid").val(loginUserid);
			$("input:checkbox[id='saveid']").prop("checked", true);
		}
		<%-- 
		보안상 민감한 데이터는 로컬스토리지 또는 세션스토리지에 저장시켜두면 안된다.!!!
		현재 암호저장 체크박스를 주석문 처리했다.
		--%>
		/*
		if(loginPwd != null){
			$("input#loginPwd").val(loginPwd);
			$("input:checkbox[id='savepwd']".prop("checked", true);
		}
		*/
	}	// end of if------------
	
})	// end of $(document).ready(function(){})----------------
</script>

<%-- === 로그인을 하기 위한 폼을 생성 === --%>

	<form name="loginFrm" action="<%= ctx_Path%>/login/login.ice" method="post">
    	<table id="loginTbl">
        	<thead>
            	<tr>
                	<th colspan="2">LOGIN</th>
              	</tr>
          	</thead>
          	<tbody>
              	<tr>
                  	<td>ID</td>
                  	<td><input type="text" name="userid" id="loginUserid" size="20" autocomplete="off" /></td>
              	</tr>
              	<tr>
                  	<td>암호</td>
                  	<td><input type="password" name="pwd" id="loginPwd" size="20" autoComplete="off"/></td>
                  	<%-- autoComplete="off" => password 자동입력 막기--%>
              	</tr>
              
              	<%-- ==== 아이디 찾기, 비밀번호 찾기 ==== --%>
              	<tr>
                  	<td colspan="2">
                     	<a style="cursor: pointer;" data-toggle="modal" data-target="#userIdfind" data-dismiss="modal">아이디찾기</a> / 
                     	<a style="cursor: pointer;" data-toggle="modal" data-target="#passwdFind" data-dismiss="modal" data-backdrop="static">비밀번호찾기</a>
                  	</td>
              	</tr>
              
              	<tr>
                  	<td colspan="2">
                     	<input type="checkbox" id="saveid" />&nbsp;<label for="saveid">아이디저장</label> 
	                     <%-- 보안상 민감한 데이터는 로컬스토리지 또는 세션스토리지에 저장시켜두면 안된다.!!!
	                     <input type="checkbox" id="savepwd" />&nbsp;<label for="savepwd">암호저장</label> 
	                     --%>
                     	<button type="button" id="btnSubmit" class="btn btn-primary btn-sm ml-3">로그인</button> 
                  	</td>
              	</tr>
          	</tbody>
      	</table>
   </form>
   	
<%-- ****** 아이디 찾기 Modal 시작 ****** --%>
   <%-- <div class="modal fade" id="userIdfind"> --%> 
   <%-- 만약에 모달이 안보이거나 뒤로 가버릴 경우에는 모달의 class 에서 fade 를 뺀 class="modal" 로 하고서 해당 모달의 css 에서 zindex 값을 1050; 으로 주면 된다. --%> 
    
   <%-- Bootstrap s20_modal --%>
   <div class="modal fade" id="userIdfind" data-backdrop="static">
	   <%-- 
	   	data-backdrop="static" 이 있으면 바깥을 눌렀을 때 창이 안 닫히고
	   	data-backdrop="static" 이 없으면 바깥을 눌렀을 때 창이 닫힌다.
	   --%>
    
	   <div class="modal-dialog">
	   		<div class="modal-content">
	      
		        <%-- Modal header --%>
		        <div class="modal-header">
		        	<h4 class="modal-title">아이디 찾기</h4>
		          	<button type="button" class="close idFindClose" data-dismiss="modal"><%-- X 위치 --%>&times;</button>
		        </div>
		        
		        <%-- Modal body --%>
		        <div class="modal-body">
		          	<div id="idFind">
		             	<iframe id="iframe_idFind" style="border: none; width: 100%; height: 350px;" src="<%= ctx_Path%>/login/idFind.ice">
		             	</iframe>
		          	</div>
		        </div>
		        
		        <%-- Modal footer --%>
		        <div class="modal-footer">
		          	<button type="button" class="btn btn-danger idFindClose" data-dismiss="modal">Close</button>
		        </div>
	    	</div>
	  	</div>
	</div>
<%-- ****** 아이디 찾기 Modal 끝 ****** --%>

<%--
  ◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆
--%>

<%-- ****** 비밀번호 찾기 Modal 시작 ****** --%>
  	<div class="modal fade" id="passwdFind"> <%-- 만약에 모달이 안보이거나 뒤로 가버릴 경우에는 모달의 class 에서 fade 를 뺀 class="modal" 로 하고서 해당 모달의 css 에서 zindex 값을 1050; 으로 주면 된다. --%>
    	<div class="modal-dialog">
      		<div class="modal-content">
      
		        <%-- Modal header --%>
		        <div class="modal-header">
		          <h4 class="modal-title">비밀번호 찾기</h4>
		          <button type="button" class="close passwdFindClose" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <%-- Modal body --%>
		        <div class="modal-body">
		        	<div id="pwFind">
		             	<iframe id="iframe_pwdFind" style="border: none; width: 100%; height: 350px;" src="<%= ctx_Path%>/login/pwdFind.ice">  
		             	</iframe>
		          	</div>
		        </div>
		        
		        <%-- Modal footer --%>
		        <div class="modal-footer">
		        	<button type="button" class="btn btn-danger passwdFindClose" data-dismiss="modal">Close</button>
		        </div>
      		</div>
    	</div>
  	</div> 
<%-- ****** 비밀번호 찾기 Modal 끝 ****** --%>

<jsp:include page="../footer.jsp" />
 