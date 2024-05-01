<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/25
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<style type="text/css">
    .active svg {
        width: 25px;
        height: 25px;
        transform: translate(0px, 7px);
    }

    .active svg path {
        fill: #0f6c27;
    }

    .active a {
        color: #0f6c27;
    }

    .other svg {
        width: 25px;
        height: 25px;
        transform: translate(0px, 7px);
    }

    .other svg path {
        fill: #515151;
    }

    .other a {
        color: #515151;
    }
</style>

<nav class="fh5co-nav" role="navigation">
    <div class="top-menu" style="padding: 7px 0;">
        <div class="container">
            <div class="row" style="height: 60px">
                <div class="col-xs-2" style="margin-top:-6px; margin-left: -15px "><img src="static/images/logo4.png">
                </div>
                <div class="col-xs-10 text-right menu-1" style="font-size: 18px;margin-top:11px;">
                    <ul>
                        <li id="home_li" class="active"><a href="index.jsp" id="home_color">
                            <svg t="1625567259766" class="icon" viewBox="0 0 1024 1024" version="1.1"
                                 xmlns="http://www.w3.org/2000/svg" p-id="3900" width="200" height="200">
                                <path d="M1024 590.432l-512-397.44-512 397.44 0-162.048 512-397.44 512 397.44zM896 576l0 384-256 0 0-256-256 0 0 256-256 0 0-384 384-288z"
                                      p-id="3901"></path>
                            </svg>
                            Home</a></li>

                        <li class="has-dropdown other">
                            <a href="#" id="browse_color">
                                <svg t="1625567424269" class="icon" viewBox="0 0 1024 1024" version="1.1"
                                     xmlns="http://www.w3.org/2000/svg" p-id="5735" width="200" height="200">
                                    <path d="M512 28.03712c-267.264 0-483.328 217.088-483.328 484.352s217.088 483.328 483.328 483.328 483.328-217.088 483.328-483.328-216.064-484.352-483.328-484.352z m-33.792 73.728v151.552H361.472c26.624-77.824 67.584-134.144 116.736-151.552z m67.584 0c50.176 17.408 90.112 74.752 116.736 151.552H545.792v-151.552z m-189.44 24.576c-24.576 34.816-46.08 77.824-62.464 126.976H186.368c44.032-56.32 102.4-100.352 169.984-126.976z m311.296 0c67.584 26.624 125.952 70.656 169.984 126.976H730.112c-16.384-49.152-37.888-92.16-62.464-126.976z m-525.312 193.536h132.096c-11.264 49.152-18.432 102.4-20.48 157.696H97.28c4.096-56.32 20.48-109.568 45.056-157.696z m198.656 0h137.216v157.696H321.536c2.048-55.296 8.192-108.544 19.456-157.696z m204.8 0h137.216c11.264 48.128 18.432 102.4 20.48 157.696H545.792v-157.696z m203.776 0h132.096c24.576 48.128 40.96 101.376 45.056 157.696H770.048c-2.048-55.296-9.216-108.544-20.48-157.696z m-652.288 225.28h156.672c2.048 55.296 9.216 108.544 20.48 157.696H142.336c-24.576-48.128-40.96-101.376-45.056-157.696z m224.256 0h156.672v157.696H340.992c-10.24-48.128-17.408-102.4-19.456-157.696z m224.256 0h156.672c-2.048 55.296-9.216 108.544-20.48 157.696H545.792v-157.696z m224.256 0h156.672c-4.096 56.32-20.48 109.568-45.056 157.696H749.568c11.264-49.152 18.432-101.376 20.48-157.696z m-584.704 225.28h107.52c16.384 49.152 37.888 92.16 62.464 128-66.56-27.648-124.928-71.68-169.984-128z m175.104 0h117.76v151.552c-50.176-17.408-90.112-73.728-117.76-151.552z m185.344 0h117.76c-27.648 77.824-67.584 134.144-117.76 151.552v-151.552z m185.344 0h107.52c-44.032 56.32-103.424 100.352-171.008 128 24.576-35.84 46.08-78.848 63.488-128z"
                                          fill="#515151" p-id="5736"></path>
                                </svg>
                                Browse</a>
                            <ul class="dropdown">
                                <li><a href="dna/getAllSpeciesAndType" style="font-size: 23px; color: #33cccc">DNA</a>
                                </li>
                                <li><a href="rna/getAllSpeciesAndType" style="font-size: 23px;color: #33cccc">RNA</a>
                                </li>
                                <li><a href="protein/getAllSpeciesAndTypeToBrowsePage"
                                       style="font-size: 23px;color: #33cccc">PTM</a></li>
                            </ul>
                        </li>

                        <li class="has-dropdown other">
                            <a href="#"<%-- style="color: #0f6c27"--%> id="search_color">
                                <svg t="1625564943360" class="icon" viewBox="0 0 1024 1024" version="1.1"
                                     xmlns="http://www.w3.org/2000/svg" p-id="3026" width="200" height="200">
                                    <path d="M930.56 749.44l-160-103.36A400.96 400.96 0 1 0 646.08 768l103.36 160a133.44 133.44 0 0 0 39.36 39.36 130.88 130.88 0 0 0 141.76-220.48zM432 704a272 272 0 1 1 272-272 272 272 0 0 1-272 272z"
                                          p-id="3027"></path>
                                </svg>
                                Search</a>
                            <ul class="dropdown">
                                <li><a href="dna/getAllSpeciesAndTypeAndChromosome"
                                       style="font-size: 23px; color: #33cccc">DNA</a></li>
                                <li><a href="rna/getAllSpeciesAndTypeAndChromosome"
                                       style="font-size: 23px;color: #33cccc">RNA</a></li>
                                <li><a href="protein/getAllSpeciesAndType"
                                       style="font-size: 23px;color: #33cccc">PTM</a></li>
                            </ul>
                        </li>
                        <li class="other"><a href="pages/other/guide.jsp" id="guide_color">
                            <svg t="1625567500224" class="icon" viewBox="0 0 1024 1024" version="1.1"
                                 xmlns="http://www.w3.org/2000/svg" p-id="7545" width="200" height="200">
                                <path d="M868.864 155.136l-301.696 784.426667-120.704-362.026667z" p-id="7546"></path>
                                <path d="M567.168 981.76c-18.090667 0-36.224-12.032-42.24-30.122667l-111.616-340.906666-343.936-114.688c-18.133333-6.016-27.178667-21.12-27.178667-39.210667 0-18.090667 9.045333-33.194667 27.178667-39.253333l784.384-301.653334c18.133333-6.058667 33.194667-2.986667 45.269333 9.045334 12.074667 12.074667 18.090667 30.165333 9.045334 45.226666l-301.653334 784.426667c-6.058667 18.133333-21.162667 27.178667-39.253333 27.178667zM208.128 453.845333l250.453333 81.493334c12.032 6.016 21.077333 15.061333 27.136 27.136l81.450667 250.410666 226.261333-582.272-585.301333 223.232z"
                                      p-id="7547"></path>
                            </svg>
                            User guide</a></li>
                        <li class="has-dropdown other"><a href="#">
                            <svg t="1625567554132" class="icon" viewBox="0 0 1024 1024" version="1.1"
                                 xmlns="http://www.w3.org/2000/svg" p-id="8363" width="200" height="200">
                                <path d="M1024 640.192C1024 782.912 919.872 896 787.648 896h-512C123.904 896 0 761.6 0 597.504 0 451.968 94.656 331.52 226.432 302.976 284.16 195.456 391.808 128 512 128c152.32 0 282.112 108.416 323.392 261.12C941.888 413.44 1024 519.04 1024 640.192z m-682.688-70.016L512 756.48l170.688-186.24H341.312z m213.376 0v-256h-85.376v256h85.376z"
                                      fill="#595959" p-id="8364"></path>
                            </svg>
                            Download</a>
                            <ul class="dropdown">
                                <li><a href="pages/dna/dnaDownload.jsp" style="font-size: 23px; color: #33cccc">DNA</a>
                                </li>
                                <li><a href="pages/rna/rnaDownload.jsp" style="font-size: 23px;color: #33cccc">RNA</a>
                                </li>
                                <li><a href="pages/protein/proteinDownload.jsp" style="font-size: 23px;color: #33cccc">PTM</a>
                                </li>
                            </ul>
                        </li>
                        <li class="other"><a href="pages/other/contact.jsp" id="contact_color">
                            <svg t="1625567629901" class="icon" viewBox="0 0 1024 1024" version="1.1"
                                 xmlns="http://www.w3.org/2000/svg" p-id="10640" width="200" height="200">
                                <path d="M512 597.332992c225.82272 0 398.222336 85.388288 398.222336 228.170752 0 61.536256-50.016256 108.33408-124.348416 108.33408h-547.74784c-74.776576 0-124.348416-45.830144-124.348416-108.33408 0-140.977152 174.35136-228.170752 398.222336-228.170752z m0 56.889344c-196.484096 0-341.332992 72.439808-341.332992 171.281408 0 30.04416 23.14752 51.44576 67.459072 51.44576h547.74784c43.726848 0 67.459072-22.20544 67.459072-51.44576 0-100.49024-142.926848-171.281408-341.332992-171.281408zM512 455.110656c94.256128 0 170.667008-76.409856 170.667008-170.665984 0-94.257152-76.41088-170.667008-170.667008-170.667008s-170.667008 76.41088-170.667008 170.667008S417.743872 455.110656 512 455.110656zM512 512c-125.67552 0-227.555328-101.879808-227.555328-227.555328S386.32448 56.889344 512 56.889344s227.555328 101.879808 227.555328 227.555328S637.67552 512 512 512z"
                                      fill="#323233" p-id="10641"></path>
                            </svg>
                            Contact</a></li>
                        <li class="other"><a href="pages/other/links.jsp" id="link_color">
                            <svg t="1625567735485" class="icon" viewBox="0 0 1024 1024" version="1.1"
                                 xmlns="http://www.w3.org/2000/svg" p-id="16418" width="200" height="200">
                                <path d="M948.205438 437.752266l-109.309164 109.309164a154.682779 154.682779 0 0 1-218.618328 0A51.560926 51.560926 0 0 1 618.731118 474.360524l145.917422-145.917422A51.560926 51.560926 0 1 0 692.978852 257.804632l-145.917422 143.854985a51.560926 51.560926 0 0 1-72.700906 0 154.682779 154.682779 0 0 1 0-218.618328l103.121853-103.121853a265.538771 265.538771 0 0 1 350.6143-23.718026 257.804632 257.804632 0 0 1 20.108761 381.550856zM547.06143 618.731118a51.560926 51.560926 0 0 0-72.700906 0l-145.917422 147.46425A51.560926 51.560926 0 1 1 257.804632 692.978852l145.917422-145.917422a51.560926 51.560926 0 0 0 0-72.700906 154.682779 154.682779 0 0 0-218.618328 0l-103.121853 103.121853a265.538771 265.538771 0 0 0-25.780463 350.6143 257.804632 257.804632 0 0 0 381.550856 18.561933l109.309164-109.309164a154.682779 154.682779 0 0 0 0-218.618328z"
                                      fill="#515151" p-id="16419"></path>
                            </svg>
                            Links</a></li>

                    </ul>
                </div>
            </div>

        </div>
    </div>
    <div class="top" style="width: 1170px; margin: 0 auto;">
        <div class="container" style="height: 50px;">
            <div class="row">
                <div class="col-xs-12 text-right" style="background: #d08508">
                    <p class="loc"><i class="icon-location4"></i>&nbsp;welcome to PlantEMS !</p>
                    <p class="num">Email: <span>hlin@uestc.edu.cn</span></p>
                </div>
            </div>
        </div>
    </div>
</nav>
