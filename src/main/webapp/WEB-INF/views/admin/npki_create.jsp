<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <meta name="description" content="">
 <meta name="author" content="">
<title>Insert title here</title>

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
   integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
   crossorigin="anonymous"></script>

<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

 <!-- Custom fonts for this template-->
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
 
  <link href="${path }/resources/css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript">


var blink = true;
function doBlink() {
    var used = document.getElementsByClassName("used");
   // used.setAttribute("style","opacity");
  
   if(used.length%2!=0){
     for(x of used){
    if(blink!=false){
       x.style.opacity = '1';
       blink = false
       
  }else{
     x.style.opacity = '0.5';
     blink = true
  }
     }
  } else{
     for(var i=0; i<used.length; i++){
        if(blink!=false){
           var eachUsed = used.item(i);
           eachUsed.style.opacity = '1';
          blink = false
       
  }else{
     var eachUsed = used.item(i);
     eachUsed.style.opacity = '0.5';
     blink = true
  } 

     }
     if(blink!=false){
        blink=false;
     }else{
        blink=true;
     }
  }
}
function startBlink() {  
    setInterval(doBlink, 500);
}

</script>
  

</head>
<body id="page-top" onload="startBlink()">
<!-- Page Wrapper -->
  <div id="wrapper">
   
   <jsp:include page="../commons/admin_sidebar.jsp"></jsp:include>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

    <jsp:include page="../commons/admin_navi.jsp"></jsp:include>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">회원관리</h1>

               <ol class="breadcrumb">

                  <li class="breadcrumb-item active">
                  <a href="${path}/admin/member_control.do">입주민 회원<span class="sr-only">(current)</span>
                  </a></li>
                  <li class="breadcrumb-item "><a href="${path}/admin/center_control.do">센터 회원</a></li>
                  <li class="breadcrumb-item "><a href="${path}/admin/npki_create.do">인증 키 관리</a></li>
                  
               </ol>

               <div class="card border-left-primary shadow my-5" >
                 <div class="card-body p-5" >
                 
                 <form action="${path}/admin/npki_create_process.do" method="get">
                 <div class="row">
                    <div class="col-2">
                    <select class="form-control" name="npki_type">
                       <option value="member" <c:if test="${npki_type.equals('member') }">selected="selected"</c:if>>입주민</option>
                       <option value="center" <c:if test="${npki_type.equals('center') }">selected="selected"</c:if>>센터</option>
                    </select>       
                    </div>
                    <div class="col-3">
                       <input class="form-control" type="text" placeholder="생성할 인증키를 입력하세요." name="npki_key" value="">                   
                    </div>
                    <div class="col-2">
                       <input class="btn btn-primary" type="submit" value="생성" onclick="alert('생성되었습니다.');">
                    </div>
                    <div class="col-5"></div>
                 </div>
                 </form>
                 <br><br>
                 
                 <div class="row">
                 <!-- 입주민 인증키 -->
                    <div class="col" style="height: 60vh; overflow: auto;">
                        <table class="table table-hover">
                        <thead>
                            <tr>
                                
                                <th>입주민 인증키</th> 
                                <th></th>                       
                                
                                
                            </tr>
                        </thead>
                        
                        <!-- 사용중 -->
                        <tbody>
                        <c:forEach items="${memberNpki}" var="member">
                       
                              <tr>                               
                                <td>${member.npki_key }</td>  
                                <td onload="startBlink()" class="used" style="opacity: inherit;"><font color="#FA5858">사용중</font></td>                              
                               
                            </tr>
                          
                        </c:forEach>
                      <!--  
                        
                        </tbody>
                    </table>
                    
                    
                    <!-- 미사용 -->
                     <!--
                    <table class="table table-hover">
                      
                        
                        <tbody> -->
                        <c:forEach items="${memberUnusedNpki}" var="memberUnused">
                       
                              <tr>                               
                                <td>${memberUnused.npki_key }</td>                                
                               
                            </tr>
                         
                        </c:forEach>
                        
                        
                        </tbody>
                    </table>
                    
                       
                    </div>
                    <!-- 센터 인증키 -->
                    <!-- 사용중 -->
                    <div class="col" style="height: 60vh; overflow: auto;">
                       <table class="table table-hover pb-2">
                        <thead>
                            <tr>
                                
                                                       
                                <th>센터 인증키</th>
                                <th></th>
                                
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${centerNpki}" var="center">
                       
                              <tr>                               
                                <td>${center.npki_key }</td>
                                <td onload="startBlink()" class="used" style="opacity: inherit;"><font color="#FA5858">사용중</font></td>                                                                    
                            </tr>
                         
                        </c:forEach>
                        
                      
                        <c:forEach items="${centerUnusedNpki}" var="centerUnused">
                       
                              <tr>                               
                                <td>${centerUnused.npki_key }</td>                                
                               
                            </tr>
                         
                        </c:forEach>
                        </tbody>
                    </table>          
                      
                 </div>
                
                    
                    
                    
                    
                 
                 </div>
             </div>
             
                                
           
        </div>
            
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
     <jsp:include page="../commons/admin_footer.jsp"></jsp:include>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
 </div>

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>



  <!-- Bootstrap core JavaScript-->
  <script src="${path }/resources/js/jquery.min.js"></script>
  <script src="${path }/resources/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${path }/resources/js/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${path }/resources/js/sb-admin-2.min.js"></script>



<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
   integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
   crossorigin="anonymous"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
   crossorigin="anonymous"></script>


</body>
</html>