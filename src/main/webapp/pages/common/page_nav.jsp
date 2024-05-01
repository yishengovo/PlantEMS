<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/12
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="page_nav">
    <c:if test="${page.pageNo>1}">
        <a href="${pageScope.baseHref}${page.url}&pageNo=1">first</a>
        <a href="${pageScope.baseHref}${page.url}&pageNo=${page.pageNo-1}">previous</a>
    </c:if>
    <%--分页显示页码功能：显示连续5个页码，当前的在最中间，点击可以跳转--%>
    <c:choose>
        <%--情况1：总页面小于等于5的时候，页码的范围1-5--%>
        <c:when test="${page.pageTotal<=5}">
            <c:set var="begin" value="1"/>
            <c:set var="end" value="${page.pageTotal}"/>
        </c:when>
        <%--情况2：总页码数大于5的时候--%>
        <c:when test="${page.pageTotal>5}">
            <c:choose>
                <%--小情况1：当前页码为1-3，页码范围为1-5--%>
                <c:when test="${page.pageNo<=3}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="5"/>
                </c:when>
                <%--小情况2：当前页码为总页码减2到总页码时，页码范围为总页码减4到总页码--%>
                <c:when test="${page.pageNo>=(page.pageTotal-2)}">
                    <c:set var="begin" value="${page.pageTotal-4}"/>
                    <c:set var="end" value="${page.pageTotal}"/>
                </c:when>
                <%--小情况3：不再上面两种小情况上，页码范围为当前页码减2到当前页码+2--%>
                <c:otherwise>
                    <c:set var="begin" value="${page.pageNo-2}"/>
                    <c:set var="end" value="${page.pageNo+2}"/>
                </c:otherwise>
            </c:choose>
        </c:when>
    </c:choose>

    <c:forEach begin="${begin}" end="${end}" var="i">
        <c:if test="${page.pageNo==i}">
            【${i}】
        </c:if>
        <c:if test="${page.pageNo!=i}">
            <a href="${pageScope.baseHref}${page.url}&pageNo=${i}">${i}</a>
        </c:if>
    </c:forEach>


    <c:if test="${page.pageNo < page.pageTotal}">
        <a href="${pageScope.baseHref}${page.url}&pageNo=${page.pageNo+1}">next</a>
        <a href="${pageScope.baseHref}${page.url}&pageNo=${page.pageTotal}">last</a>
    </c:if>
    Total ${page.pageTotal} pages, ${page.pageTotalCount} records, go to page
    <input value="${param.pageNo}" name="pn" id="pn_input" style="width: 40px"/>
    <input id="searchBut" type="button" value="Confirm">
    <%--给搜索跳转框绑定单击事件--%>
    <script type="text/javascript">
        $(function () {

            $("#searchBut").click(function () {
                /*获取输入框里面的内容*/
                var pageNo = $("#pn_input").val();
                var pageTotal = ${page.pageTotal};
                if (pageNo < 1) {
                    alert("Please enter an integer greater than 0!");
                } else if (pageNo > pageTotal) {
                    alert("Please enter the appropriate number of pages!");
                } else {
                    /*JS中有个location对象，属性href可以获得浏览器页面的地址栏
                    * 也可以进行赋值（就是跳转到值对应的页面）*/
                    location.href = "${pageScope.baseHref}${page.url}&pageNo=" + pageNo;
                }
            });
        });
    </script>
</div>
