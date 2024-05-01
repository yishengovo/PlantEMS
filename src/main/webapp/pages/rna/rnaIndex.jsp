<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/28
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
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
                if (value === "Brassica rapa ssp chinensis") {
                    var temp = $("#mdselect").empty();
                    temp.append("<option value=''>Please Choose</option>");
                    temp.append("<option value='m6A'>m6A</option>");
                } else if (value !== "") {
                    $.getJSON("${pageContext.getAttribute("baseHref")}rna/ajaxGetTypeBySpecies", "species=" + value, function (data) {
                        // alert(data[0]);
                        var temp = $("#mdselect").empty();
                        temp.append("<option value=''>Please Choose</option>");
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
            //用物种搜索染色体
            $("#smselect1").change(function () {
                var value = $("#smselect1 option:selected").val();
                $("#scerror").hide();
                if (value === "Brassica rapa ssp chinensis") {
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
                    temp.append("<option value='Contig00011'>Contig00011</option>");
                    temp.append("<option value='Contig00056_ERROPOS212737'>Contig00056_ERROPOS212737</option>");
                    temp.append("<option value='Contig00069_ERROPOS1101537'>Contig00069_ERROPOS1101537</option>");
                    temp.append("<option value='Contig00145'>Contig00145</option>");
                    temp.append("<option value='Contig00149'>Contig00149</option>");
                    temp.append("<option value='Contig00178'>Contig00178</option>");
                    temp.append("<option value='Contig00181_ERROPOS153738'>Contig00181_ERROPOS153738</option>");
                    temp.append("<option value='Contig00221'>Contig00221</option>");
                    temp.append("<option value='Contig00224_ERROPOS2383696'>Contig00224_ERROPOS2383696</option>");
                    temp.append("<option value='Contig00224_ERROPOS2783696+'>Contig00224_ERROPOS2783696+</option>");
                    temp.append("<option value='Contig00224_ERROPOS283696'>Contig00224_ERROPOS283696</option>");
                    temp.append("<option value='Contig00225'>Contig00225</option>");
                    temp.append("<option value='Contig00244'>Contig00244</option>");
                    temp.append("<option value='Contig00309'>Contig00309</option>");
                    temp.append("<option value='Contig00372'>Contig00372</option>");
                    temp.append("<option value='Contig00373'>Contig00373</option>");
                    temp.append("<option value='Contig00375'>Contig00375</option>");
                    temp.append("<option value='Contig00439'>Contig00439</option>");
                    temp.append("<option value='Contig00458'>Contig00458</option>");
                    temp.append("<option value='Contig00487'>Contig00487</option>");
                    temp.append("<option value='Contig00502'>Contig00502</option>");
                    temp.append("<option value='Contig00507'>Contig00507</option>");
                    temp.append("<option value='Contig00514'>Contig00514</option>");
                } else if (value !== "") {
                    $.getJSON("${pageContext.getAttribute("baseHref")}rna/ajaxGetChromosomeBySpecies", "species=" + value, function (data) {
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
                        if (value === "Arabidopsis thaliana") {
                            temp.append("<option value='chrMT'>chrMT</option>");
                        }
                    });
                }
            });
            //用物种和染色体搜索修饰类型
            $("#chselect").change(function () {
                $("#scerror").hide();
                var value = $("#smselect1 option:selected").val();
                var value1 = $("#chselect option:selected").val();
                if (value === "Brassica rapa ssp chinensis" && value1 !== "") {
                    var temp = $("#mdselect1").empty();
                    temp.append("<option value=''>Please Choose</option>");
                    temp.append("<option value='m6A'>m6A</option>");
                    temp.append("<option value='all'>all</option>");
                } else if (value === "Arabidopsis thaliana" && value1 === "chrMT") {
                    var temp = $("#mdselect1").empty();
                    temp.append("<option value=''>Please Choose</option>");
                    temp.append("<option value='m5C'>m5C</option>");
                    temp.append("<option value='all'>all</option>");
                } else if (value !== "" && value1 !== "") {
                    $.getJSON("${pageContext.getAttribute("baseHref")}rna/ajaxGetTypeBySpeciesAndChromosome", "species=" + value + "&chromosome=" + value1, function (data) {
                        // alert(data[0]);
                        var temp = $("#mdselect1").empty();
                        temp.append("<option value=''>Please Choose</option>");
                        for (var typeIndex in data) {
                            if (data.hasOwnProperty(typeIndex)) {
                                if (data[typeIndex] != null) {
                                    temp.append("<option value='" + data[typeIndex] + "'>" + data[typeIndex] + "</option>");
                                }
                            }
                        }
                        //该物种这几个染色体上在链两个rna表中都存在，表的字段个数不一样，所以不能添加all
                        if (value === "Arabidopsis thaliana" && value1 === "chr1" ||
                            value === "Arabidopsis thaliana" && value1 === "chr2" ||
                            value === "Arabidopsis thaliana" && value1 === "chr3" ||
                            value === "Arabidopsis thaliana" && value1 === "chr4" ||
                            value === "Arabidopsis thaliana" && value1 === "chr5") {
                            temp.append("<option value='m5C'>m5C</option>");
                        } else {
                            temp.append("<option value='all'>all</option>");
                        }

                    });
                }
            });

            //sequence测试用例js
            $("#sequenceExample").click(function () {
                $("#sequenceExample").parent().find("input").first().val("CTAGAAATCATGT");
                $("#sequenceExample").parent().find("option[value='Arabidopsis thaliana']").attr("selected", true);
                return false;
            });

            //id测试用例js
            $("#idExample").click(function () {
                $("#idError").hide();
                $("#idExample").parent().find("input").first().val("plantems_rna_000000001");
                return false;
            });

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
            $("#mt3").change(function () {
                $("#mterror").hide();
            });

            $("#mdselect").change(function () {
                $("#smerror").hide();
            });

            $("#mdselect1").change(function () {
                $("#scerror").hide();
            });

            //GENE测试用例js
            $("#GeneExample").click(function () {
                $("#smerror").hide();
                $("#smselect").val('Arabidopsis lyrata')
                $("#mdselect").val('i6A|t6A')
                $("#geneName").val('AL9U11970.t1.v2.1')
                // $("#GeneExample").parent().find("input").first().val("plantems_dna_000000001");
                return false;
            });
            //Position测试用例js
            $("#positionExample").click(function () {
                $("#scerror").hide();
                $("#smselect1").val('Arabidopsis lyrata')
                $("#chselect").val('scaffold_3')
                $("#mdselect1").val('m1A|m1I|ms2i6A')
                $("#position_from").val('24400000')
                $("#position_to").val('24450000')
                // $("#GeneExample").parent().find("input").first().val("plantems_dna_000000001");
                return false;
            });
            //type测试用例js
            $("#typeExample").click(function () {
                $("#mterror").hide();
                $("#mt3").val('ac4C')
                // $("#GeneExample").parent().find("input").first().val("plantems_dna_000000001");
                return false;
            });

        });
    </script>
    <!-- End demo purposes only -->
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
            /*		background-color: #5cb85c73;*/
        }

        .Accession_Example:hover {
            border-radius: 4px;
            border: 1px solid #f5f5f5;
            color: white;
            background-color: #5cb85c;
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
                        <h3 style="display:block; font-weight: bold;color: green;text-align:center "> RNA modification
                            search</h3>
                        <hr>
                        <h2 style="color: #386939">1. Search by <span
                                style="color: #f39800;font-weight:bold;">Gene</span>&nbsp;&nbsp;&nbsp;<span id="smerror"
                                                                                                            style="color: red;font-size: medium"
                                                                                                            hidden="hidden">Please Choose the correct species and modification type!</span>
                        </h2>
                        <form method="post" action="rna/getRnaInformationBySpeciesAndMtypeAndGeneName">
                            <fieldset align="left" class="search_species">

                                <span class="span_selec">Species:&nbsp; </span>
                                <select class="selec" name="species" id="smselect" style="padding:0px;margin:10px 0px;">
                                    <option value="">Please Choose</option>
                                    <c:forEach items="${stc.species}" var="species">
                                        <option value="${species}">${species}</option>
                                    </c:forEach>
                                    <option value="Brassica rapa ssp chinensis">Brassica rapa ssp chinensis</option>
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
                        <form method="post" action="rna/getRnaInformationBySpeciesChromosomeAndType">
                            <fieldset align="left" class="search_species2">

                                <span class="span_selec">Species:&nbsp; </span>
                                <select class="selec" name="species" id="smselect1"
                                        style="padding:0px;margin:10px 0px;">
                                    <option value="">Please Choose</option>
                                    <c:forEach items="${stc.species}" var="species">
                                        <option value="${species}">${species}</option>
                                    </c:forEach>
                                    <option value="Brassica rapa ssp chinensis">Brassica rapa ssp chinensis</option>
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
                        <%--                        <form method="post" action="rna/getRnaInformationBySequence">--%>
                        <%--                        <fieldset  align="left" class="search_species3">--%>
                        <%--                            <!-- 						<div class="Accession_div"> -->--%>
                        <%--                            <span class="span_selec">Species:&nbsp; </span>--%>
                        <%--                            <select class="selec" name="species" style="padding:0px;margin:10px 0px;">--%>
                        <%--                                <option value="">Please Choose</option>--%>
                        <%--                                <c:forEach items="${stc.species}" var="species">--%>
                        <%--                                    <option value="${species}">${species}</option>--%>
                        <%--                                </c:forEach>--%>
                        <%--                                <option value="Brassica rapa ssp chinensis">Brassica rapa ssp chinensis</option>--%>
                        <%--                            </select>--%>
                        <%--                            <span class="span_selec">&nbsp;Sequence:&nbsp;</span>--%>
                        <%--                            <!-- <br> -->--%>
                        <%--                            <input class="Accession_input" name="sequence" value="" id="sequenceInput" style="width: 361px;height: 69px"/>--%>

                        <%--                            <button class="Accession_Example" id="sequenceExample">Example</button>--%>

                        <%--                            &lt;%&ndash;                            <button class="Accession_Example"  id="clearSequenceExample">Clear</button>&ndash;%&gt;--%>
                        <%--                            <!-- 						</div> -->--%>
                        <%--                            <input type="submit" class="species_submit" value="Search" id="sequenceSubmit" style="margin-top: 30px;margin-right: 31px"/>--%>
                        <%--                        </fieldset>--%>
                        <%--                        </form>--%>

                        <br><br>
                        <h2 style="color: #386939">3. Search by <span style="color: #f39800;font-weight:bold;">Modification type</span>&nbsp;&nbsp;&nbsp;<span
                                id="mterror" style="color: red;font-size: medium" hidden="hidden">Please Choose the correct modification type!</span>
                        </h2>
                        <form method="post" action="rna/getRnaInformationByType">
                            <fieldset align="left" class="search_species">
                                <!-- 						<div class="Accession_div"> -->
                                <span class="span_selec">Mod type:&nbsp;</span>
                                <select class="selec" name="modification_type" style="padding:0px;margin:10px 0px;"
                                        id="mt3">
                                    <option value="">Please Choose</option>

                                    <c:forEach items="${stc.types}" var="type">
                                        <option value="${type}">${type}</option>
                                    </c:forEach>
                                    <option value='m5C'>m5C</option>
                                    <option value='m6A'>m6A</option>
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
                        <form method="post" action="rna/getRnaById">
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


