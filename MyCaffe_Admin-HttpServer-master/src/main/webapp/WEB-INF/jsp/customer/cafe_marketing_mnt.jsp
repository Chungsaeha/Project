<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Page title -->
    <title>MyCaffe Admin WebApp</title>

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <!--<link rel="shortcut icon" type="image/ico" href="favicon.ico" />-->

    <!-- Vendor styles -->
    <link rel="stylesheet" href="<c:url value="/resources/vendor/fontawesome/css/font-awesome.css"/>" />
    <link rel="stylesheet" href="<c:url value="/resources/vendor/metisMenu/dist/metisMenu.css"/>" />
    <link rel="stylesheet" href="<c:url value="/resources/vendor/animate.css/animate.css"/>" />
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap/dist/css/bootstrap.css"/>" />
    <link rel="stylesheet" href="<c:url value="/resources/vendor/datatables.net-bs/css/dataTables.bootstrap.min.css"/>" />

    <!-- App styles -->
    <link rel="stylesheet" href="<c:url value="/resources/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css"/>" />
    <link rel="stylesheet" href="<c:url value="/resources/fonts/pe-icon-7-stroke/css/helper.css"/>" />
    <link rel="stylesheet" href="<c:url value="/resources/styles/style.css"/>" />

</head>
<body class="fixed-navbar fixed-sidebar">

<!-- Simple splash screen-->
<div class="splash"> <div class="color-line"></div><div class="splash-title"><h1>MyCaffe - Smart Cafe Service</h1><p>Special Admin Theme for small and medium webapp with very clean and aesthetic style and feel. </p><div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>
<!--[if lt IE 7]>
<p class="alert alert-danger">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<%@ include file="/WEB-INF/jsp/include/include_header.jspf" %>
<%@ include file="/WEB-INF/jsp/include/include_navigation.jspf" %>

<!-- Main Wrapper -->
<div id="wrapper">

    <div class="content animate-panel">
        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel">
                    <div class="panel-heading">
                        <div class="panel-tools">
                            <a class="showhide"><i class="fa fa-chevron-up"></i></a>
                        </div>
                        공지사항 관리
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="tableTimeSaleBoard">
                                <thead>
                                <tr>
                                    <th>시간대</th>
                                    <th>메뉴</th>
                                    <th>가격</th>
                                    <th>진행 상태</th>
                                    <th>이벤트 마감/다시하기</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                	<c:when test="${fn:length(list) > 0}">
                                		<c:forEach items="${list }" var="row">
                                			<tr>
                                    			<td>${row.marketingTimeZone }:00 정각</td>
                                    			<td>${row.menuName }</td>
                                    			<td>${row.menuPrice } 원(￦)</td>
                                    			<td>
                                    			<c:choose>
                                    				<c:when test="${row.marketingFlag == 1 }">
                                    				<i class="fa fa-check text-success"></i>
                                    				</c:when>
                                    				<c:otherwise>
                                    				<i class="fa fa-times text-navy"></i>
                                    				</c:otherwise>
                                    			</c:choose>
                                    			</td>
                                    			<td>
                                    			<c:choose>
                                    				<c:when test="${row.marketingFlag == 1 }">
                                    				<a href="#this" name="terminate"> 마감하기</a>
                                    				<input type="hidden" id="marketingIDX" value="${row.marketingIDX }">
                                    				</c:when>
                                    				<c:otherwise>
                                    				<a href="#this" name="restart"> 이벤트 다시하기</a>
                                    				<input type="hidden" id="marketingIDX" value="${row.marketingIDX }">
                                    				</c:otherwise>
                                    			</c:choose>
                                    			</td>
                                			</tr>
                                		</c:forEach>
                                	</c:when>
                                	<c:otherwise>
                                		<tr>
                        					<td colspan="5">등록된 이벤트가 없습니다.</td>
                    					</tr>
                                	</c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                            <br/>
                            <a href="<c:url value='/customer/openCafeMarketingWrite.do' />" id="write"><button type="button" class="btn w-xs btn-primary">등록</button></a>
                        </div>
                    </div>
                </div>
            </div>
		</div>
    </div>

    <!-- Footer-->
    <footer class="footer">
        <span class="pull-right">
            <strong>MyCaffe</strong> - Smart Cafe Service
        </span>
        2016 Copyright &copy; Glory
    </footer>

</div>

<form id="commonForm" name="commonForm"></form>

<!-- Vendor scripts -->
<script src="<c:url value="/resources/vendor/jquery/dist/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/jquery-ui/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/slimScroll/jquery.slimscroll.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/dist/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/jquery-flot/jquery.flot.js"/>"></script>
<script src="<c:url value="/resources/vendor/jquery-flot/jquery.flot.resize.js"/>"></script>
<script src="<c:url value="/resources/vendor/jquery-flot/jquery.flot.pie.js"/>"></script>
<script src="<c:url value="/resources/vendor/flot.curvedlines/curvedLines.js"/>"></script>
<script src="<c:url value="/resources/vendor/jquery.flot.spline/index.js"/>"></script>
<script src="<c:url value="/resources/vendor/metisMenu/dist/metisMenu.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/iCheck/icheck.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/peity/jquery.peity.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/sparkline/index.js"/>"></script>

<!-- DataTables -->
<script src="<c:url value="/resources/vendor/datatables/media/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables.net-bs/js/dataTables.bootstrap.min.js"/>"></script>

<!-- DataTables buttons scripts -->
<script src="<c:url value="/resources/vendor/pdfmake/build/pdfmake.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/pdfmake/build/vfs_fonts.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables.net-buttons/js/buttons.html5.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables.net-buttons/js/buttons.print.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables.net-buttons/js/dataTables.buttons.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"/>"></script>

<!-- App scripts -->
<script src="<c:url value="/resources/scripts/homer.js"/>"></script>
<script src="<c:url value="/resources/scripts/charts.js"/>"></script>
<script src="<c:url value="/resources/scripts/commons.js"/>"></script>

<script>
     
    $(document).ready(function(){
    	
    	// Initializ Table
        $('#tableTimeSaleBoard').dataTable( {
        	"order": [[ 0, "desc" ]]
        } );
    	
    	$("#write").on("click", function(e){ //등록 버튼
            e.preventDefault();
        }); 
    	
        $("a[name='terminate']").on("click", function(e){ //제목 
            e.preventDefault();
            fn_terminateMarketing($(this));
        });
        
        $("a[name='restart']").on("click", function(e){ //제목 
            e.preventDefault();
            fn_restartMarketing($(this));
        });
    });

    function fn_terminateMarketing(obj){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/customer/terminateMarketing.do' />");
        comSubmit.addParam("marketingIDX", obj.parent().find("#marketingIDX").val());
        comSubmit.submit();
    }
    
    function fn_restartMarketing(obj){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/customer/restartMarketing.do' />");
        comSubmit.addParam("marketingIDX", obj.parent().find("#marketingIDX").val());
        comSubmit.submit();
    }
    
</script>

</body>
</html>