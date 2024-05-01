<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>PlantEMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Plant Epigenetic Modification Sites database"/>
    <meta name="keywords" content="Plant Epigenetic Modification Sites database"/>
    <meta name="author" content="lin-group"/>

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

    <%@ include file="/pages/common/header.jsp" %>
    <style>
        .col-md-4 {
            height: 297px;
            overflow: hidden;
        }
        nav#gross2 {
            overflow: hidden;
        }
        nav#gross2 ul {
            transition: top 1s ease-in-out; /* 定义过渡效果 */
            position: relative; /* 设置相对定位，以便top属性生效 */
        }
        nav#gross2 ul li {
            cursor: pointer;
            /*position: relative; !* 设置相对定位，以便top属性生效 *!*/
        }
        nav#gross2 ul li:hover {
            background-color: #e2d707; /* 鼠标经过时的背景色 */
        }
    </style>


</head>
<body>

<div class="fh5co-loader"></div>

<div id="page">
    <!--     <div id="line" style = "width: 1170px; height: 5px; background: #33cccc;margin: 0 auto;"></div> -->
    <%@ include file="/pages/common/navigator_home.jsp" %>


    <div id="fh5co-counter" class="fh5co-counters" style="width:1170px; margin:0 auto;"
         data-stellar-background-ratio="0.5">
        <div class="overlay" style="width: 1170px;margin: 0 auto">

        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1" style="margin-top: -90px">
                    <div class="row">
                        <br>
                        <h2 style="color: #fafcfc">About <span style="color: #f39800;font-weight:bold;">PlantEMS</span>
                        </h2>
                        <p style="font-size: 22px;color:#fafcfc;text-align:justify;text-justify:inter-ideograph;">
                            PlantEMS (Plant Epigenetic Modification Sites) is an integrative database for storing,
                            analyzing and visualizing of DNA, RNA, and protein PTM (post-translational modification)
                            sites in plant. The PlantEMS provides the experimental-confirmed modification datasets in 51
                            plants from published literatures and databases. In total, 12,970,491 DNA modification sites
                            for 4 types, 23,500 RNA modification sites for 26 types, and 139,231 PTM sites for 23 types
                            are collected and integrated in the PlantEMS. The PlantEMS will become a powerful tool to
                            offer a comprehensive view of epigenetic modification in plant. </p>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="fh5co-testimonial" class="fh5co-bg-section"
         style="width: 1170px; margin: 0 auto; padding: 105px 0 16px 0;">
        <div class="container">

            <div class="row" style="margin-top:-89px">
                <div class="col-md-4" style="width: 798px;">
                    <div class="testimony text-center" style="border-top:50px solid #d08508;">

                        <h3 style="display:block; margin-top:-80px;font-weight: bold;color: white ">Major Genera Quick
                            Start</h3>
                        <nav id="gross">
                            <ul>
                                <li><a href="common/overview?species=Ananas comosus"><img
                                        src="static/plant_figure/Ananas_comosus_2.jpg" alt=""><span class="name_pic">A.comosus</span></a>
                                </li>
                                <li><a href="common/overview?species=Arabidopsis lyrata"><img
                                        src="static/plant_figure/Arabidopsis_lyrata_2.jpg" alt=""><span
                                        class="name_pic">A.lyrata</span></a></li>
                                <li><a href="common/overview?species=arabidopsis thaliana"><img
                                        src="static/plant_figure/arabidopsis_thaliana_2.jpg" alt=""><span
                                        class="name_pic">A.thaliana</span></a></li>
                                <li><a href="common/overview?species=Arachis hypogaea"><img
                                        src="static/plant_figure/Arachis_hypogaea_2.jpg" alt=""><span class="name_pic">A.hypogaea</span></a>
                                </li>
                                <li><a href="common/overview?species=Boechera stricta"><img
                                        src="static/plant_figure/Boechera_stricta_2.jpg" alt=""><span class="name_pic">B.stricta</span></a>
                                </li>
                                <li><a href="common/overview?species=Brachypodium distachyon"><img
                                        src="static/plant_figure/Brachypodium_distachyon_2.jpg" alt=""><span
                                        class="name_pic">B.distachyon</span></a></li>
                                <li><a href="common/overview?species=Brassica rapa ssp. chinensis"><img
                                        src="static/plant_figure/Brassica_rapa_ssp_chinensis_2.jpg" alt=""><span
                                        class="name_pic">B.chinensis</span></a></li>
                                <li><a href="common/overview?species=Camellia sinensis"><img
                                        src="static/plant_figure/Camellia_sinensis_2.jpg" alt=""><span class="name_pic">C.sinensis</span></a>
                                </li>
                                <li><a href="common/overview?species=Capsella rubella"><img
                                        src="static/plant_figure/Capsella_rubella_2.jpg" alt=""><span class="name_pic">C.rubella</span></a>
                                </li>
                                <li><a href="common/overview?species=Carica papaya"><img
                                        src="static/plant_figure/Carica_papaya_2.jpg" alt=""><span class="name_pic">C.papaya</span></a>
                                </li>
                                <li><a href="common/overview?species=Carya cathayensis"><img
                                        src="static/plant_figure/Carya_cathayensis_2.jpg" alt=""><span class="name_pic">C.cathayensis</span></a>
                                </li>
                                <li><a href="common/overview?species=casuarina equisetifolia"><img
                                        src="static/plant_figure/casuarina_equisetifolia_2.jpg" alt=""><span
                                        class="name_pic">C.equisetifolia</span></a></li>
                                <li><a href="common/overview?species=Chlamydomonas reinhardtii"><img
                                        src="static/plant_figure/Chlamydomonas_reinhardtii_2.jpg" alt=""><span
                                        class="name_pic">C.reinhardtii</span></a></li>
                                <li><a href="common/overview?species=Citrus sinensis"><img
                                        src="static/plant_figure/Citrus_sinensis_2.jpg" alt=""><span class="name_pic">C.sinensis</span></a>
                                </li>
                                <li><a href="common/overview?species=Cucumis sativus"><img
                                        src="static/plant_figure/Cucumis_sativus_2.jpg" alt=""><span class="name_pic">C.sativus</span></a>
                                </li>
                                <li><a href="common/overview?species=Cyanidioschyzon merolae"><img
                                        src="static/plant_figure/Cyanidioschyzon_merolae_2.jpg" alt=""><span
                                        class="name_pic">C.merolae</span></a></li>
                                <li><a href="common/overview?species=Dendranthema grandiforum"><img
                                        src="static/plant_figure/Dendranthema_grandiforum_2.jpg" alt=""><span
                                        class="name_pic">D.grandiforum</span></a></li>
                                <li><a href="common/overview?species=Dendrobium officinale"><img
                                        src="static/plant_figure/Dendrobium_officinale_2.jpg" alt=""><span
                                        class="name_pic">D.officinale</span></a></li>
                                <li><a href="common/overview?species=Dunaliella salina"><img
                                        src="static/plant_figure/Dunaliella_salina_2.jpg" alt=""><span class="name_pic">D.salina</span></a>
                                </li>
                                <li><a href="common/overview?species=Eutrema salsugineum"><img
                                        src="static/plant_figure/Eutrema_salsugineum_2.jpg" alt=""><span
                                        class="name_pic">E.salsugineum</span></a></li>
                                <li><a href="common/overview?species=fragaria vesca"><img
                                        src="static/plant_figure/fragaria_vesca_2.jpg" alt=""><span class="name_pic">F.vesca</span></a>
                                </li>
                                <li><a href="common/overview?species=Glycine max"><img
                                        src="static/plant_figure/Glycine_max_2.jpg" alt=""><span
                                        class="name_pic">G.max</span></a></li>
                                <li><a href="common/overview?species=Gossypium hirsutum"><img
                                        src="static/plant_figure/Gossypium_hirsutum_2.jpg" alt=""><span
                                        class="name_pic">G.hirsutum</span></a></li>
                                <li><a href="common/overview?species=Hevea brasiliensis"><img
                                        src="static/plant_figure/Hevea_brasiliensis_2.jpg" alt=""><span
                                        class="name_pic">H.brasiliensis</span></a></li>
                                <li><a href="common/overview?species=Hordeum vulgare"><img
                                        src="static/plant_figure/Hordeum_vulgare_2.jpg" alt=""><span class="name_pic">H.vulgare</span></a>
                                </li>
                                <li><a href="common/overview?species=Jatropha curcas"><img
                                        src="static/plant_figure/Jatropha_curcas_2.jpg" alt=""><span class="name_pic">J.curcas</span></a>
                                </li>
                                <li><a href="common/overview?species=Linum usitatissimum"><img
                                        src="static/plant_figure/Linum_usitatissimum_2.jpg" alt=""><span
                                        class="name_pic">L.usitatissimum</span></a></li>
                                <li><a href="common/overview?species=Malus domestica"><img
                                        src="static/plant_figure/Malus_domestica_2.jpg" alt=""><span class="name_pic">M.domestica</span></a>
                                </li>
                                <li><a href="common/overview?species=Manihot esculenta"><img
                                        src="static/plant_figure/Manihot_esculenta_2.jpg" alt=""><span class="name_pic">M.esculenta</span></a>
                                </li>
                                <li><a href="common/overview?species=Medicago truncatula"><img
                                        src="static/plant_figure/Medicago_truncatula_2.jpg" alt=""><span
                                        class="name_pic">M.truncatula</span></a></li>
                                <li><a href="common/overview?species=Micromonas pusilla"><img
                                        src="static/plant_figure/Micromonas_pusilla_2.jpg" alt=""><span
                                        class="name_pic">M.pusilla</span></a></li>
                                <li><a href="common/overview?species=Musa acuminata"><img
                                        src="static/plant_figure/Musa_acuminata_2.jpg" alt=""><span class="name_pic">M.acuminata</span></a>
                                </li>
                                <li><a href="common/overview?species=Nicotiana tabacum"><img
                                        src="static/plant_figure/Nicotiana_tabacum_2.jpg" alt=""><span class="name_pic">N.tabacum</span></a>
                                </li>
                                <li><a href="common/overview?species=oryza sativa"><img
                                        src="static/plant_figure/oryza_sativa_2.jpg" alt=""><span class="name_pic">o.sativa</span></a>
                                </li>
                                <li><a href="common/overview?species=Paulownia tomentosa"><img
                                        src="static/plant_figure/Paulownia_tomentosa_2.png" alt=""><span
                                        class="name_pic">P.tomentosa</span></a></li>
                                <li><a href="common/overview?species=Phaseolus vulgaris"><img
                                        src="static/plant_figure/Phaseolus_vulgaris_2.jpg" alt=""><span
                                        class="name_pic">P.vulgaris</span></a></li>
                                <li><a href="common/overview?species=Physcomitrium patens"><img
                                        src="static/plant_figure/Physcomitrium_patens_2.jpg" alt=""><span
                                        class="name_pic">P.patens</span></a></li>
                                <li><a href="common/overview?species=Pisum sativum"><img
                                        src="static/plant_figure/Pisum_sativum_2.jpg" alt=""><span class="name_pic">P.sativum</span></a>
                                </li>
                                <li><a href="common/overview?species=Populus trichocarpa"><img
                                        src="static/plant_figure/Populus_trichocarpa_2.jpg" alt=""><span
                                        class="name_pic">P.trichocarpa</span></a></li>
                                <li><a href="common/overview?species=Prunus persica"><img
                                        src="static/plant_figure/Prunus_persica_2.jpg" alt=""><span class="name_pic">P.persica</span></a>
                                </li>
                                <li><a href="common/overview?species=rosa chinensis"><img
                                        src="static/plant_figure/rosa_chinensis_2.jpg" alt=""><span class="name_pic">r.chinensis</span></a>
                                </li>
                                <li><a href="common/overview?species=Selaginella moellendorffii"><img
                                        src="static/plant_figure/Selaginella_moellendorffii_2.JPG" alt=""><span
                                        class="name_pic">S.moellendorffii</span></a></li>
                                <li><a href="common/overview?species=Setaria italica"><img
                                        src="static/plant_figure/Setaria_italica_2.jpg" alt=""><span class="name_pic">S.italica</span></a>
                                </li>
                                <li><a href="common/overview?species=Setaria viridis"><img
                                        src="static/plant_figure/Setaria_viridis_2.jpg" alt=""><span class="name_pic">S.viridis</span></a>
                                </li>
                                <li><a href="common/overview?species=Solanum lycopersicum"><img
                                        src="static/plant_figure/Solanum_ lycopersicum_2.jpg" alt=""><span
                                        class="name_pic">S. lycopersicum</span></a></li>
                                <li><a href="common/overview?species=Solanum tuberosum"><img
                                        src="static/plant_figure/Solanum_tuberosum_2.jpg" alt=""><span class="name_pic">S.tuberosum</span></a>
                                </li>
                                <li><a href="common/overview?species=Sorghum bicolor"><img
                                        src="static/plant_figure/Sorghum_bicolor_2.jpg" alt=""><span class="name_pic">S.bicolor</span></a>
                                </li>
                                <li><a href="common/overview?species=Taxus"><img src="static/plant_figure/Taxus_2.jpg"
                                                                                 alt=""><span
                                        class="name_pic">Taxus</span></a></li>
                                <li><a href="common/overview?species=Triticum aestivum"><img
                                        src="static/plant_figure/Triticum_aestivum_2.jpg" alt=""><span class="name_pic">T.aestivum</span></a>
                                </li>
                                <li><a href="common/overview?species=Vitis vinifera"><img
                                        src="static/plant_figure/Vitis_vinifera_2.jpg" alt=""><span class="name_pic">V.vinifera</span></a>
                                </li>
                                <li><a href="common/overview?species=Zea mays"><img
                                        src="static/plant_figure/Zea_mays_2.jpg" alt=""><span
                                        class="name_pic">Z.mays</span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>

                <div class="col-md-4" style="width: 372px">
                    <div class="testimony text-center" style="border-top:50px solid #d08508;">
                        <!-- <span class="icon"><i class="icon-bubble3"></i></span> -->
                        <h3 style="display:block; margin-top:-80px;font-weight: bold;color: white ">News and
                            Updates</h3>
                        <blockquote>

                            <nav id="gross2">
                                <ul style="color:#0f6c27; font-family: sans-serif;text-align:justify;font-size: 16px;"  id="marqueeList">
                                    <li>PlantEMS is online (2021.07.01)</li>
                                    <li>PlantEMS Updated (2021.09.01)</li>
                                    <li>PlantEMS Updated (2021.12.01)</li>
                                    <li>PlantEMS Updated (2022.03.01)</li>
                                    <li>PlantEMS Updated (2022.06.01)</li>
                                    <li>PlantEMS Updated (2022.09.01)</li>
                                    <li>PlantEMS Updated (2022.12.01)</li>
                                    <li>PlantEMS Updated (2023.03.01)</li>
                                    <li>PlantEMS Updated (2023.06.01)</li>
                                    <li>PlantEMS Updated (2023.09.01)</li>
                                    <li>PlantEMS Updated (2023.12.01)</li>
                                    <li>PlantEMS Updated (2024.03.01)</li>
                                </ul>
                            </nav>
                        </blockquote>
<%--                        <span class="user">&mdash; <a href="#" style="color:#0f6c27;">More</a></span>--%>
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

                </p>
            </div>
        </div>
    </footer>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
</div>


<script>
    window.onload = function() {
        var marqueeList = document.getElementById("marqueeList");
        var intervalId;

        // 定义滚动函数
        function startMarquee() {
            var top = 0;
            var lineHeight = marqueeList.children[0].offsetHeight;
            intervalId = setInterval(function() {
                top -= 30;
                if (top < -lineHeight) {
                    top = 0;
                    marqueeList.appendChild(marqueeList.children[0]);
                }
                marqueeList.style.top = top + "px";
            }, 1000);
        }

        // 开始滚动
        startMarquee();

        // 鼠标悬停时停止滚动
        marqueeList.addEventListener("mouseenter", function() {
            clearInterval(intervalId);
        });

        // 鼠标移出时继续滚动
        marqueeList.addEventListener("mouseleave", function() {
            startMarquee();
        });
    };
</script>
</body>
</html>
