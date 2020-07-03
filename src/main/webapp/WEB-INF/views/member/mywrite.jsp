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
<title>Insert title here</title>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
</head>

<body>
<jsp:include page="../commons/include_navi.jsp"></jsp:include>

<div class="container" style="margin-top:5%">
   
   <h2 class="mt-4 mb-3">내가 쓴글 
   <small></small>
   </h2>
   <hr> 
   <ol class="breadcrumb">
      <li class="breadcrumb-item active">
         <a href="${path}/member/mywrite.do">자유게시판<span class="sr-only">(current)</span></a>
      </li>
      <li class="breadcrumb-item "><a href="${path}/member/myidea.do">청원게시판</a>
      </li>
      <li class="breadcrumb-item ">
         <a href="${path}/member/mywrite.do">댓글</a>
      </li>   
   </ol>
   <div class="container mt-5">
      <div class="row">
         <div class="col-1"></div>
         <div class="col">
            <div class="row">
               <div class="col">
               <section id ="content">
               <ul style="list-style: none;"  >
               <li style="float: left;">
               <div class="allCheck" >
               <input type="checkbox" name="allCheck" id="allCheck">
                <label for="allCheck">모두 선택</label> 
                <script>
                   $("#allCheck").click(function(){
                      var chk = $("#allCheck").prop("checked");
                      if(chk) {
                       $(".chBox").prop("checked", true);
                      } else {
                       $(".chBox").prop("checked", false);
                      }
                  });
                </script>
               </div>
               </li>
               <li style="margin-left: 87%;">
               <div class="delBtn">
               <input type="button" class="selectDelte_btn" id="delete" value="선택삭제">
               <script>
                $(".selectDelte_btn").click(function(){
                     var confirm_val = confirm("정말 삭제하시겠습니까?");
        
                 if(confirm_val) {
                        var checkArr = new Array();
      
                  $("input[class='chBox']:checked").each(function(){
                         checkArr.push($(this).attr("data-boardno"));
                        });
       
                     $.ajax({
                           url : "${pageContext.request.contextPath }/board/my_board_delete.do",
                             type : "post",
                           data : { chbox : checkArr },
                              success : function(){
                             location.href = "${pageContext.request.contextPath }/member/mywrite.do";
                            }
                         });
                       } 
                   });
               </script>
               </div>
               </li>
               </ul>
               </section>
               </div>
                  <table class="table table-hover text-center">
                     <thead style="font-size: small">
                        <tr>
                           <td>글선택</td>
                           <td>글내용</td>
                           <td>작성자</td>
                           <td>작성일</td>
                           <td>글삭제</td>
                        </tr>
                     </thead>
                     <!-- 자유게시판 리스트 -->
                     <tbody>
                        <c:forEach items="${myBoardList}" var="boardList">
                           <tr class="text-center">
                              <td><div class="checkBox">
                              <input type="checkbox" name="chBox" class="chBox" data-boardno="${boardList.boardVo.board_no}">
                              <script>
                               $(".chBox").click(function(){
                                   $("#allCheck").prop("checked", false);
                                   });
                                 </script>
                              </div></td>
                              <td class="text-left pl-1" style="overflow:hidden; text-overflow: ellipsis; max-width: 506px"><a
                                 href="${pageContext.request.contextPath}/board/board_read.do?board_no=${boardList.boardVo.board_no}&currPage=${currPage }">${boardList.boardVo.board_title}
                                    <c:if test="${boardList.replyCount > 0 }">
                                    (${boardList.replyCount })</c:if>
                              </a></td>
                              <td>${boardList.memberVo.member_rname}</td>
                              <td><fmt:formatDate
                                    value="${boardList.boardVo.board_wdate}"
                                    pattern="yy.MM.dd hh:mm:ss" /></td>
                              <td><button type="button" class="delete_${boardList.boardVo.board_no}_btn" data-boardno="${boardList.boardVo.board_no}">삭제</button>
                                          
                        <script>
                               $(".delete_${boardList.boardVo.board_no}_btn").click(function(){
                              var confirm_val = confirm("정말 삭제하시겠습니까?");
        
                               if(confirm_val) {
                                     var checkArr = new Array();
                               
                                     checkArr.push($(this).attr("data-boardno"));
       
                              $.ajax({
                                 url : "${pageContext.request.contextPath }/board/my_board_delete.do",
                                   type : "post",
                              data : { chbox : checkArr },
                                    success : function(){
                                   location.href = "${pageContext.request.contextPath }/member/mywrite.do";
                                  }
                               });
                             } 
                            });
                        </script>
                              
                              </td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>
            <div class="col-1">
            </div>
         </div>
         <div class="col-1">
         </div>
      </div>
   </div>
      <jsp:include page="../commons/include_footer.jsp"></jsp:include>
</body>
</html>