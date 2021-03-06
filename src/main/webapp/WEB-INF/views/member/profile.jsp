<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>TempCat</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="<c:url value="/resources/js/jquery-3.4.1.js/"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/assets/css/style.css"/>" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="<c:url value="/"/>">Blog Contents</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="<c:url value="/intro"/>">Intro</a></li>
					<li><a href="<c:url value="/notice/noticelist"/>">Notice Board</a></li>
					<li><a href="<c:url value="/free/freelist"/>">Free Board</a></li>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search"><a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="<c:url value="/searchlist"/>">
							<input type="text" name="searchText" placeholder="Title" />
						</form></li>
					<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<section id="menu">

			<!-- Search -->
			<section>
				<form id="search" method="get" action="<c:url value="/searchlist"/>">
					<input type="text" name="searchText" placeholder="Title" />
				</form>
			</section>

			<!-- Links -->
			<section>
				<ul class="links">
					<li><a href="<c:url value="/intro"/>">
							<h3>INTRO</h3>
							<p>Introduction to the Producer</p>
						</a></li>
					<li><a href="<c:url value="/notice/noticelist"/>">
							<h3>NOTICE BOARD</h3>
							<p>Only Admin can write</p>
						</a></li>
					<li><a href="<c:url value="/free/freelist"/>">
							<h3>FREE BOARD</h3>
							<p>Everyone can write</p>
						</a></li>
					<li><a href="<c:url value="/request"/>">
							<h3>Send Request</h3>
							<p>About the site or everything else.</p>
						</a></li>
				</ul>
			</section>

			<!-- Actions -->
			<section>
				<c:if test="${sessionScope.id==null}">
					<ul class="actions stacked">
						<li><a href="<c:url value="/member/login"/>" class="button large fit">Log In</a></li>
						<li><a href="<c:url value="/member/signup"/>" class="button large fit">Sign Up</a></li>
					</ul>
				</c:if>
				<c:if test="${sessionScope.id!=null}">
					<ul class="actions stacked">
						<li><a href="<c:url value="/member/profile"/>" class="button large fit">Profile</a></li>
						<li><a href="<c:url value="/member/logout"/>" class="button large fit">Log Out</a></li>
					</ul>
				</c:if>
			</section>

		</section>


		<div style="position: relative; float: left;">
			<!-- Post -->
			<article class="post" style="position: relative; width: 45%; display: inline-block; margin-bottom: 0px; padding-bottom: 48px;">
				<header>
					<div class="title">
						<h2>
							<a href=""> My profile </a>
							<img id="contextBT" style="width: 4%; min-width: 18px;" src="<c:url value="/resources/images/down.png"/>" onclick="contexting()">
						</h2>
						<p id="context"></p>
					</div>

				</header>

				<footer>
					<a href="" class="author">
						<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
					</a>
					<span class="name" style="margin-left: 30px;">Since</span>
					<h2 style="margin-bottom: 0; margin-left: 20px;">${requestScope.member.inputdate }</h2>

				</footer>
				<footer style="margin-top: 40px;">
					<span class="name" style="margin-left: 68px;">My ID</span>
					<h2 style="margin-bottom: 0; margin-left: 20px;">${requestScope.member.id }</h2>
				</footer>
				<footer style="margin-top: 40px;">
					<span class="name" style="margin-left: 68px;">Name</span>
					<h2 style="margin-bottom: 0; margin-left: 20px;">${requestScope.member.name }</h2>
				</footer>
				<footer style="margin-top: 40px;">
					<span class="name" style="margin-left: 68px;">Nickname</span>
					<h2 style="margin-bottom: 0; margin-left: 20px;" id="nicknameVar">${requestScope.member.nickname }</h2>
					<input type="button" class="button small" style="margin-left: 20px;" value="Change" id="changeNicknameBT" onclick="changeNickname()"> <input type="button" class="disnon button small" style="margin-left: 20px;" value="Redo" id="nicknameRedoBT" onclick="redoNickname()">
				</footer>
				<div id="changeNicknameDiv" class="disnon" style="margin-top: 20px; margin-left: 33px;">
					<input type="text" style="margin-left: 20px; max-width: 60%; display: inline-block;" id="changingNickname" value="${requestScope.member.nickname }"> <input type="button" class="button small" style="margin-left: 20px;" value="Done" id="nicknameDoneBT" onclick="nicknameDone()">
				</div>
				<footer style="margin-top: 40px;">
					<span class="name" style="margin-left: 68px;">E-mail</span>
					<p style="margin-bottom: 0; margin-left: 20px;" id="emailVar">${requestScope.member.email }</p>
					<input type="button" class="button small" style="margin-left: 20px;" value="Change" id="changeEmailBT" onclick="changeEmail()"> <input type="button" class="disnon button small" style="margin-left: 20px;" value="Redo" id="emailRedoBT" onclick="redoEmail()">
				</footer>
				<div id="changeEmailDiv" class="disnon" style="margin-top: 20px; margin-left: 33px;">
					<input type="text" style="margin-left: 20px; max-width: 60%; display: inline-block;" id="changingEmail" value="${requestScope.member.email }"> <input type="button" class="button small" style="margin-left: 20px;" value="Done" id="emailDoneBT" onclick="emailDone()">
				</div>
				<footer style="margin-top: 40px;">
					<a href="<c:url value="/member/changepw"/>" class="button">Change My Password</a>

					<a href="<c:url value="/member/deleteac"/>" class="button" style="margin-left: 10px;">Delete My Account</a>
				</footer>
			</article>
			<!-- Post -->
			<article class="post" style="position: relative; float: right; width: 45%; padding-bottom: 48px;">
				<header>
					<div class="title">
						<h2 style="margin-bottom: 24px;">
							<a href="">Lately Activity</a>
							<img id="contextBT2" style="width: 4%; min-width: 18px;" src="<c:url value="/resources/images/down.png"/>" onclick="contexting2()">
						</h2>
						<p id="context2"></p>
					</div>
				</header>
				<footer style="margin-top: 40px;">
					<span class="name" style="margin-left: 68px;">NoticeBoard Posts</span>
					<h2 style="margin-bottom: 0; margin-left: 20px;" id="mynotice"></h2>
					<input type="button" class=" button small" style="margin-left: 20px;" value="Go" onclick="go_mynotice(this)" />
				</footer>
				<footer style="margin-top: 40px;">
					<span class="name" style="margin-left: 68px;">FreeBoard Posts</span>
					<h2 style="margin-bottom: 0; margin-left: 20px;" id="myfree"></h2>
					<input type="button" class=" button small" style="margin-left: 20px;" value="Go" onclick="go_myfree(this)" />
				</footer>
				<footer style="margin-top: 40px;">
					<span class="name" style="margin-left: 68px;">NoticeBoard Comments</span>
					<h2 style="margin-bottom: 0; margin-left: 20px;" id="noticereply"></h2>
					<input type="button" class=" button small" style="margin-left: 20px;" value="Go" onclick="go_noticereply(this)" />
				</footer>
				<footer style="margin-top: 40px;">
					<span class="name" style="margin-left: 68px;">FreeBoard Posts</span>
					<h2 style="margin-bottom: 0; margin-left: 20px;" id="freereply"></h2>
					<input type="button" class=" button small" style="margin-left: 20px;" value="Go" onclick="go_freereply(this)" />
				</footer>
				<footer style="margin-top: 40px;">
					<span class="name" style="margin-left: 68px;">NoticeBoard Hearts</span>
					<h2 style="margin-bottom: 0; margin-left: 20px;" id="heartnotice"></h2>
					<input type="button" class=" button small" style="margin-left: 20px;" value="Go">
				</footer>
				<footer style="margin-top: 40px;">
					<span class="name" style="margin-left: 68px;">FreeBoard Hearts</span>
					<h2 style="margin-bottom: 0; margin-left: 20px;" id="heartfree"></h2>
					<input type="button" class=" button small" style="margin-left: 20px;" value="Go">
				</footer>


			</article>
		</div>
	</div>
	<script type="text/javascript">
	$('#mynotice').html(${requestScope.mynotice}.length);
	$('#myfree').html(${requestScope.myfree}.length);
	$('#noticereply').html(${requestScope.noticereply}.length);
	$('#freereply').html(${requestScope.freereply}.length);
	$('#heartnotice').html(${requestScope.heartnotice}.length);
	$('#heartfree').html(${requestScope.heartfree}.length);
	
	function changeNickname (){
	    $('#changeNicknameBT').hide();
	    $('#nicknameRedoBT').show();
	    $('#changeNicknameDiv').slideDown();
	}
	function redoNickname(){
	    $('#nicknameRedoBT').hide();
	    $('#changeNicknameBT').show();
	    $('#changeNicknameDiv').slideUp();
	}
	function nicknameDone(){
	   var nickname = document.getElementById('changingNickname');
	    
	    $.ajax({
	       url : 'changeNickname',
	       data : {
	           id : ${sessionScope.id},
	           nickname : nickname.value},
	       type : 'get',
	       success : function(){
	           $('#nicknameVar').html(nickname.value);
	           redoNickname();
	       }
	        
	    })
	}
	
	function changeEmail (){
	    $('#changeEmailBT').hide();
	    $('#emailRedoBT').show();
	    $('#changeEmailDiv').slideDown();
	}
	function redoEmail(){
	    $('#emailRedoBT').hide();
	    $('#changeEmailBT').show();
	    $('#changeEmailDiv').slideUp();
	}
	function emailDone(){
	   var email = document.getElementById('changingEmail');
	    
	    $.ajax({
	       url : 'changeEmail',
	       data : {
	           id : ${sessionScope.id},
	           email : email.value},
	       type : 'get',
	       success : function(){
	           $('#emailVar').html(email.value);
	           redoEmail();
	       }
	    })
	}
	
	
        function contexting () {
            $('#context')
                    .html('비밀번호를 변경하거나 개인정보를 변경할 수 있습니다. 주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요.');
            $('#contextBT')
                    .attr('src', '<c:url value="/resources/images/up.png"/>')
                    .attr('onclick', 'contexted()');
        }
        function contexted () {
            $('#context').html('');
            $('#contextBT')
                    .attr('src', '<c:url value="/resources/images/down.png"/>')
                    .attr('onclick', 'contexting()');
        }

        function contexting2 () {
            $('#context2')
                    .html('당신의 최근 3개월간의 활동기록을 볼 수 있습니다. 주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요.');
            $('#contextBT2')
                    .attr('src', '<c:url value="/resources/images/up.png"/>')
                    .attr('onclick', 'contexted2()');
        }
        function contexted2 () {
            $('#context2').html('');
            $('#contextBT2')
                    .attr('src', '<c:url value="/resources/images/down.png"/>')
                    .attr('onclick', 'contexting2()');
        }
        function go_mynotice(e){
			location.href = 'go-mynotice?searchText=${sessionScope.id}';
            
        }
        function go_myfree(e){
            location.href = 'go-myfree?searchText=${sessionScope.id}';
        }
        
        function go_noticereply(e){
            location.href = 'go-noticereply?searchText=${sessionScope.id}';
        }
     	function go_freereply(e){
     	   location.href = 'go-freereply?searchText=${sessionScope.id}';
     	}
    </script>

	<!-- Scripts -->

	<script src="<c:url value="/resources/assets/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/browser.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/breakpoints.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/util.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/main.js"/>"></script>
</body>

</html>