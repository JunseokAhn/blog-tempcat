<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<c:url value="" />
<html>
<head>
<title>TempCat</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css"/>" />
</head>
<body class="single is-preload">

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


		<!-- Post -->
		<form id="sendpost" action="noticewrite" method="post">
			<article class="post">

				<header>
					<div class="title">
						<h2 class="col-6 col-12-xsmall">
							<p style="margin-bottom: 0px;">writing</p>
							<input type="text" name="title" id="title" placeholder="Title" />
						</h2>
					</div>
					<div class="meta">
						<time class="published" datetime="2015-11-01">November 1, 2015</time>
						<a href="#" class="author">
							<span class="name">${sessionScope.nickname}</span>
							<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
						</a>
					</div>
				</header>
				<div class="col-12">
					<textarea name="contents" id="contents" onkeydown="resize(this)" onkeyup="resize(this)" style="min-height: 300px; resize: none;"></textarea>
				</div>
				<!-- 
				<footer>
					<ul class="stats">
						<li><a href="#">General</a></li>
						<li><a href="#" class="icon solid fa-heart">28</a></li>
						<li><a href="#" class="icon solid fa-comment">128</a></li>
					</ul>
				</footer> -->
				<div class="col-12">
					<ul class="actions">
						<li><input type="button" value="Send Post" onclick="sendpost()" /></li>
						<li><input type="reset" value="Reset" onclick="reset()" /></li>
						<!-- 
						<li><a href="#" class="button icon solid fa-download">Icon</a></li>
						<li><a href="#" class="button icon solid fa-upload">Icon</a></li>
						<li><a href="#" class="button icon solid fa-save">Icon</a></li> -->
					</ul>

				</div>

			</article>
		</form>
		<!-- Footer -->
		<section id="footer">
			<ul class="icons">
				<li><a href="https://twitter.com/?lang=ko" class="icon brands fa-twitter">
						<span class="label">Twitter</span>
					</a></li>
				<li><a href="https://www.facebook.com/" class="icon brands fa-facebook-f">
						<span class="label">Facebook</span>
					</a></li>
				<li><a href="https://www.instagram.com/?hl=ko" class="icon brands fa-instagram">
						<span class="label">Instagram</span>
					</a></li>
				<li><a href="<c:url value="/request"/>" class="icon solid fa-envelope">
						<span class="label">Email</span>
					</a></li>
			</ul>

		</section>
	</div>


	<script type="text/javascript">
        var title = document.getElementById('title');
        var contents = document.getElementById('contents');
        
        function resize (obj) {
            obj.style.height = "1px";
            obj.style.height = ( 12 + obj.scrollHeight ) + "px";
        }
        function sendpost () {
            
            if(title.value.length < 1){
                alert('제목을 입력하세요')
                return false;
            }
            if(title.value.length > 30){
                alert('제목의 최대길이는 30자입니다')
                return false;
            }
            if(contents.value.length < 1){
                alert('내용을 입력해주세요')
                return false;
            }
            if(contents.value.length > 600){
                alert('본문은 최대 600자를 넘지 못합니다.');
                return false;
            }
            $('#sendpost').submit();
        }
        function reset () {
            title.value = '';
            contents.value = '';
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