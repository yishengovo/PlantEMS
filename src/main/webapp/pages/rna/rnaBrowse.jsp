<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/5
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>PlantEMS-RNA browse</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Plant Epigenetic Modification Sites database"/>
    <meta name="keywords" content="Plant Epigenetic Modification Sites database"/>
    <meta name="author" content="lin-group"/>


    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,700" rel="stylesheet">

    <%@include file="/pages/common/header.jsp" %>
    <!-- End demo purposes only -->
    <script type="text/javascript">
        $(function () {
            $("#smselect").change(function () {
                var value = $("#smselect option:selected").val();
                if (value === "Brassica rapa ssp chinensis") {
                    var temp = $("#mdselect").empty();
                    temp.append("<option value=''>Choose</option>");
                    temp.append("<option value='m6A'>m6A</option>");
                } else if (value !== "") {
                    $.getJSON("${pageContext.getAttribute("baseHref")}rna/ajaxGetTypeBySpecies", "species=" + value, function (data) {
                        // alert(data[0]);
                        var temp = $("#mdselect").empty();
                        temp.append("<option value=''>Choose</option>");
                        for (var typeIndex in data) {
                            if (data.hasOwnProperty(typeIndex)) {
                                if (data[typeIndex] != null) {
                                    temp.append("<option value='" + data[typeIndex] + "'>" + data[typeIndex] + "</option>");
                                }
                            }
                        }
                        if (value === "Arabidopsis thaliana") {
                            temp.append("<option value='m5C'>m5C</option>");
                        }
                    });
                }
            });

            $("#browseButton").click(function () {
                var species = $("#smselect").val();
                var type = $("#mdselect").val();
                if (species === "" || type === "") {
                    alert("Please choose the correct species and type!");
                    return false;
                } else {
                    $.getJSON("${pageContext.getAttribute("baseHref")}rna/ajaxGetStatisticInformation", "species=" + species + "&type=" + encodeURIComponent(type), function (data) {
                        var figure1NameList = data.figure1NameList;
                        var figure1ValueList = data.figure1ValueList;
                        var figure2NameList = data.figure2NameList;
                        var figure2ValueList = data.figure2ValueList;
                        var overviewInfo = data.overviewInfo;
                        $("#td1").html(overviewInfo.species);
                        $("#td2").html(overviewInfo.instrument);
                        $("#td3").html(overviewInfo.accessionNumber);
                        $("#td4").html('<a href="' + overviewInfo.pmidLink + '">' + overviewInfo.pmid + '</a>');
                        //将figure2的数据转变成所需要的格式
                        var figure2 = [];
                        for (var index in figure2NameList) {
                            figure2.push({
                                name: figure2NameList[index],
                                value: figure2ValueList[index]
                            });
                        }

                        // alert(figure1NameList);
                        // alert(figure1ValueList);
                        // alert(figure2NameList);
                        // alert(figure2ValueList);

                        $("#f1Title").html("<a id='density1' style='color: #ff8000'>" + type + "</a> density in <a id='density2' style='color: #ff8000;font-style: italic;'>" + species + "</a> chromosome :");
                        myChart1.setOption({
                            xAxis: {
                                data: figure1NameList
                            },
                            yAxis: {},
                            series: [{
                                name: 'density',
                                type: 'bar',
                                data: figure1ValueList
                            }]
                        });
                        $("#f2Title").html("<a id = 'feature1' style='color: #ff8000'>" + type + "</a> number in <a id='feature2' style='color: #ff8000;font-style: italic;'>" + species + "</a> genomic feature :");
                        myChart2.setOption({
                            series: [
                                {
                                    // name: '访问来源',
                                    type: 'pie',
                                    radius: '50%',
                                    data: figure2,
                                    emphasis: {
                                        itemStyle: {
                                            shadowBlur: 10,
                                            shadowOffsetX: 0,
                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                        }
                                    }
                                }
                            ]
                        });
                    });

                }
            });
        });
    </script>

    <style type="text/css">
        table.imagetable {
            font-family: verdana, arial, sans-serif;
            font-size: 20px;
            color: #333333;
            border-width: 1px;
            border-color: #999999;
            border-collapse: collapse;
            width: 700px;

        }

        table.imagetable th {
            background: #eeeeee;
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #ffffff;
            text-align: center;
        }

        table.imagetable td {
            background: #eeeeee;
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #ffffff;
            text-align: center;
        }

        .selec {
            width: 150px;
        }

        .color {
            color: green;
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
    </style>
</head>
<body>
<!--
	<div class="fh5co-loader"></div> -->

<div id="page">
    <!--     <div id="line" style = "width: 1170px; height: 5px; background: #33cccc;margin: 0 auto;"></div> -->
    <%@include file="/pages/common/navigator_browse.jsp" %>


    <div id="fh5co-testimonial" class="fh5co-bg-section"
         style="width: 1170px; margin: 0 auto; padding: 105px 0 16px 0;">
        <div class="container">

            <div class="row" style="margin-top:-89px">

                <div class="col-md-4 animate-box" style="width: 345px;font-size: 20px;">
                    <div class="testimony text-center" style="font-family: verdana,arial,sans-serif;">
                        <!-- 						<div class="selectionType" style="width:352px;margin-left:120px;"> -->
                        <fieldset align="center">
                            <legend style="font-size: 20px; text-align: center;margin-bottom: -12px;"><h4
                                    style="display:block; font-weight: bold;color: green ">Choose species and type</h4>
                            </legend>
                            <br>
                            <span style="padding:0px;margin:10px 0px;color: black;">species:</span>
                            <select class="selec" name="species" id="smselect" style="padding:0px;margin:10px 0px;">
                                <option value="">Choose</option>
                                <c:forEach items="${stc.species}" var="species">
                                    <option value="${species}">${species}</option>
                                </c:forEach>
                                <option value="Brassica rapa ssp chinensis">Brassica rapa ssp chinensis</option>
                            </select>
                            <br>
                            <span style="padding:0px;margin:10px 0px;color: black;">type:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            <select class="selec" name="modification_type" id="mdselect"
                                    style="padding:0px;margin:10px 0px;">
                                <option value="">Choose</option>
                                <c:forEach items="${stc.types}" var="type">
                                    <option value="${type}">${type}</option>
                                </c:forEach>
                            </select>
                            <br><br>

                            <a id="browseButton" class="browse_buttom">Browse</a>
                        </fieldset>

                    </div>
                </div>

                <div class="col-md-4 animate-box" style="width: 820px">

                    <div class="testimony text-center">
                        <!-- <h3 style="display:block; font-weight: bold;color: green;text-align:center; "><a  name = 'Overview1'  class="color">DNA Browse </a></h3> -->
                        <!-- <span class="icon"><i class="icon-bubble3"></i></span> -->
                        <h3 style="display:block; font-weight: bold;color: green;text-align:left "><a id='Overview1'
                                                                                                      class="color">RNA
                            modification overview :</a></h3>
                        <blockquote>
                            <table border="1" class="imagetable">
                                <tr>
                                    <th>Organism</th>
                                    <th>Instrument</th>
                                    <th>Accession</th>
                                    <th>PMID</th>
                                </tr>
                                <tr>
                                    <td id="td1" style="font-size: 14px;font-style: italic;">Arabidopsis thaliana</td>
                                    <td id="td2" style="font-size: 14px;">dot-blot</td>
                                    <td id="td3" style="font-size: 14px;">GEO: GSE94065</td>
                                    <td id="td4" style="font-size: 14px;"><a
                                            href="https://pubmed.ncbi.nlm.nih.gov/28965832/">28965832</a></td>
                                </tr>
                            </table>
                            <br><br>
                            <%--将异步请求得到的结果放入数组中--%>
                            <script type="text/javascript">
                            </script>
                            <h3 style="display:block; font-weight: bold;color: green;text-align: left; " id="f1Title"><a
                                    id='density1' style='color: #ff8000'>m5C</a> density in <a id='density2'
                                                                                               style='color: #ff8000;font-style: italic;'>Arabidopsis
                                thaliana</a> chromosome :</h3>
                            <%--                            <div class="density"><img src="static/images/density.png"></div>--%>
                            <div class="density" id="figure1" style="width: 600px;height:400px;"></div>
                            <script type="text/javascript">
                                var myChart1 = echarts.init(document.getElementById('figure1'));

                                // 指定图表的配置项和数据
                                var option1 = {
                                    // title: {
                                    //     text: 'ECharts 入门示例'
                                    // },
                                    color: '#c9302c',
                                    tooltip: {},
                                    legend: {
                                        data: ['density']
                                    },
                                    xAxis: {
                                        data: ['chr1', 'chr2', 'chr3', 'chr4', 'chr5', 'chrMT']
                                    },
                                    yAxis: {},
                                    series: [{
                                        name: 'density',
                                        type: 'bar',
                                        data: [0.2625, 0.1487, 0.1919, 0.1566, 0.239, 0.0012]
                                    }]
                                };

                                myChart1.setOption(option1);
                            </script>

                            <h3 style="display:block; font-weight: bold;color: green;text-align: left; " id="f2Title"><a
                                    id='feature1' style='color: #ff8000'>m5C</a> number in <a id='feature2'
                                                                                              style='color: #ff8000;font-style: italic;'>Arabidopsis
                                thaliana</a> genomic feature :</h3>
                            <%--                            <div class="feature"><img src="static/images/feature.png"></div>--%>
                            <div class="feature" id="figure2" style="width: 600px;height:400px;"></div>
                            <script type="text/javascript">
                                var myChart2 = echarts.init(document.getElementById('figure2'));
                                var option2 = {
                                    // title: {
                                    //     text: '某站点用户访问来源',
                                    //     subtext: '纯属虚构',
                                    //     left: 'center'
                                    // },
                                    tooltip: {
                                        trigger: 'item',
                                        formatter: function (param) {
                                            return param.marker + " " + param.name + "：" + param.value
                                                + "<br>" + "&nbsp;&nbsp;&nbsp;&nbsp;"
                                                + "percent (" + param.percent + "%)";
                                        }
                                    },
                                    legend: {
                                        orient: 'vertical',
                                        left: 'left',
                                    },
                                    series: [
                                        {
                                            // name: '访问来源',
                                            type: 'pie',
                                            radius: '50%',
                                            data: [
                                                {value: 6710, name: 'exon'},
                                                {value: 90, name: 'intron'},
                                                {value: 298, name: 'utr3'},
                                                {value: 136, name: 'utr5'}
                                            ],
                                            emphasis: {
                                                itemStyle: {
                                                    shadowBlur: 10,
                                                    shadowOffsetX: 0,
                                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                }
                                            }
                                        }
                                    ]
                                };
                                myChart2.setOption(option2);
                            </script>

                            <%--                            <h3  style="display:block; font-weight: bold;color: green;text-align: left; ">Histogram of coverage of <a id='coverage'  class="color">m6A</a> sites :</h3>--%>
                            <%--&lt;%&ndash;                            <div class="density"><img src="static/images/density.png"></div>&ndash;%&gt;--%>
                            <%--                            <div class="density" id="figure3" style="width: 600px;height:400px;"></div>--%>
                            <%--                            <script type="text/javascript">--%>
                            <%--                                var myChart3 = echarts.init(document.getElementById('figure3'));--%>

                            <%--                                // 指定图表的配置项和数据--%>
                            <%--                                var option3 = {--%>
                            <%--                                    title: {--%>
                            <%--                                        text: 'ECharts 入门示例'--%>
                            <%--                                    },--%>
                            <%--                                    tooltip: {},--%>
                            <%--                                    legend: {--%>
                            <%--                                        data:['销量']--%>
                            <%--                                    },--%>
                            <%--                                    xAxis: {--%>
                            <%--                                        data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]--%>
                            <%--                                    },--%>
                            <%--                                    yAxis: {},--%>
                            <%--                                    series: [{--%>
                            <%--                                        name: '销量',--%>
                            <%--                                        type: 'bar',--%>
                            <%--                                        data: [5, 20, 36, 10, 10, 20]--%>
                            <%--                                    }]--%>
                            <%--                                };--%>

                            <%--                                myChart3.setOption(option3);--%>
                            <%--                            </script>--%>

                            <%--                            <h3  style="display:block; font-weight: bold;color: green;text-align: left; ">Histogram of score of <a id = 'score'  class="color">m6A</a> sites :</h3>--%>
                            <%--&lt;%&ndash;                            <div class="feature"><img src="static/images/feature.png"></div>&ndash;%&gt;--%>
                            <%--                            <div class="feature" id="figure4" style="width: 600px;height:400px;"></div>--%>
                            <%--                            <script type="text/javascript">--%>
                            <%--                                var myChart4 = echarts.init(document.getElementById('figure4'));--%>
                            <%--                                var option4 = {--%>
                            <%--                                    title: {--%>
                            <%--                                        text: '某站点用户访问来源',--%>
                            <%--                                        subtext: '纯属虚构',--%>
                            <%--                                        left: 'center'--%>
                            <%--                                    },--%>
                            <%--                                    tooltip: {--%>
                            <%--                                        trigger: 'item'--%>
                            <%--                                    },--%>
                            <%--                                    legend: {--%>
                            <%--                                        orient: 'vertical',--%>
                            <%--                                        left: 'left',--%>
                            <%--                                    },--%>
                            <%--                                    series: [--%>
                            <%--                                        {--%>
                            <%--                                            name: '访问来源',--%>
                            <%--                                            type: 'pie',--%>
                            <%--                                            radius: '50%',--%>
                            <%--                                            data: [--%>
                            <%--                                                {value: 1048, name: '搜索引擎'},--%>
                            <%--                                                {value: 735, name: '直接访问'},--%>
                            <%--                                                {value: 580, name: '邮件营销'},--%>
                            <%--                                                {value: 484, name: '联盟广告'},--%>
                            <%--                                                {value: 300, name: '视频广告'}--%>
                            <%--                                            ],--%>
                            <%--                                            emphasis: {--%>
                            <%--                                                itemStyle: {--%>
                            <%--                                                    shadowBlur: 10,--%>
                            <%--                                                    shadowOffsetX: 0,--%>
                            <%--                                                    shadowColor: 'rgba(0, 0, 0, 0.5)'--%>
                            <%--                                                }--%>
                            <%--                                            }--%>
                            <%--                                        }--%>
                            <%--                                    ]--%>
                            <%--                                };--%>
                            <%--                                myChart4.setOption(option4);--%>
                            <%--                            </script>--%>

                        </blockquote>
                        <!-- <span class="user" >&mdash; <a href="more.html" style="color:#0f6c27;">More</a></span> -->
                    </div>
                </div>

                <div class="col-md-4 animate-box" style="width: 345px;font-size: 20px; position: absolute;top: 520px;">
                    <div class="testimony text-center" style="font-family: verdana,arial,sans-serif;">
                        <!-- 						<div class="selectionType" style="width:352px;margin-left:120px;"> -->
                        <fieldset align="center">
                            <legend style="font-size: 20px; text-align: center;margin-bottom: -12px;"><h4
                                    style="display:block; font-weight: bold;color: green ">Information</h4></legend>
                            <br>
                            <div class="text1-nav">
                                <ul style="list-style:none;margin:0;padding:0">
                                    <li><a href="rna/getAllSpeciesAndType#Overview1">Overview</a></li>
                                    <li><a href="rna/getAllSpeciesAndType#density1">Density</a></li>
                                    <li><a href="rna/getAllSpeciesAndType#feature1">Gnomic feature</a></li>
                                    <%--                                    <li><a href="rna/getAllSpeciesAndType#coverage">Coverage</a></li>--%>
                                    <%--                                    <li><a href="rna/getAllSpeciesAndType#score">Score</a></li>--%>
                                </ul>
                            </div>
                        </fieldset>

                    </div>
                </div>
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


