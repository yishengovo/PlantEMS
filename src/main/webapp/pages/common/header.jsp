<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/4/20
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--动态获取base值--%>
<%
    String baseHref = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + request.getContextPath() + "/";
    pageContext.setAttribute("baseHref", baseHref);

%>


<base href="<%=baseHref%>">


<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/page.css">

<!-- Animate.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/icomoon.css">
<!-- Bootstrap -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/magnific-popup.css">

<!-- Owl Carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/owl.theme.default.min.css">

<!-- Flexslider -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/flexslider.css">

<!-- Pricing -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/pricing.css">

<!-- Theme style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">

<!-- Modernizr JS -->
<script src="${pageContext.request.contextPath}/static/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<script src="${pageContext.request.contextPath}/static/js/respond.min.js"></script>
<![endif]-->
<!-- Styleswitcher ( This style is for demo purposes only, you may delete this anytime. ) -->
<link rel="stylesheet" id="theme-switch" href="${pageContext.request.contextPath}/static/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/color-preset-option.css">
<!-- End demo purposes only -->


<!-- jQuery -->
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="${pageContext.request.contextPath}/static/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="${pageContext.request.contextPath}/static/js/jquery.waypoints.min.js"></script>
<!-- Validate -->
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<!-- Stellar Parallax -->
<script src="${pageContext.request.contextPath}/static/js/jquery.stellar.min.js"></script>
<!-- Carousel -->
<script src="${pageContext.request.contextPath}/static/js/owl.carousel.min.js"></script>
<!-- Flexslider -->
<script src="${pageContext.request.contextPath}/static/js/jquery.flexslider-min.js"></script>
<!-- countTo -->
<script src="${pageContext.request.contextPath}/static/js/jquery.countTo.js"></script>
<!-- Magnific Popup -->
<script src="${pageContext.request.contextPath}/static/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/magnific-popup-options.js"></script>
<!-- Sticky Kit -->
<script src="${pageContext.request.contextPath}/static/js/sticky-kit.min.js"></script>
<!-- Main -->
<script src="${pageContext.request.contextPath}/static/js/main.js"></script>

<script src="${pageContext.request.contextPath}/static/js/echarts.min.js"></script>

<%--<script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>--%>

<script src="${pageContext.request.contextPath}/static/js/jquery.style.switcher.min.js"></script>
