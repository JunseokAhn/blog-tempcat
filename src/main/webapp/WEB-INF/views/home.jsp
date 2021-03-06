<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>TempCat</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css"/>" />
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

		<!-- Main -->
		<div id="main">

			<!-- Post -->
			<c:forEach var="i" items="${noticeList }">
				<article class="post">
					<header>
						<div class="title">
							<h2>
								<a href="<c:url value="notice/noticeread?noticenum=${i.noticenum }" />">${i.title}</a>
							</h2>
							<p>Multipurpose responsive site created by アンジュンソク</p>
						</div>
						<div class="meta">
							<time class="published" datetime="2015-11-01">${i.inputdate }</time>
							<a href="#" class="author">
								<span class="name">${i.nickname }</span> <img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
							</a>
						</div>
					</header>
					<a href="" class="image featured">
						<c:if test="${i.savedfile!=null}">
							<img src="<c:url value="/img/${i.savedfile }"/>" alt="" />
						</c:if>
						<c:if test="${i.savedfile==null}">
							<img src="<c:url value="/resources/images/pic01.jpg"/>" alt="" />
						</c:if>
					</a>
					<p>${i.contents }</p>
					<footer>
						<ul class="actions">
							<li><a href="
						<c:url value="notice/noticeread?noticenum=${i.noticenum }" />" class="button large">Continue Reading</a></li>
						</ul>
						<ul class="stats">
							<li><a href="#">General</a></li>
							<li><a href="#" class="icon solid fa-heart">${i.heart }</a></li>
							<li><a href="#" class="icon solid fa-comment">${i.comments }</a></li>
						</ul>
					</footer>
				</article>
			</c:forEach>
			<c:if test="${noticeList[0].noticenum==null }">
				<c:forEach var="i" begin="0" end="2">
					<article class="post">
						<header>
							<div class="title">
								<h2>
									<a href="<c:url value="notice/noticeread?noticenum=" />">Default Data</a>
								</h2>
								<p>Multipurpose responsive site created by アンジュンソク</p>
							</div>
							<div class="meta">
								<time class="published" datetime="2015-11-01">Default Data</time>
								<a href="#" class="author">
									<span class="name">Default Data</span> <img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
								</a>
							</div>
						</header>
						<a href="" class="image featured">
							<img src="<c:url value="/resources/images/pic01.jpg"/>" alt="" />
						</a>
						<p>Default Data</p>
						<footer>
							<ul class="actions">
								<li><a href="
						<c:url value="notice/noticeread?noticenum=" />" class="button large">Continue Reading</a></li>
							</ul>
							<ul class="stats">
								<li><a href="#">General</a></li>
								<li><a href="#" class="icon solid fa-heart">0</a></li>
								<li><a href="#" class="icon solid fa-comment">0</a></li>
							</ul>
						</footer>
					</article>
				</c:forEach>
			</c:if>
			<!-- Post -->

		</div>

		<!-- Sidebar -->
		<section id="sidebar">

			<!-- Intro -->
			<section id="intro">
				<a href="<c:url value="/"/>" class="logo">
					<img src="<c:url value="/resources/images/logo.jpg"/>" alt="" />
				</a>
				<header>
					<h2>Welcome to Tempcat</h2>
					<p>
						Multipurpose responsive site created by
						<a href="https://github.com/JunseokAhn">アンジュンソク</a>
					</p>
				</header>
			</section>
			<!-- Mini Posts -->
			<section>
				<div class="mini-posts">

					<!-- Mini Post -->
					<c:forEach var="i" items="${requestScope.freeList }">
						<article class="mini-post">
							<header>
								<h3>
									<a href="<c:url value="/free/freeread?freenum=${i.freenum }"/>">${i.title }</a>
								</h3>
								<time class="published" datetime="2015-10-20">${i.inputdate }</time>
								<a href="" class="author">
									<span class="name">${i.nickname }</span> <img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
								</a>
							</header>
							<a href="<c:url value="/free/freeread?freenum=${i.freenum }"/>" class="image">
								<c:if test="${i.savedfile==null }">
									<img src="<c:url value="/resources/images/pic04.jpg"/>" alt="" />
								</c:if>
								<c:if test="${i.savedfile!=null }">
									<img src="<c:url value="/img/${i.savedfile }"/>" alt="" />
								</c:if>
							</a>
						</article>
					</c:forEach>
					<c:if test="${requestScope.freeList[0].freenum==null }">
						<c:forEach var="i" begin="0" end="2">
							<article class="mini-post">
								<header>
									<h3>
										<a href="<c:url value="/free/freeread?freenum="/>">Default Data</a>
									</h3>
									<time class="published" datetime="2015-10-20">Default Data</time>
									<a href="" class="author">
										<span class="name">Default Data</span> <img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
									</a>
								</header>
								<a href="<c:url value="/free/freeread?freenum="/>" class="image">
									<img src="<c:url value="/resources/images/pic04.jpg"/>" alt="" />
								</a>
							</article>
						</c:forEach>
					</c:if>
				</div>
			</section>

			<!-- About -->
			<section class="blurb">
				<h2>About</h2>
				<p>私は Korea International Trade Academy SMART Cloud SC IT MASTERの 38期 所属の教育生です. このサイトは外部のフリーウェアデザインテンプレートを借りて作りました。 どうぞよろしくお願いします。</p>
				<ul class="actions">
					<li><a href="<c:url value="/intro"/>" class="button">Learn More</a></li>
				</ul>
			</section>

			<!-- Footer -->
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


		</section>

	</div>

	<!-- Scripts -->
	<script src="<c:url value="/resources/assets/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/browser.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/breakpoints.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/util.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/main.js"/>"></script>

</body>
</html>