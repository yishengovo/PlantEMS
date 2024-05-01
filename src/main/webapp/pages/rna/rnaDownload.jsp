<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/7
  Time: 1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>PlantEMS-RNA download</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Plant Epigenetic Modification Sites database"/>
    <meta name="keywords" content="Plant Epigenetic Modification Sites database"/>
    <meta name="author" content="lin-group"/>


    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>

    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,700" rel="stylesheet">

    <%@include file="/pages/common/header.jsp" %>

    <style type="text/css">
        table.imagetable {
            font-family: verdana, arial, sans-serif;
            font-size: 20px;
            color: #333333;
            border: 1px solid red;
            /*        border-width: 1px;
                    border-color: #999999;*/
            border-collapse: collapse;
            width: 700px;
            margin: auto;

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

        table.imagetable a {
            color: green;
        }

        table.imagetable a:hover {
            background: #5cb85c;
            color: #ffffff;
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
    <%@include file="/pages/common/navigator_download.jsp" %>

    <div id="fh5co-counter" class="fh5co-counters" style="width:1170px; margin:0 auto;padding-bottom: 10px;"
         data-stellar-background-ratio="0.5">
        <div class="overlay">


        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1" style="margin-top: -90px">
                    <div class="row">
                        <br>
                        <h3 style="display:block; font-weight: bold;color: green;text-align:center ">RNA modification
                            data download</h3>
                        <!-- <blockquote style="border-color:rgb(0 0 0 / 3%); margin-bottom: 0;"> -->
                        <table border="1" class="imagetable">
                            <tr>
                                <th>Species</th>
                                <th>Download</th>
                            </tr>
                            <tr>
                                <td><i>Arabidopsis lyrata</i></td>
                                <td><a href="static/download/download_RNA\RNA_Arabidopsis_lyrata.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Arabidopsis thaliana</i></td>
                                <td><a href="static/download/download_RNA\RNA_Arabidopsis_thaliana.zip">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Boechera stricta</i></td>
                                <td><a href="static/download/download_RNA\RNA_Boechera_stricta.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Brachypodium distachyon</i></td>
                                <td><a href="static/download/download_RNA\RNA_Brachypodium_distachyon.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Brassica rapa ssp chinensis</i></td>
                                <td>
                                    <a href="static/download/download_RNA\RNA_Brassica_rapa_ssp_chinensis.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Capsella rubella</i></td>
                                <td><a href="static/download/download_RNA\RNA_Capsella_rubella.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Chlamydomonas reinhardtii</i></td>
                                <td>
                                    <a href="static/download/download_RNA\RNA_Chlamydomonas_reinhardtii.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Citrus sinensis</i></td>
                                <td><a href="static/download/download_RNA\RNA_Citrus_sinensis.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Cucumis sativus</i></td>
                                <td><a href="static/download/download_RNA\RNA_Cucumis_sativus.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Cyanidioschyzon merolae</i></td>
                                <td><a href="static/download/download_RNA\RNA_Cyanidioschyzon_merolae.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Dunaliella salina</i></td>
                                <td><a href="static/download/download_RNA\RNA_Dunaliella_salina.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Eutrema salsugineum</i></td>
                                <td><a href="static/download/download_RNA\RNA_Eutrema_salsugineum.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Fragaria vesca</i></td>
                                <td><a href="static/download/download_RNA\RNA_Fragaria_vesca.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Glycine max</i></td>
                                <td><a href="static/download/download_RNA\RNA_Glycine_max.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Hordeum vulgare</i></td>
                                <td><a href="static/download/download_RNA\RNA_Hordeum_vulgare.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Linum usitatissimum</i></td>
                                <td><a href="static/download/download_RNA\RNA_Linum_usitatissimum.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Malus domestica</i></td>
                                <td><a href="static/download/download_RNA\RNA_Malus_domestica.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Manihot esculenta</i></td>
                                <td><a href="static/download/download_RNA\RNA_Manihot_esculenta.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Medicago truncatula</i></td>
                                <td><a href="static/download/download_RNA\RNA_Medicago_truncatula.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Micromonas pusilla</i></td>
                                <td><a href="static/download/download_RNA\RNA_Micromonas_pusilla.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Musa acuminata</i></td>
                                <td><a href="static/download/download_RNA\RNA_Musa_acuminata.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Oryza sativa</i></td>
                                <td><a href="static/download/download_RNA\RNA_Oryza_sativa.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Phaseolus vulgaris</i></td>
                                <td><a href="static/download/download_RNA\RNA_Phaseolus_vulgaris.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Populus trichocarpa</i></td>
                                <td><a href="static/download/download_RNA\RNA_Populus_trichocarpa.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Prunus persica</i></td>
                                <td><a href="static/download/download_RNA\RNA_Prunus_persica.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Setaria italica</i></td>
                                <td><a href="static/download/download_RNA\RNA_Setaria_italica.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Setaria viridis</i></td>
                                <td><a href="static/download/download_RNA\RNA_Setaria_viridis.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Solanum lycopersicum</i></td>
                                <td><a href="static/download/download_RNA\RNA_Solanum_lycopersicum.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Solanum tuberosum</i></td>
                                <td><a href="static/download/download_RNA\RNA_Solanum_tuberosum.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Sorghum bicolor</i></td>
                                <td><a href="static/download/download_RNA\RNA_Sorghum_bicolor.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Triticum aestivum</i></td>
                                <td><a href="static/download/download_RNA\RNA_Triticum_aestivum.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Vitis vinifera</i></td>
                                <td><a href="static/download/download_RNA\RNA_Vitis_vinifera.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Zea mays</i></td>
                                <td><a href="static/download/download_RNA\RNA_Zea_mays.xlsx">Download</a></td>
                            </tr>
                        </table>

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
                        2021 All rights reservedÂ© Copyright.</small>
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


