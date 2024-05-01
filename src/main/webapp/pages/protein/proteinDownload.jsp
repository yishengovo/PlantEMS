<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/7
  Time: 1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>PlantEMS-Protein download</title>
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
                        <h3 style="display:block; font-weight: bold;color: green;text-align:center ">PTM data
                            download</h3>
                        <!-- <blockquote style="border-color:rgb(0 0 0 / 3%); margin-bottom: 0;"> -->
                        <table border="1" class="imagetable">
                            <tr>
                                <th>Species</th>
                                <th>Download</th>
                            </tr>
                            <tr>
                                <td><i>Ananas comosus</i></td>
                                <td><a href="static/download/download_protein\PTM_Ananas_comosus.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Arabidopsis thaliana</i></td>
                                <td>
                                    <a href="static/download/download_protein\PTM_Arabidopsis_thaliana.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Arachis hypogaea</i></td>
                                <td><a href="static/download/download_protein\PTM_Arachis_hypogaea.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Brachypodium distachyon</i></td>
                                <td>
                                    <a href="static/download/download_protein\PTM_Brachypodium_distachyon.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Brassica napus</i></td>
                                <td><a href="static/download/download_protein\PTM_Brassica_napus.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Camellia sinensis</i></td>
                                <td><a href="static/download/download_protein\PTM_Camellia_sinensis.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Carica papaya</i></td>
                                <td><a href="static/download/download_protein\PTM_Carica_papaya.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Carya cathayensis</i></td>
                                <td><a href="static/download/download_protein\PTM_Carya_cathayensis.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Chlamydomonas reinhardtii</i></td>
                                <td><a href="static/download/download_protein\PTM_Chlamydomonas_reinhardtii.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Dendranthema grandiforum</i></td>
                                <td><a href="static/download/download_protein\PTM_Dendranthema_grandiforum.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Dendrobium officinale</i></td>
                                <td>
                                    <a href="static/download/download_protein\PTM_Dendrobium_officinale.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Fragaria vesca</i></td>
                                <td><a href="static/download/download_protein\PTM_Fragaria_vesca.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Glycine max</i></td>
                                <td><a href="static/download/download_protein\PTM_Glycine_max.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Gossypium hirsutum</i></td>
                                <td><a href="static/download/download_protein\PTM_Gossypium_hirsutum.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Hevea brasiliensis</i></td>
                                <td><a href="static/download/download_protein\PTM_Hevea_brasiliensis.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Jatropha curcas</i></td>
                                <td><a href="static/download/download_protein\PTM_Jatropha_curcas.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Nicotiana tabacum</i></td>
                                <td><a href="static/download/download_protein\PTM_Nicotiana_tabacum.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Oryza sativa</i></td>
                                <td><a href="static/download/download_protein\PTM_Oryza_sativa.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Paulownia tomentosa</i></td>
                                <td><a href="static/download/download_protein\PTM_Paulownia_tomentosa.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Physcomitrium patens</i></td>
                                <td>
                                    <a href="static/download/download_protein\PTM_Physcomitrium_patens.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Pisum sativum</i></td>
                                <td><a href="static/download/download_protein\PTM_Pisum_sativum.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Prunus persica</i></td>
                                <td><a href="static/download/download_protein\PTM_Prunus_persica.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Selaginella moellendorffii</i></td>
                                <td><a href="static/download/download_protein\PTM_Selaginella_moellendorffii.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Solanum lycopersicum</i></td>
                                <td>
                                    <a href="static/download/download_protein\PTM_Solanum_lycopersicum.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Taxus</i></td>
                                <td><a href="static/download/download_protein\PTM_Taxus.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Triticum aestivum</i></td>
                                <td><a href="static/download/download_protein\PTM_Triticum_aestivum.xlsx">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td><i>Vitis vinifera</i></td>
                                <td><a href="static/download/download_protein\PTM_Vitis_vinifera.xlsx">Download</a></td>
                            </tr>
                            <tr>
                                <td><i>Zea mays</i></td>
                                <td><a href="static/download/download_protein\PTM_Zea_mays.xlsx">Download</a></td>
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


