<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <div class="container ml-2 p-2">
        <div class="d-flex flex-row">Product List ::</div>
        <hr>
        <c:forEach items="${products}" var="p" varStatus="vs">
            <div class="row">
                <div class="col-1">${vs.count + (page-1)*pageSize})</div>
                <div class="col-4"> ${p.productCode}: ${p.productName}</div>
                <div class="col-1"> ${p.productScale}</div>
                <div class="col-1" style="text-align: right">${p.price}</div>
            </div>
        </c:forEach>
        <hr>
        <div class="d-flex flex-row">
            <div>page: </div>
            <c:forEach begin="1" end="${itemCount/pageSize + (itemCount%pageSize>0?1 :0)}" varStatus="vs">
                <c:choose>
                    <c:when test="${vs.count==page}">
                        <div class="p-1 text-danger">[${vs.count}]</div>
                    </c:when>
                    <c:otherwise>
                        <div class="p-1">
                            <a href="product-list?pageSize=${pageSize}&page=${vs.count}">[${vs.count}]</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
