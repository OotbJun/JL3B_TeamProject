<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>나의 예약 내역</title>
<style type="text/css">
* {
box-sizing: border-box;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
margin: 0;
   padding: 0;
}
html,body{
height:100%;
}
#wrap{
min-height: 100%;
position: relative;
}
#content{
margin-bottom: 72px;
}
footer{
margin-top:-72px;
height : 72px;
bottom: 0;
left: 0;
right: 0;
}
#nav li {
   display: inline;
}

#nav a {
   display: inline-block;
   padding: 10px;
}
</style>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">

//삭제 확인
function delete_btn(){
      if(confirm("강의를 삭제하시겠습니까?")==true){
        document.getElementById("lesson_delete").submit();
         alert("정상적으로 처리 되었습니다."); 
      }
   }

//전체 선택
function cAll() {
        if ($("#checkAll").is(':checked')) {
            $("input[type=checkbox]").prop("checked", true);
        } else {
            $("input[type=checkbox]").prop("checked", false);
        }
}

$('#exampleModal').on('show.bs.modal', function (event) {
     var button = $(event.relatedTarget) // Button that triggered the modal
     var recipient = button.data('whatever') // Extract info from data-* attributes
     // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
     // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
     var modal = $(this)
     modal.find('.modal-title').text('New message to ' + recipient)
     modal.find('.modal-body input').val(recipient)
   })
</script>
  
</head>
<body>
<div id="wrap">
   <jsp:include page="../commons/include_navi.jsp"></jsp:include>

   <div id="content">
<div class="container" style="margin-top:5%">
   
   <h2 class="mt-4 mb-3">나의 클래스 예약 내역
   <small></small>
   </h2>
   <hr> 
   
   <ol class="breadcrumb">
   
   <li class="breadcrumb-item active">
         <a href="${path}/member/mypage.do">회원 정보<span class="sr-only">(current)</span></a>
      </li>
      <li class="breadcrumb-item active">
         <a href="${path}/member/mylesson.do">예약 내역<span class="sr-only">(current)</span></a>
      </li>
      <li class="breadcrumb-item ">
      <c:if test="${!empty sessionUser }">
         <a href="${path}/member/mywrite.do">내가 쓴 글 확인하기</a>
      </c:if>   
      </li>   
   </ol>
   <div class="container mt-5">
      <div class="row">
         <div class="col-1"></div>
         <div class="col">
         
         <form action="my_reserve_delete.do" id="lesson_delete">
            <div class="row">
               <div class="col" style="padding-right: 0;">
               <section id ="writedcontent">
               <ul style="list-style: none;"  >
               <li style="float: left;">
               <div class="allCheck" >
               
               </div>
               </li>
               <li style="margin-left: 87%;">
               <div class="delBtn text-right">
               <input type="button" class="selectDelte_btn btn btn-outline-danger btn-sm" id="delete" value="선택 취소" onclick="delete_btn()">
               </div>
               </li>
               </ul>
               </section>
               </div>
               
                  <table class="table table-hover text-center">
                     <thead style="font-size: small">
                        <tr>
                           <th><input type="checkbox" name="checkAll" id="checkAll" onclick="cAll()"></th>
                           <th>클래스명</th>
                           <th>강의</th>
                           <th>강의 날짜</th>
                           <th>강의 시간</th>
                           <th>후기작성</th>
                        </tr>
                     </thead>
                     <!-- 자유게시판 리스트 -->
                     <tbody style="border-bottom: medium solid; border-bottom-color: #f4f4f4">
                       
                        <c:forEach items="${myLessonList }" var="Lesson">
                           <tr class="text-center">
                             <td><div class="checkBox">
                              <input type="checkbox" name="lesson_no" class="chBox" value="${Lesson.LESSON_NO}">
                              </div></td>
                              <td>${Lesson.CENTER_NAME}</td>
                               <td>${Lesson.INFO_TITLE}</td>
                              <td><fmt:formatDate value="${Lesson.LESSON_DATE}" pattern="yy.MM.dd"/></td>
                              <td>${Lesson.LESSON_TIME}시</td>
                              <td><button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">후기작성 하러가기</button></td>
                           </tr>
                           <input type="hidden" value="${Lesson.LESSON_PEOPLE }" name="lesson_people">
                       </c:forEach>
                       
                     </tbody>
                  </table>
                  <input type="hidden" value="${sessionUser.member_no }" name="member_no">
               </div>
              </form> 
            </div>
            <div class="col-1">
            </div>
         </div>
         <div class="col-1">
         </div>
      </div>
   </div>
   </div>
   <!-- 모달창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">강의리뷰 작성하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="${pageContext.request.contextPath }/center/review_write_process.do">
          <div class="form-group">
            <label for="message-text" class="col-form-label">리뷰쓰기</label>
            <textarea class="form-control" id="message-text" name="review_comment"></textarea>
          </div>
         <c:forEach items="${myLessonList}" var="Lesson">
         <input type="hidden" value="${Lesson.LESSON_NO}" name="lesson_no">
          <input type="hidden" value="${Lesson.CENTER_NO}" name="center_no">
           </c:forEach>
           
           
         <input type="submit" value="리뷰남기기" class="btn btn-primary btn-md btn-block">
         <input type="button" class="btn btn-secondary btn-lg btn-block" data-dismiss="modal" value="돌아가기">
      </form>
      </div>
    </div>
  </div>
</div>
</div>
      <jsp:include page="../commons/include_footer.jsp"></jsp:include>
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