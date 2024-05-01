<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/25
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>PlantEMS-DNA search</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Plant Epigenetic Modification Sites database"/>
    <meta name="keywords" content="Plant Epigenetic Modification Sites database"/>
    <meta name="author" content="lin-group"/>


    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,700" rel="stylesheet">

    <%@include file="/pages/common/header.jsp" %>

    <script type="text/javascript">
        $(function () {
            //用物种搜索修饰类型
            $("#smselect").change(function () {
                var value = $("#smselect option:selected").val();
                $("#smerror").hide();

                if (value !== "") {
                    $.getJSON("${pageContext.getAttribute("baseHref")}dna/ajaxGetTypeBySpecies", "species=" + value, function (data) {
                        // alert(data[0]);
                        var temp = $("#mdselect").empty();
                        temp.append("<option value=''>Please Choose</option>");
                        if (value === "Oryza sativa ssp. Nipponbare") {
                            temp.append("<option value='5hmc'>5hmc</option>");
                        }
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
            //用物种搜索染色体
            $("#smselect1").change(function () {
                var value = $("#smselect1 option:selected").val();
                $("#scerror").hide();
                if (value === "Oryza sativa ssp. Nipponbare") {
                    var temp = $("#chselect").empty();
                    temp.append("<option value=''>Please Choose</option>");
                    temp.append("<option value='chr1'>chr1</option>");
                    temp.append("<option value='chr2'>chr2</option>");
                    temp.append("<option value='chr3'>chr3</option>");
                    temp.append("<option value='chr4'>chr4</option>");
                    temp.append("<option value='chr5'>chr5</option>");
                    temp.append("<option value='chr6'>chr6</option>");
                    temp.append("<option value='chr7'>chr7</option>");
                    temp.append("<option value='chr8'>chr8</option>");
                    temp.append("<option value='chr9'>chr9</option>");
                    temp.append("<option value='chr10'>chr10</option>");
                    temp.append("<option value='chr11'>chr11</option>");
                    temp.append("<option value='chr12'>chr12</option>");
                } else if (value !== "") {
                    $.getJSON("${pageContext.getAttribute("baseHref")}dna/ajaxGetChromosomeBySpecies", "species=" + value, function (data) {
                        // alert(data[0]);
                        var temp = $("#chselect").empty();
                        temp.append("<option value=''>Please Choose</option>");
                        var temp1 = $("#mdselect1").empty();
                        temp1.append("<option value=''>Please Choose</option>");
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
            //用物种和染色体搜索修饰类型
            $("#chselect").change(function () {
                $("#scerror").hide();
                var value = $("#smselect1 option:selected").val();
                var value1 = $("#chselect option:selected").val();
                if (value !== "" && value1 !== "") {
                    $.getJSON("${pageContext.getAttribute("baseHref")}dna/ajaxGetTypeBySpeciesAndChromosome", "species=" + value + "&chromosome=" + value1, function (data) {
                        // alert(data[0]);
                        var temp = $("#mdselect1").empty();
                        temp.append("<option value=''>Please Choose</option>");
                        if (value === "Oryza sativa ssp. Nipponbare") {
                            temp.append("<option value='5hmc'>5hmc</option>");
                        }
                        for (var typeIndex in data) {
                            if (data.hasOwnProperty(typeIndex)) {
                                if (data[typeIndex] != null) {
                                    temp.append("<option value='" + data[typeIndex] + "'>" + data[typeIndex] + "</option>");
                                }
                            }
                        }
                        temp.append("<option value='all'>all</option>");
                    });
                }
            });

            //sequence测试用例js
            $("#sequenceExample").click(function () {
                $("#sequenceExample").parent().find("input").first().val("AATCGGAGGTT");
                $("#sequenceExample").parent().find("option[value='Arabidopsis thaliana']").attr("selected", true);
                return false;
            });

            // //清空sequence测试用例js
            // $("#clearSequenceExample").click(function () {
            //     $("#clearSequenceExample").parent().find("input").first().val("");
            //     $("#sequenceExample").parent().find("option[value='']").attr("selected",true);
            //     return false;
            // });

            $("#sequenceSubmit").click(function () {
                var value = $("#sequenceInput").val();
                var valuePattern = /^\w{5,41}$/;
                if (!valuePattern.test(value)) {
                    alert("The sequence length should be between 5 and 41!");
                    return false;
                }
            });

            $("#species_search").click(function () {
                var value1 = $("#smselect option:selected").val();
                var value2 = $("#mdselect option:selected").val();
                if (value1 === "" || value2 === "") {
                    $("#smerror").show();
                    return false;
                }
            });

            $("#Peptide_search").click(function () {
                var value1 = $("#smselect1 option:selected").val();
                var value2 = $("#chselect option:selected").val();
                var value3 = $("#mdselect1 option:selected").val();
                if (value1 === "" || value2 === "" || value3 === "") {
                    $("#scerror").show();
                    return false;
                }
            });
            $("#mod_seqrch").click(function () {
                var value1 = $("#mt3 option:selected").val();
                if (value1 === "" || value2 === "" || value3 === "") {
                    $("#mterror").show();
                    return false;
                }
            });
            $("#id_search").click(function () {
                var value1 = $("#id_input").val();
                if (value1 === "" || value1 === "Please Input the correct Id") {
                    $("#idError").show();
                    return false;
                }
            });
            //id测试用例js
            $("#idExample").click(function () {
                $("#idError").hide();
                $("#idExample").parent().find("input").first().val("plantems_dna_000000001");
                return false;
            });

            //GENE测试用例js
            $("#GeneExample").click(function () {
                $("#smerror").hide();
                $("#smselect").val('Fragaria vesca')
                $("#mdselect").val('6mA')
                $("#geneName").val('LOC101290795')
                // $("#GeneExample").parent().find("input").first().val("plantems_dna_000000001");
                return false;
            });
            //Position测试用例js
            $("#positionExample").click(function () {
                $("#scerror").hide();
                $("#smselect1").val('Fragaria vesca')
                $("#chselect").val('chr1')
                $("#mdselect1").val('6mA')
                $("#position_from").val('13000')
                $("#position_to").val('13500')
                // $("#GeneExample").parent().find("input").first().val("plantems_dna_000000001");
                return false;
            });
            //type测试用例js
            $("#typeExample").click(function () {
                $("#mterror").hide();
                $("#mt3").val('6mA')
                // $("#GeneExample").parent().find("input").first().val("plantems_dna_000000001");
                return false;
            });
            $("#mt3").change(function () {
                $("#mterror").hide();
            });

            $("#mdselect").change(function () {
                $("#smerror").hide();
            });

            $("#mdselect1").change(function () {
                $("#scerror").hide();
            });


        });
    </script>

    <style type="text/css">
<%--        example按钮--%>
       .ex_btn {
           margin-left: 10px;
       }
        .search_species {
            border: 3px solid #ddd;
            font-size: 20px;
            text-align: center;
            border-radius: 10px;
            height: 66px;
            background-color: #ddd;

        }

        .search_species2 {
            border: 3px solid #ddd;
            font-size: 20px;
            /*   		text-align: center;*/
            border-radius: 10px;
            height: 123px;
            padding-left: 7px;
            background-color: #ddd;

        }

        .search_species3 {
            border: 3px solid #dee6de;
            font-size: 20px;
            text-align: left;
            border-radius: 10px;
            height: 104px;
            padding-left: 7px;
            background-color: #ddd;
        }

        .species_submit {
            background-color: #3c763d;
            border-color: #33CCCC;
            border: 1px solid transparent;
            border-radius: 20px;
            font-size: 20px;
            color: #fafcfc;
            float: right;
            margin-right: 29px;
            margin-top: 10px;
            width: 118px;

        }

        .species_submit:hover {
            background-color: #5cb85c;
        }

        .selec {
            line-height: 1.42857143;
            color: #a59a9a;
            background-color: #fff;
            background-image: none;
            border: 1px solid #c7c1c1;
            border-radius: 4px;
            width: 169px;
            height: 37px;
        }

        option {
            font-weight: normal;
            display: block;
            white-space: nowrap;
            min-height: 1.2em;
            padding: 0px 2px 1px;
        }

        .span_selec {
            font-size: 20px;
            color: #333;
            padding: 0px;
            margin: 10px 0px;
            /*    	font-weight: bold;*/
        }

        svg {
            height: 39px;
            width: 49px;
        }

        .Accession_input {
            border-radius: 4px;
            margin-top: 10px;
            border: 1px solid #c7c1c1;
        }

        .Accession_input2 {
            width: 200px;
            border-radius: 4px;
            margin-top: 10px;
            border: 1px solid #c7c1c1;
            text-align: center;
            width: 142px;
        }
        .Accession_input3 {
            border-radius: 4px;
            margin-top: 10px;
            border: 1px solid #c7c1c1;
            text-align: center;
            width: 300px;
        }
        .Accession_Example {
            border-radius: 4px;
            border: 1px solid #f5f5f5;
            /*		background-color: #c3bebe;*/
        }

        .Accession_Example:hover {
            border-radius: 4px;
            border: 1px solid #f5f5f5;
            color: white;
            background-color: #c3bebe;
        }

        h1, h2, h3, h4, h5, h6, figure {
            font-family: none;
        }

        h2 {
            font-size: 25px;
            color: #333;
        }

        .fh5co-counters .overlay {
            width: 1170px;
            margin: 0 auto;
            background-color: #f7f7f7;
        }

    </style>


</head>
<body>

<div class="fh5co-loader"></div>

<div id="page">
    <!--     <div id="line" style = "width: 1170px; height: 5px; background: #33cccc;margin: 0 auto;"></div> -->
    <%@include file="/pages/common/navigator_search.jsp" %>


    <div id="fh5co-counter" class="fh5co-counters" style="width:1170px; margin:0 auto;"
         data-stellar-background-ratio="0.5">
        <div class="overlay">

        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1" style="margin-top: -90px">
                    <div class="row">
                        <h3 style="display:block; font-weight: bold;color: green;text-align:center "> DNA modification
                            search</h3>
                        <hr>
                        <h2 style="color: #386939">1. Search by <span
                                style="color: #f39800;font-weight:bold;">Gene</span>&nbsp;&nbsp;&nbsp;<span id="smerror"
                                                                                                            style="color: red;font-size: medium"
                                                                                                            hidden="hidden">Please Choose the correct species and modification type!</span>
                        </h2>
                        <form method="post" action="dna/getDnaInformationBySpeciesAndMtypeAndGeneName">
                            <fieldset align="left" class="search_species">
                                <span class="span_selec">Species:&nbsp; </span>
                                <select class="selec" name="species" id="smselect" style="padding:0px;margin:10px 0px;">
                                    <option value="">Please Choose</option>
                                    <c:forEach items="${stc.species}" var="species">
                                        <option value="${species}">${species}</option>
                                    </c:forEach>
                                </select>
                                <span class="span_selec"> &nbsp;&nbsp;Mod type:&nbsp;</span>
                                <select class="selec" name="modification_type" id="mdselect"
                                        style="padding:0px;margin:10px 0px;">
                                    <option value="">Please Choose</option>
                                    <c:forEach items="${stc.types}" var="type">
                                        <option value="${type}">${type}</option>
                                    </c:forEach>
                                </select>
                                <span class="span_selec"> &nbsp;&nbsp;Gene name:&nbsp;</span>
                                <input name="gene_name" value="Default all" class="Accession_input2" id="geneName"
                                       onFocus="if(value===defaultValue){value='';this.style.color='#000'}"
                                       onBlur="if(!value){value=defaultValue; this.style.color='#999'}"
                                       style="color:#999;"/>
                                <button class="Accession_Example ex_btn" value="Search" id="GeneExample">Example</button>
                                <input type="submit" value="Search" class="species_submit" id="species_search">
                            </fieldset>
                        </form>


                        <br><br>
                        <h2 style="color: #386939">2. Search by <span
                                style="color: #f39800;font-weight:bold;">Position</span>&nbsp;&nbsp;&nbsp;<span
                                id="scerror" style="color: red;font-size: medium" hidden="hidden">Please Choose the correct specie, chromsome and modification type!</span>
                        </h2>
                        <form method="post" action="dna/getDnaInformationBySpeciesChromosomeAndType">
                            <fieldset align="left" class="search_species2">
                                <span class="span_selec">Species:&nbsp; </span>
                                <select class="selec" name="species" id="smselect1"
                                        style="padding:0px;margin:10px 0px;">
                                    <option value="">Please Choose</option>
                                    <c:forEach items="${stc.species}" var="species">
                                        <option value="${species}">${species}</option>
                                    </c:forEach>
                                </select>
                                <span class="span_selec">&nbsp;Chromsome:&nbsp; </span>
                                <select class="selec" name="chromosome" id="chselect"
                                        style="padding:0px;margin:10px 0px;">
                                    <option value="">Please Choose</option>
                                    <c:forEach items="${stc.chromosomes}" var="chromosome">
                                        <option value="${chromosome}">${chromosome}</option>
                                    </c:forEach>
                                </select>
                                <span class="span_selec">&nbsp;Mod type:&nbsp; </span>
                                <select class="selec" name="modification_type" id="mdselect1"
                                        style="padding:0px;margin:10px 0px;">
                                    <option value="">Please Choose</option>
                                    <c:forEach items="${stc.types}" var="type">
                                        <option value="${type}">${type}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <span class="span_selec" style="padding-left:157px"> &nbsp;&nbsp;from&nbsp;</span>
                                <input class="Accession_input2" value="Default all" name="from" id="position_from"
                                       onFocus="if(value===defaultValue){value='';this.style.color='#000'}"
                                       onBlur="if(!value){value=defaultValue; this.style.color='#999'}"
                                       style="color:#999;"/>
                                <span class="span_selec"> &nbsp;&nbsp;to&nbsp;</span>
                                <input class="Accession_input2" value="Default all" name="to" id="position_to"
                                       onFocus="if(value===defaultValue){value='';this.style.color='#000'}"
                                       onBlur="if(!value){value=defaultValue; this.style.color='#999'}"
                                       style="color:#999;"/>
                                <button class="Accession_Example ex_btn" value="Search" id="positionExample">Example</button>
                                <button type="submit" class="species_submit" value="Search" id="Peptide_search"
                                        style="margin-top:-17px;margin-right: 31px; ">Search
                                </button>
                            </fieldset>
                        </form>

                        <%--                        <br><br>--%>
                        <%--                        <h2 style="color: #386939">3. Search by <span style="color: #f39800;font-weight:bold;">Sequence</span></h2>--%>
                        <%--                        <form method="post" action="dna/getDnaInformationBySequence">--%>
                        <%--                        <fieldset  align="left" class="search_species3">--%>
                        <%--                            <!-- 						<div class="Accession_div"> -->--%>
                        <%--                            <span class="span_selec">Species:&nbsp; </span>--%>
                        <%--                            <select class="selec" name="species" style="padding:0px;margin:10px 0px;">--%>
                        <%--                                <option value="">Please Choose</option>--%>
                        <%--                                <c:forEach items="${stc.species}" var="species">--%>
                        <%--                                    <option value="${species}">${species}</option>--%>
                        <%--                                </c:forEach>--%>
                        <%--                            </select>--%>

                        <%--                            <span class="span_selec">&nbsp;Sequence:&nbsp;</span>--%>
                        <%--                            <!-- <br> -->--%>
                        <%--                            <input class="Accession_input" name="sequence" value="" id="sequenceInput" style="width: 361px;height: 69px"/>--%>

                        <%--                            <!-- <button type="submit" class="Accession_Example1" value="Search" id="Accession_example">Sequence</button> -->--%>
                        <%--                            <button class="Accession_Example"  id="sequenceExample">Example</button>--%>

                        <%--&lt;%&ndash;                            <button class="Accession_Example"  id="clearSequenceExample">Clear</button>&ndash;%&gt;--%>
                        <%--                            <!-- 						</div> -->--%>
                        <%--                            <input type="submit" class="species_submit" value="Search" id="sequenceSubmit" style="margin-top: 30px;margin-right: 31px"/>--%>
                        <%--                        </fieldset>--%>
                        <%--                        </form>--%>

                        <br><br>
                        <h2 style="color: #386939">3. Search by <span style="color: #f39800;font-weight:bold;">Modification type</span>&nbsp;&nbsp;&nbsp;<span
                                id="mterror" style="color: red;font-size: medium" hidden="hidden">Please Choose the correct modification type!</span>
                        </h2>
                        <form method="post" action="dna/getDnaInformationByType">
                            <fieldset align="left" class="search_species">
                                <!-- 						<div class="Accession_div"> -->
                                <span class="span_selec">Mod type:&nbsp;</span>
                                <select class="selec" name="modification_type" style="padding:0px;margin:10px 0px;"
                                        id="mt3">
                                    <option value="">Please Choose</option>
                                    <option value='5hmc'>5hmc</option>
                                    <c:forEach items="${stc.types}" var="type">
                                        <option value="${type}">${type}</option>
                                    </c:forEach>
                                </select>
                                <!-- 						</div> -->
                                <button class="Accession_Example ex_btn" value="Search" id="typeExample">Example</button>
                                <input type="submit" class="species_submit" value="Search" id="mod_seqrch"/>
                            </fieldset>
                        </form>

<%--                        根据ID搜索--%>
                        <br><br>
                        <h2 style="color: #386939">4. Search by <span style="color: #f39800;font-weight:bold;">Id</span>&nbsp;&nbsp;&nbsp;<span
                                id="idError" style="color: red;font-size: medium" hidden="hidden">Please Input the correct Id!</span>
                        </h2>
                        <form method="post" action="dna/getDnaInformationById">
                            <fieldset align="left" class="search_species">
                                <span class="span_selec">Id:&nbsp;</span>
                                <input class="Accession_input3" value="Please Input the correct Id" name="id_name" id="id_input"
                                       onFocus="if(value===defaultValue){value='';this.style.color='#000'}"
                                       style="color:#999;"/>
                                <button class="Accession_Example ex_btn" value="Search" id="idExample">Example</button>
                                <input type="submit" class="species_submit" value="Search" id="id_search"/>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 	<div id="fh5co-testimonial" class="fh5co-bg-section" style="width: 1170px; margin: 0 auto; padding: 105px 0 16px 0;">
            <div class="container" >

                <div class="row" style="margin-top:-89px">
                    <div class="col-md-4 animate-box" style="width: 798px;">
                        <div class="testimony text-center" style="border-top:50px solid #d08508;">

                            <h3 style="display:block; margin-top:-80px;font-weight: bold;color: white ">Major Genera Quick Start</h3>
                            <nav id="gross">
                               <ul>
                                   <li><a href="#"><img src="images/1.png" alt=""></a></li>
                                   <li><a href="#"><img src="images/2.png" alt=""></a></li>
                                   <li><a href="#"><img src="images/3.png" alt=""></a></li>
                                   <li><a href="#"><img src="images/4.png" alt=""></a></li>
                                   <li><a href="#"><img src="images/5.png" alt=""></a></li>
                                   <li><a href="#"><img src="images/6.png" alt=""></a></li>
                               </ul>
                           </nav>

                        </div>
                    </div>

                    <div class="col-md-4 animate-box" style="width: 372px">
                        <div class="testimony text-center" style="border-top:50px solid #d08508;">

                            <h3 style="display:block; margin-top:-80px;font-weight: bold;color: white ">News and Updates</h3>
                            <blockquote >

                            <nav id = "gross2">
                               <ul style="color:#0f6c27; font-family: sans-serif;text-align:justify;font-size: 16px;">
                                   <li>Whole genome assembly of two apricot cultivars and one wild species available (4/21)</li>
                                   <li>Whole genome assembly of two apricot cultivars and one wild species available (4/21)</li>
                               </ul>
                           </nav>
                            </blockquote>
                            <span class="user" >&mdash; <a href="more.html" style="color:#0f6c27;">More</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->


    <footer id="fh5co-footer" role="contentinfo" style="width: 1158px; margin: 0 auto;padding: 0px 10px 10px 10px;">
        <!-- <div class="overlay"></div> -->

        <div class="row copyright" style=" padding: 20px 0px 7px 0px;">
            <div class="col-md-12 text-center">
                <p>
                    <small class="block" style="padding:0;font-size: 113%">&copy; Copyright LinGroup(lin-group.cn) @
                        2021 All rights reserved© Copyright.</small>

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
