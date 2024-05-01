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
    <title>PlantEMS-Protein browse</title>
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
            //用物种搜索修饰类型
            $("#smselect").change(function () {
                var value = $("#smselect option:selected").val();

                if (value !== "") {
                    $.getJSON("${pageContext.getAttribute("baseHref")}protein/ajaxGetTypeBySpecies", "species=" + value, function (data) {
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
                    $.getJSON("${pageContext.getAttribute("baseHref")}protein/ajaxGetStatisticInformation", "species=" + species + "&type=" + encodeURIComponent(type), function (data) {
                        // var figure1NameList=data.figure1NameList;
                        // var figure1ValueList=data.figure1ValueList;
                        // var figure2NameList=data.figure2NameList;
                        // var figure2ValueList=data.figure2ValueList;
                        var figure3NameList = data.figure3NameList;
                        var figure3ValueList = data.figure3ValueList;
                        var figure4NameList = data.figure4NameList;
                        var figure4ValueList = data.figure4ValueList;
                        var overviewInfo = data.overviewInfo;
                        $("#td1").html(overviewInfo.species);
                        $("#td2").html(overviewInfo.instrument);
                        $("#td3").html(overviewInfo.accessionNumber);
                        $("#td4").html('<a href="' + overviewInfo.pmidLink + '">' + overviewInfo.pmid + '</a>');

                        //将figure2的数据转变成所需要的格式
                        // var figure2=[];
                        // for (var index in figure2NameList){
                        //     figure2.push({
                        //         name: figure2NameList[index],
                        //         value: figure2ValueList[index]
                        //     });
                        // }
                        // alert(figure1NameList);
                        // alert(figure1ValueList);
                        // alert(figure2NameList);
                        // alert(figure2ValueList);
                        // alert(figure3NameList);
                        // alert(figure3ValueList);
                        // alert(figure4NameList);
                        // alert(figure4ValueList);

                        // $("#f1Title").html("<a id='density1' style='color: #ff8000'>"+ type +"</a> density in <a id='density2' style='color: #ff8000'>"+ species +"</a> chromosome :");
                        // myChart1.setOption({
                        //     xAxis: {
                        //         data: figure1NameList
                        //     },
                        //     yAxis: {},
                        //     series: [{
                        //         name: 'density',
                        //         type: 'bar',
                        //         data: figure1ValueList
                        //     }]
                        // });
                        // $("#f2Title").html("<a id = 'feature1' style='color: #ff8000'>"+ type +"</a> number in <a id='feature2' style='color: #ff8000'>"+ species +"</a> genomic feature :");
                        // myChart2.setOption({
                        //     series: [
                        //         {
                        //             // name: '访问来源',
                        //             type: 'pie',
                        //             radius: '50%',
                        //             data: figure2,
                        //             emphasis: {
                        //                 itemStyle: {
                        //                     shadowBlur: 10,
                        //                     shadowOffsetX: 0,
                        //                     shadowColor: 'rgba(0, 0, 0, 0.5)'
                        //                 }
                        //             }
                        //         }
                        //     ]
                        // });

                        $("#f3Title").html("Histogram of Mass error of <a id='coverage'  style=\"color: #ff8000\">" + type + "</a> sites in <a id='feature3' style='color: #ff8000;font-style: italic;'>" + species + "</a> :");
                        if (figure3ValueList.length === 0) {
                            myChart3.setOption({
                                title: {
                                    text: 'No Data',
                                    x: 'center',
                                    y: 'center',
                                    textStyle: {
                                        color: 'rgba(55,54,54,0.34)',
                                        fontWeight: 'normal',
                                        fontSize: 24
                                    }
                                },
                                xAxis: {
                                    data: []
                                },
                                yAxis: {},
                                series: [{
                                    name: 'number',
                                    type: 'bar',
                                    data: []
                                }]
                            });
                        } else {
                            myChart3.setOption({
                                title: {
                                    text: '',
                                },
                                xAxis: {
                                    data: figure3NameList
                                },
                                yAxis: {},
                                series: [{
                                    name: 'number',
                                    type: 'bar',
                                    data: figure3ValueList
                                }]
                            });
                        }
                        $("#f4Title").html("Histogram of Peptide score of <a id = 'score'  style=\"color: #ff8000\">" + type + "</a> sites in <a id='feature4' style='color: #ff8000;font-style: italic;'>" + species + "</a> :");
                        if (figure4ValueList.length === 0) {
                            myChart4.setOption({
                                title: {
                                    text: 'No Data',
                                    x: 'center',
                                    y: 'center',
                                    textStyle: {
                                        color: 'rgba(55,54,54,0.34)',
                                        fontWeight: 'normal',
                                        fontSize: 24
                                    }
                                },
                                xAxis: {
                                    data: []
                                },
                                yAxis: {},
                                series: [{
                                    name: 'number',
                                    type: 'bar',
                                    data: []
                                }]
                            });
                        } else {
                            myChart4.setOption({
                                title: {
                                    text: '',
                                },
                                xAxis: {
                                    data: figure4NameList
                                },
                                yAxis: {},
                                series: [{
                                    name: 'number',
                                    type: 'bar',
                                    data: figure4ValueList
                                }]
                            });
                        }
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
                                <c:forEach items="${speciesAndTpyes.species}" var="species">
                                    <option value="${species}">${species}</option>
                                </c:forEach>
                            </select>
                            <br>
                            <span style="padding:0px;margin:10px 0px;color: black;">type:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            <select class="selec" name="modification_type" id="mdselect"
                                    style="padding:0px;margin:10px 0px;">
                                <option value="">Choose</option>
                                <c:forEach items="${speciesAndTpyes.types}" var="type">
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
                                                                                                      class="color">Protein
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
                                    <td id="td1" style="font-size: 14px;font-style: italic;">Oryza sativa</td>
                                    <td id="td2" style="font-size: 14px;">LC-MS/MS</td>
                                    <td id="td3" style="font-size: 14px;">ProteomeXchange: PXD005986</td>
                                    <td id="td4" style="font-size: 14px;"><a
                                            href="https://pubmed.ncbi.nlm.nih.gov/29235492/">29235492</a></td>
                                </tr>
                            </table>
                            <br><br>
                            <%--将异步请求得到的结果放入数组中--%>
                            <script type="text/javascript">
                            </script>
                            <%--                            <h3  style="display:block; font-weight: bold;color: green;text-align: left; " id="f1Title"><a id='density1' style='color: #ff8000'>6mA</a> density in <a id='density2' style='color: #ff8000'>Rosa chinensis</a> chromosome :</h3>--%>
                            <%--                            &lt;%&ndash;                            <div class="density"><img src="static/images/density.png"></div>&ndash;%&gt;--%>
                            <%--                            <div class="density" id="figure1" style="width: 600px;height:400px;"></div>--%>
                            <%--                            <script type="text/javascript">--%>
                            <%--                                var myChart1 = echarts.init(document.getElementById('figure1'));--%>

                            <%--                                // 指定图表的配置项和数据--%>
                            <%--                                var option1 = {--%>
                            <%--                                    // title: {--%>
                            <%--                                    //     text: 'ECharts 入门示例'--%>
                            <%--                                    // },--%>
                            <%--                                    color: '#c9302c',--%>
                            <%--                                    tooltip: {},--%>
                            <%--                                    legend: {--%>
                            <%--                                        data:['density']--%>
                            <%--                                    },--%>
                            <%--                                    xAxis: {--%>
                            <%--                                        data: ['NC_037088.1']--%>
                            <%--                                    },--%>
                            <%--                                    yAxis: {},--%>
                            <%--                                    series: [{--%>
                            <%--                                        name: 'density',--%>
                            <%--                                        type: 'bar',--%>
                            <%--                                        data: [1]--%>
                            <%--                                    }]--%>
                            <%--                                };--%>

                            <%--                                myChart1.setOption(option1);--%>
                            <%--                            </script>--%>

                            <%--                            <h3  style="display:block; font-weight: bold;color: green;text-align: left; " id="f2Title"><a id = 'feature1' style='color: #ff8000'>6mA</a> number in <a id='feature2' style='color: #ff8000'>Rosa chinensis</a> genomic feature :</h3>--%>
                            <%--                            &lt;%&ndash;                            <div class="feature"><img src="static/images/feature.png"></div>&ndash;%&gt;--%>
                            <%--                            <div class="feature" id="figure2" style="width: 600px;height:400px;"></div>--%>
                            <%--                            <script type="text/javascript">--%>
                            <%--                                var myChart2 = echarts.init(document.getElementById('figure2'));--%>
                            <%--                                var option2 = {--%>
                            <%--                                    // title: {--%>
                            <%--                                    //     text: '某站点用户访问来源',--%>
                            <%--                                    //     subtext: '纯属虚构',--%>
                            <%--                                    //     left: 'center'--%>
                            <%--                                    // },--%>
                            <%--                                    tooltip: {--%>
                            <%--                                        trigger: 'item',--%>
                            <%--                                        formatter:function(param){--%>
                            <%--                                            return param.marker +" "+param.name+"：" + param.value--%>
                            <%--                                                + "<br>" + "&nbsp;&nbsp;&nbsp;&nbsp;"--%>
                            <%--                                                + "percent ("+param.percent+"%)";--%>
                            <%--                                        }--%>
                            <%--                                    },--%>
                            <%--                                    legend: {--%>
                            <%--                                        orient: 'vertical',--%>
                            <%--                                        left: 'left',--%>
                            <%--                                    },--%>
                            <%--                                    series: [--%>
                            <%--                                        {--%>
                            <%--                                            // name: '访问来源',--%>
                            <%--                                            type: 'pie',--%>
                            <%--                                            radius: '50%',--%>
                            <%--                                            data: [--%>
                            <%--                                                {value: 340, name: 'cds'},--%>
                            <%--                                                {value: 1466, name: 'intergenic'},--%>
                            <%--                                                {value: 710, name: 'intron'},--%>
                            <%--                                                {value: 141, name: 'lncRNA'},--%>
                            <%--                                                {value: 53, name: 'miscrna'},--%>
                            <%--                                                {value: 62, name: 'utr3'},--%>
                            <%--                                                {value: 26, name: 'utr5'}--%>
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
                            <%--                                myChart2.setOption(option2);--%>
                            <%--                            </script>--%>

                            <h3 style="display:block; font-weight: bold;color: green;text-align: left; " id="f3Title">
                                Histogram of Mass error of <a id='coverage' style="color: #ff8000">2-Hydroxyisobutyrylation</a>
                                sites in <a id='feature3' style='color: #ff8000;font-style: italic;'>Oryza sativa</a> :
                            </h3>
                            <%--                            <div class="density"><img src="static/images/density.png"></div>--%>
                            <div class="density" id="figure3" style="width: 600px;height:400px;"></div>
                            <script type="text/javascript">
                                var myChart3 = echarts.init(document.getElementById('figure3'));

                                // 指定图表的配置项和数据
                                var option3 = {
                                    color: '#c9302c',
                                    tooltip: {},
                                    legend: {
                                        data: ['number']
                                    },
                                    xAxis: {
                                        data: ['[-5.0,-4.5]', '(-4.5,-4.0]', '(-4.0,-3.5]', '(-3.5,-3.0]', '(-3.0,-2.5]', '(-2.5,-2.0]', '(-2.0,-1.5]', '(-1.5,-1.0]', '(-1.0,-0.5]', '(-0.5,0.0]', '(0.0,0.5]', '(0.5,1.0]', '(1.0,1.5]', '(1.5,2.0]', '(2.0,2.5]', '(2.5,3.0]', '(3.0,3.5]', '(3.5,4.0]', '(4.0,4.5]', '(4.5,5.0]'],
                                        // name: "log2(coverage)",
                                        // nameLocation: "middle",
                                        // nameTextStyle:{
                                        //     padding: [15,0,0,0]
                                        // }
                                    },
                                    yAxis: {},
                                    series: [{
                                        name: 'number',
                                        type: 'bar',
                                        data: [10, 17, 26, 47, 124, 211, 405, 717, 1237, 1869, 1887, 1320, 773, 487, 267, 161, 88, 66, 40, 20]
                                    }]
                                };

                                myChart3.setOption(option3);
                            </script>

                            <h3 style="display:block; font-weight: bold;color: green;text-align: left; " id="f4Title">
                                Histogram of Peptide score of <a id='score' style="color: #ff8000">2-Hydroxyisobutyrylation</a>
                                sites in <a id='feature4' style='color: #ff8000;font-style: italic;'>Oryza sativa</a> :
                            </h3>
                            <%--                            <div class="feature"><img src="static/images/feature.png"></div>--%>
                            <div class="feature" id="figure4" style="width: 600px;height:400px;"></div>
                            <script type="text/javascript">
                                var myChart4 = echarts.init(document.getElementById('figure4'));
                                var option4 = {
                                    color: '#bb901a',
                                    tooltip: {},
                                    legend: {
                                        data: ['number']
                                    },
                                    xAxis: {
                                        data: [40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 237, 238, 240, 241, 242, 243, 244, 245, 246, 247, 249, 250, 252, 255, 256, 259, 260, 262, 263, 264, 265, 266, 268, 269, 270, 271, 274, 276, 283, 287, 289, 293, 294, 297, 299, 340],
                                        name: "log2(score)",
                                        nameLocation: "middle",
                                        nameTextStyle: {
                                            padding: [15, 0, 0, 0]
                                        }
                                    },
                                    yAxis: {},
                                    series: [{
                                        name: 'number',
                                        type: 'bar',
                                        data: [24, 23, 36, 36, 41, 37, 43, 52, 63, 54, 64, 54, 67, 76, 82, 74, 88, 90, 110, 62, 95, 91, 101, 133, 89, 106, 137, 113, 107, 114, 117, 116, 105, 113, 95, 100, 122, 135, 115, 121, 114, 116, 116, 112, 115, 120, 96, 80, 102, 128, 124, 113, 89, 102, 93, 97, 116, 98, 111, 96, 107, 86, 90, 86, 70, 96, 80, 108, 71, 63, 104, 74, 71, 85, 56, 66, 51, 81, 88, 83, 71, 68, 76, 74, 91, 73, 55, 54, 50, 49, 56, 53, 46, 45, 45, 42, 48, 29, 43, 46, 41, 46, 44, 46, 28, 60, 28, 33, 34, 32, 33, 40, 32, 25, 28, 37, 20, 35, 25, 19, 29, 23, 33, 16, 24, 14, 19, 17, 19, 20, 22, 23, 20, 17, 22, 12, 18, 9, 11, 12, 21, 13, 15, 13, 14, 11, 11, 13, 14, 7, 17, 5, 11, 9, 13, 8, 9, 6, 8, 8, 3, 6, 9, 6, 10, 4, 6, 3, 7, 2, 5, 6, 4, 4, 9, 3, 8, 3, 7, 5, 5, 1, 2, 1, 1, 4, 2, 2, 5, 2, 4, 6, 3, 2, 2, 5, 5, 2, 1, 2, 2, 1, 1, 1, 2, 3, 1, 1, 2, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 2, 1, 2, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1]
                                    }]
                                };
                                myChart4.setOption(option4);
                            </script>

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
                                    <li><a href="protein/getAllSpeciesAndTypeToBrowsePage#Overview1">Overview</a></li>
                                    <%--                                    <li><a href="protein/getAllSpeciesAndTypeToBrowsePage#density1">Density</a></li>--%>
                                    <li><a href="protein/getAllSpeciesAndTypeToBrowsePage#coverage">Mass error</a></li>
                                    <li><a href="protein/getAllSpeciesAndTypeToBrowsePage#score">Peptide score</a></li>
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


