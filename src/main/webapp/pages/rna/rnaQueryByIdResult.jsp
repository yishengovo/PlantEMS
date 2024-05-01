<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>PlantEMS-RNA Query Result</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Plant Epigenetic Modification Sites database"/>
    <meta name="keywords" content="Plant Epigenetic Modification Sites database"/>
    <meta name="author" content="lin-group"/>


    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,700" rel="stylesheet">

    <%@include file="/pages/common/header.jsp" %>

    <script type="text/javascript">
        $(function () {
            /*$("#resultFieldFilter").change(function () {
                $('tr').find('th:eq(0)').hide();
                $('tr').find('td:eq(0)').hide();
            });*/

            $("input:checkbox[name='filter']").click(function () {

                $("input:checkbox[name='filter']").each(function () {
                    var tempIndex = $(this).val();
                    if ($(this).is(":checked")) {
                        $('tr').find('th:eq(' + tempIndex + ')').show();
                        $('tr').find('td:eq(' + tempIndex + ')').show();
                    } else {
                        $('tr').find('th:eq(' + tempIndex + ')').hide();
                        $('tr').find('td:eq(' + tempIndex + ')').hide();
                    }

                });


            });


        });


    </script>

    <style type="text/css">

        .color {
            color: green
        }

        .text1-nav {
            text-align: left;

            /*    	margin-left: 36px;*/
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

        .text1-nav input {
            font-size: 18px;
        }

        .browse_buttom {
            margin: 0px;
            display: block;
            width: 187px;
            background: #eeeeee;
            text-align: center;
            margin-top: -48px;
            border-radius: 4px;
            color: black;
            border-color: #ffffff;
        }

        .browse_buttom:hover {
            background: #5cb85c;
            color: #ffffff;
        }

        table.imagetable1 {
            font-size: 15px;
            color: #333333;
            border-width: 1px;
            border-color: #ffffff;
            border-collapse: collapse;
            width: 100%;

        }

        table.imagetable1 th {
            background: #5cb85cc2;
            border-width: 1px;
            /*        padding: 2px;*/
            border-style: solid;
            border-color: green;
            text-align: center;
            /*        width: 10%;*/
        }

        table.imagetable1 td {
            background: #f5f5f5;
            border-width: 1px;
            /*        padding: 2px;*/
            border-style: solid;
            border-color: green;
            text-align: center;
            word-break: break-all;
            /*        width: 30px;*/
            /*		text-align:justify;*/
            font-size: 15px;
        }

        .atype {
            color: red;
            text-decoration: underline;
        }

    </style>
</head>
<body>
<!--
	<div class="fh5co-loader"></div> -->

<div id="page">
    <!--     <div id="line" style = "width: 1170px; height: 5px; background: #33cccc;margin: 0 auto;"></div> -->
    <%@include file="/pages/common/navigator_search.jsp" %>
    <span style='color: red'></span>

    <div id="fh5co-testimonial" class="fh5co-bg-section" style="width: 100%; margin: 0 auto; padding: 105px 0 16px 0;">
        <!-- 		<div class="container" > -->

        <div class="row" align="center" style="margin-top:-89px;text-align:center;">
            <div class="col-md-4 animate-box" style="width: 18%;font-size: 15px; padding:0 2px 0 50px">
                <div class="testimony text-center" align="center" style="font-family: verdana,arial,sans-serif;">
                    <!-- 						<div class="selectionType" style="width:352px;margin-left:120px;"> -->
                    <fieldset align="center">
                        <legend style="font-size: 20px; text-align: left;margin-bottom: -12px;"><h4
                                style="display:block; font-weight: bold;color: green ">Display columns:</h4></legend>
                        <br>
                        <div class="text1-nav">
                            <input type="checkbox" name="filter" value="0" checked="checked">Id</input><br>
                            <input type="checkbox" name="filter" value="1" checked="checked">Species</input><br>
                            <input type="checkbox" name="filter" value="2" checked="checked">View</input><br>
                            <input type="checkbox" name="filter" value="3" checked="checked">Chromosome</input><br>
                            <input type="checkbox" name="filter" value="4" checked="checked">Position</input><br>
                            <input type="checkbox" name="filter" value="5" checked="checked">Type</input><br>
                            <input type="checkbox" name="filter" value="6" checked="checked">Gene</input><br>
                            <input type="checkbox" name="filter" value="7" checked="checked">Feature</input><br>
                            <input type="checkbox" name="filter" value="8" checked="checked">Strand</input><br>
                            <input type="checkbox" name="filter" value="9" checked="checked">Context</input><br>
                        </div>
                    </fieldset>

                </div>
            </div>

            <div class="col-md-4 animate-box" style="width: 80%; padding-left: 0px">
                <div class="testimony text-center">
                    <h3 style="display:block; font-weight: bold;color: #333;text-align: left; ">RNA Query Result</h3>

                        <h4 style="display:block; font-weight: bold;color: green;text-align:left "><a name='Overview1'
                                                                                                      class="color">Your
                            query is: <a class="atype" style="font-style: italic;">${para.id}</a> (id)</a>
                        </h4>

                    <%--                    <h4 style="display:block; font-weight: bold;color: green;text-align:left "><a  name = 'Overview1'  class="color">Your query is: <a class="atype">tRNA</a> (type) AND <a class="atype">i6A|t6A</a> (modification) AND <a class="atype">Amborella trichopoda</a> (species)</a></h4>--%>

                    <table border="1" cellpadding="0" align="center" class="imagetable1">
                        <thead>
                        <th>Id</th>
                        <th>Species</th>
                        <th>View</th>
                        <th>Chromosome</th>
                        <th>Position</th>
                        <th>Type</th>
                        <th>Gene</th>
                        <th>Feature</th>
                        <th>Strand</th>
                        <th>Context</th>
                        </thead>
                        <tbody>
                        <c:if test="${rna != null}">
                            <tr>
                                <td>${rna.id}</td>
                                <td style="font-style: italic">${rna.species}</td>
                                <c:if test="${rna.view!='NA'}">
                                    <td><a href="${rna.view}">view</a></td>
                                </c:if>
                                <c:if test="${rna.view=='NA'}">
                                    <td>NA</td>
                                </c:if>
                                <td>${rna.chromosome}</td>
                                <td>${rna.position}</td>
                                <td>${rna.type}</td>
                                <td>${rna.gene}</td>
                                <c:if test="${rna.feature=='NA'}">
                                    <td>Intergenic</td>
                                </c:if>
                                <c:if test="${rna.feature!='NA'}">
                                    <td>${rna.feature}</td>
                                </c:if>
                                <td>${rna.strand}</td>
                                <td>${rna.context}</td>
                            </tr>
                        </c:if>
                        <c:if test="${rna == null}">
                            <h3 style="display:block; font-weight: bold;color: red;text-align: left; ">
                                No data found for this id!</h3>
                        </c:if>

                        </tbody>
                    </table>
                    <div>
                        <br/>
                        <div><input id="returnBut" type="button" value="Return Search Page"></div>
                    </div>

                    <%--                    <input id="returnBut" type="button" value="Return Query Page" style="text-align: center;">--%>
                    <script type="text/javascript">
                        $("#returnBut").click(function () {
                            location.href = "${pageScope.baseHref}" + "rna/getAllSpeciesAndTypeAndChromosome";
                        });
                    </script>

                    <!-- <span class="user" >&mdash; <a href="more.html" style="color:#0f6c27;">More</a></span> -->
                </div>
            </div>


        </div>
        <!-- 		</div> -->
    </div>


    <footer id="fh5co-footer" role="contentinfo" style="width: 100%; margin: 0 auto;padding: 10px">
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
