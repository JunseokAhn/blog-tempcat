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
				<a href="index.html">Future Imperfect</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="#">Lorem</a></li>
					<li><a href="#">Ipsum</a></li>
					<li><a href="#">Feugiat</a></li>
					<li><a href="#">Tempus</a></li>
					<li><a href="#">Adipiscing</a></li>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search"><a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="#">
							<input type="text" name="query" placeholder="Search" />
						</form></li>
					<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<section id="menu">

			<!-- Search -->
			<section>
				<form class="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form>
			</section>

			<!-- Links -->
			<section>
				<ul class="links">
					<li><a href="#">
							<h3>Lorem ipsum</h3>
							<p>Feugiat tempus veroeros dolor</p>
						</a></li>
					<li><a href="#">
							<h3>Dolor sit amet</h3>
							<p>Sed vitae justo condimentum</p>
						</a></li>
					<li><a href="#">
							<h3>Feugiat veroeros</h3>
							<p>Phasellus sed ultricies mi congue</p>
						</a></li>
					<li><a href="#">
							<h3>Etiam sed consequat</h3>
							<p>Porta lectus amet ultricies</p>
						</a></li>
				</ul>
			</section>

			<!-- Actions -->
			<section>
				<ul class="actions stacked">
					<li><a href="#" class="button large fit">Log In</a></li>
				</ul>
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
				<footer>
					<ul class="stats">
						<li><a href="#">General</a></li>
						<li><a href="#" class="icon solid fa-heart">28</a></li>
						<li><a href="#" class="icon solid fa-comment">128</a></li>
					</ul>
				</footer>
				<div class="col-12">
					<ul class="actions">
						<li><input type="button" value="Send Post" onclick="sendpost()" /></li>
						<li><input type="reset" value="Reset" onclick="reset()" /></li>
						<li><a href="#" class="button icon solid fa-download">Icon</a></li>
						<li><a href="#" class="button icon solid fa-upload">Icon</a></li>
						<li><a href="#" class="button icon solid fa-save">Icon</a></li>
					</ul>

				</div>

			</article>
		</form>
	</div>

	<!-- Footer -->
	<section id="footer">
		<ul class="icons">
			<li><a href="#" class="icon brands fa-twitter">
					<span class="label">Twitter</span>
				</a></li>
			<li><a href="#" class="icon brands fa-facebook-f">
					<span class="label">Facebook</span>
				</a></li>
			<li><a href="#" class="icon brands fa-instagram">
					<span class="label">Instagram</span>
				</a></li>
			<li><a href="#" class="icon solid fa-rss">
					<span class="label">RSS</span>
				</a></li>
			<li><a href="#" class="icon solid fa-envelope">
					<span class="label">Email</span>
				</a></li>
		</ul>
		<p class="copyright">
			&copy; Untitled. Design:
			<a href="http://html5up.net">HTML5 UP</a>
			. Images:
			<a href="http://unsplash.com">Unsplash</a>
			.
		</p>
	</section>
	<script type="text/javascript">
        var title = document.getElementById('title');
        var contents = document.getElementById('contents');
        
        function resize (obj) {
            obj.style.height = "1px";
            obj.style.height = ( 12 + obj.scrollHeight ) + "px";
        }
        function sendpost () {
            
            //제목x 혹은 20자이상, 컨텐츠2000자이상 혹은 내용x
            if(title.value < 1){
                alert('제목을 입력하세요')
                return false;
            }
            if(title.value > 20){
                alert('제목의 최대길이는 20자입니다')
                return false;
            }
            if(contents.value < 1){
                alert('내용을 입력해주세요')
                return false;
            }
            if(contents.value > 2000){
                alert('본문은 최대 2000자를 넘지 못합니다.');
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