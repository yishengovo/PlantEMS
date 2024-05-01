<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/24
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>PlantEMS-Overview</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Plant Epigenetic Modification Sites database"/>
    <meta name="keywords" content="Plant Epigenetic Modification Sites database"/>
    <meta name="author" content="lin-group"/>


    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,700" rel="stylesheet">

    <%@include file="/pages/common/header.jsp" %>
    <!-- End demo purposes only -->
    <style type="text/css">

        .color {
            color: green
        }

        .text1-nav {
            text-align: left;
            margin-left: 36px;
        }

        .text1-nav li a {
            color: #828282;
            width: 155px;
        }

        .text1-nav li a:hover {
            background: #5cb85c;
            display: block;
            color: #ffffff;
            text-align: center;
        }

        .browse_buttom {
            margin: 15px 0px;
            display: block;
            width: 187px;
            background: #eeeeee;
            text-align: center;
            margin-left: 43px;
            border-radius: 4px;
            color: black;
        }

        .browse_buttom:hover {
            background: #5cb85c;
            color: #ffffff;
        }

        .tripal-data-pane {
            float: left;
            border: 1px solid #CCC;
            border-radius: 8px;
            padding: 20px;
            min-height: 400px;
        }

        .tbody {
            display: table-row-group;
            vertical-align: middle;
            font-size: 18px;
        }

        tr.odd {
            background-color: #FFFFFF;
        }

        tr.even {
            background-color: #EEEEEE;
            border-top: 1px solid #CCCCCC;
            border-bottom: 1px solid #CCCCCC;
        }

        tr.odd th, tr.even th {
            background-color: inherit;
        }

        tr.odd td, tr.even td, th {
            padding: 8px 10px;
        }

        th {
            text-align: left;
            width: 380px;
        }

        td {
            width: 380px;
        }

        .odd .even {
            margin-left: 20px;
        }

        .jpg img {
            transform: scale(1.3);
            -ms-transform: scale(1.3);
            -webkit-transform: scale(1.3);
            -o-transform: scale(1.3);
            -moz-transform: scale(1.3);
            margin-right: 71px;
            margin-top: 76px;
        }

    </style>
</head>
<body>
<!--
	<div class="fh5co-loader"></div> -->

<div id="page">
    <!--     <div id="line" style = "width: 1170px; height: 5px; background: #33cccc;margin: 0 auto;"></div> -->
    <%@include file="/pages/common/navigator_home.jsp" %>


    <div id="fh5co-testimonial" class="fh5co-bg-section"
         style="width: 1170px; margin: 0 auto; padding: 105px 0 16px 0;">
        <div class="container">

            <div class="row" style="margin-top:-89px">


                <div class="col-md-4 animate-box" style="width: 1170px">

                    <div class="testimony text-center" style="padding-left: 76px;padding-bottom: 48px">
                        <h3 style="display:block; font-weight: bold;color: green;text-align:left; vertical-align: middle; ">
                            <a name='Overview1' class="color">Overview </a></h3>
                        <br>
                        <table>
                            <tbody class="tbody">
                            <tr class="even" style="border-top: 2px solid #ccc">
                                <th>Species</th>
                                <td><i>${info.species}</i></td>
                            </tr>
                            <tr class="odd">
                                <th>Genus</th>
                                <td><i>${info.genus}</i></td>
                            </tr>
                            <tr class="even">
                                <th>Common Name</th>
                                <td>${info.commonName}</td>
                            </tr>
                            <tr class="odd">
                                <th>Ploidy</th>
                                <td>${info.ploidy}</td>
                            </tr>
                            <tr class="even">
                                <th>Chromosome Number</th>
                                <td>${info.chromosomeNumber}</td>
                            </tr>
                            <tr class="odd">
                                <th>Genome Size (Mb)</th>
                                <td>${info.genomeSize}</td>
                            </tr>
                            <tr class="even">
                                <th>Protein Count</th>
                                <td>${info.proteinCount}</td>
                            </tr>
                            <tr class="odd" style="border-bottom: 2px solid #ccc">
                                <th>GC Content</th>
                                <td>${info.gcContent}</td>
                            </tr>
                            </tbody>
                            <div class="jpg" style="float: right;">
                                <img src="static/plant_figure/${info.pictureLing}">
                            </div>
                        </table>
                    </div>
                </div>
                <br>
            </div>
        </div>
    </div>


    <footer id="fh5co-footer" role="contentinfo" style="width: 1158px; margin: 0 auto;padding: 10px">
        <!-- <div class="overlay"></div> -->

        <div class="row copyright" style=" padding: 20px 0px 7px 0px;">
            <div class="col-md-12 text-center">
                <p>
                    <small class="block" style="padding:0;font-size: 113%">&copy; Copyright LinGroup(lin-group.cn) @
                        2021 All rights reserved© Copyright.</small>
                    <!-- 					<small class="block">Designed by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a> Demo Images: <a href="http://unsplash.co/" target="_blank">Unsplash</a> &amp; <a href="https://www.pexels.com/" target="_blank">Pexels</a></small> -->
                </p>
            </div>
        </div>
    </footer>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
</div>

<script>
    $(function () {
        $('#colour-variations ul').styleSwitcher({
            defaultThemeId: 'theme-switch',
            hasPreview: false,
            cookie: {
                expires: 30,
                isManagingLoad: true
            }
        });
        $('.option-toggle').click(function () {
            $('#colour-variations').toggleClass('sleep');
        });
    });
</script>
<!-- End demo purposes only -->
</body>
</html>
