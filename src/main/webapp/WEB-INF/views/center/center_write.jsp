<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>강의 등록하기</title>
<style>
* {
   box-sizing: border-box;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   margin: 0;
   padding: 0;
}

html, body {
   height: 100%;
}

#wrap {
   min-height: 100%;
   position: relative;
}

#content {
   padding-bottom: 72px;
}

footer {
   margin-top: -72px;
   height: 72px;
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

<script>
            var valueList = [];

            function test(){
                var start = document.getElementById("startDate").value;             //기간 값 담아주고
                var end = document.getElementById("endDate").value;
                var showBox = document.getElementById("showBox");      

                var weekBoxes = document.getElementsByClassName("week");            //월화수목금 다 담아서 반복문
                var weekValues = [];                                                //체크된 값 넣을 배열 미리 생성
                for(weekBox of weekBoxes){                                          
                    if(weekBox.checked == true){                                    //체크박스가 체크 됐다면
                        weekValues.push(Number(weekBox.value));                     //미리 생성한 배열에 붙여준다(넘버형태로)
                    }
                }

                startYMD = new Date(start);                                         //달력에 찍은 날짜가 문자열로 넘어오기 때문에 데이트 타입으로 변환
                endYMD = new Date(end);
                
                var length = showBox.childNodes.length;                        //설정완료버튼 누르면 자동 리프레시 되는 코드
                
                if(length>=1){
                    for(var i = 0; i < length; i++){
                       showBox.removeChild(showBox.childNodes[0]);
                      }
                   
                }
                           
                
                var index = 0;          //각 셀렉트 박스에 붙여줄 인덱스 값

                for(var day = startYMD.getDate() ; day <= endYMD.getDate() ; day++){    //시작날짜부터 끝나는 날짜까지 반복
                    
                    var strTemp = startYMD.getFullYear() + "-" + (startYMD.getMonth() + 1) + "-" + day;     //getDate하면 day만 뽑히기때문에 앞에 년, 월 붙여준다
                    
                    var classDate = startYMD.getFullYear() + "년 " + (startYMD.getMonth() + 1) + "월 " + day + "일"; //출력용 날짜 변수
                    
                    var toDay = new Date(strTemp);                                                          //붙인 값을 다시 데이트 타입으로 변환
                    
                    if(weekValues.indexOf(toDay.getDay()) == -1){                       //weekValues배열에 toDay의 요일 값이 없다면, 즉 -1이라면
                        continue;                                                       //continue - 제끼고 다음 요일
                    }

                    var eachDay = document.createElement("div");                            //반복해서 div 박스 생성 - 하나의 날짜와 시간대
                    eachDay.setAttribute("class","row mb-2");

                    var dayBox = document.createElement("div");                          //반복해서 div 박스 생성 - 하나의 날짜
                    dayBox.setAttribute("class","col-5 font-weight-bold pt-2");
                    dayBox.style.fontSize = "Medium";

                    var timeBox = document.createElement("div");                       //반복해서 div 박스 생성 - 하나의 시간대 ,설정한 날짜를 밑에 붙이기 위해서                      
                    timeBox.setAttribute("class","col-7 text-right pt-2");
                    
                    var time = document.createElement("select");
                    time.setAttribute("id","time");
                    time.setAttribute("class","timeSelect");                             //모든 셀렉트 박스 선택하기 위해서
                    time.setAttribute("onchange","changeTime("+index+")");               //각 셀렉트 박스에 온체인지 펑션 설정

                    var time1 = document.createElement("option");

                    time1.text = "10:00";
                    time1.value = "10";

                    var time2 = document.createElement("option");

                    time2.text="13:00";
                    time2.value="13";

                    var time3 = document.createElement("option");

                    time3.text="15:00";
                    time3.value="15";
                    
                    ///테스트
                    var seats = document.createElement("input");
                    seats.setAttribute("type", "number");
                    seats.setAttribute("min", "1");
                    seats.setAttribute("class", "peopleSelect text-right ml-2");
                    seats.setAttribute("placeholder", "인원을 입력");
                    seats.setAttribute("onchange", "changePeople("+index+")");
                    
                    time.appendChild(time1);
                    time.appendChild(time2);
                    time.appendChild(time3);

                    timeBox.appendChild(time);
                    timeBox.appendChild(seats);

                    dayBox.innerText = classDate;                                            //박스안에 해당 날짜를 넣는다.
                    
                    eachDay.appendChild(dayBox);
                    eachDay.appendChild(timeBox);
                    
                    showBox.appendChild(eachDay);                                           //날짜가 담긴 박스를 밑에 쇼박스에 붙인다.
                    
                    valueList.push({"day" : toDay, "time" : 10, "people" : 1});                //배열에 day를 키로 날짜를 값으로 넣겠다.
                                                                                        //xxxx는 시간대를 설정하면 될듯

                    index++;     //반복문 돌 때마다 셀렉트 박스의 인덱스 값 증가                                                                                   
                }

            }


            function changeTime(index){
                var timeSelects = document.getElementsByClassName("timeSelect");
                var time = timeSelects[index].options[timeSelects[index].selectedIndex].value;      //각 셀렉트 박스에 선택된 옵션 값 담아준다

                valueList[index].time = time;       //배열에 들어가있는 각 셀렉트 박스의 타임 값(디폴트 10)을 선택된 옵션 값으로 바꿔준다
            }

            function changePeople(index){
                var peopleSelects = document.getElementsByClassName("peopleSelect");
                var people = peopleSelects[index].value;

                valueList[index].people = people;
            }

            function sssss(){                                                           //선택한 날짜와 시간대를 인서트 시키기 위해 보내줄 펑션
                var frm = document.createElement("form");                               //폼 생성
                frm.setAttribute("method" , "get");                                     //method는 get방식으로
                frm.setAttribute("action" , "${pageContext.request.contextPath }/center/center_write_process.do");                          //보낼 위치
                frm.setAttribute("id", "lesson")
                
                var title = document.getElementById("info_title");

                frm.appendChild(title);
                var content = document.getElementById("info_content");

                frm.appendChild(content);


                for(valueMap of valueList){                                             //위에 배열에 있는 날짜값을
                    var datt = document.createElement("input");                         //타입에 맞춰서 보낼 것
                    datt.setAttribute("type","hidden");
                    datt.setAttribute("name","lesson_date");
                    datt.setAttribute("value" , valueMap["day"]);
                    frm.appendChild(datt);                                              //폼에 인풋타입, 밸류 등 넣고
                    var timee = document.createElement("input")
                    timee.setAttribute("type","hidden");
                    timee.setAttribute("name","lesson_time");
                    timee.setAttribute("value",valueMap["time"]);
                    frm.appendChild(timee);
                    var people = document.createElement("input");
                    people.setAttribute("type", "hidden");
                    people.setAttribute("name", "lesson_people");
                    people.setAttribute("value", valueMap["people"]);
                    frm.appendChild(people);
                }



                document.body.appendChild(frm);                                         //폼을 body요소로 넣는다.
            }
            
     function submit(){
               
        sssss();
               var frm = document.getElementById("lesson");
               frm.submit();
               
            }            

        </script>
</head>
<body style="overflow-x: hidden;">
   <div id="wrap">
      <jsp:include page="../commons/include_navi.jsp"></jsp:include>

      <div id="content">
         <div class="col mt-4">
            <div class="row">
               <div class="col"></div>
               <div class="col">
                  클래스 등록 관련 이미지 넣어주기
                  <div class="col"></div>
               </div>
            </div>
         </div>
         <div class="container" role="main" style="margin-top: 5%;">
            <h2 class="text-center" style="color: #28364a">강의등록</h2>
            <div class="row">
               <div class="col-6" style="height: 55vh">
                  <div class="mb-3">
                     <label for="title">강의제목</label> <input type="text"
                        class="form-control" name="info_title" id="info_title"
                        placeholder="제목을 입력해 주세요" maxlength="200">
                  </div>
                  <div class="mb-3"></div>
                  <div class="mb-3"></div>
                  <div class="mb-3">
                     <label for="content">교육소개</label>
                     <textarea class="form-control" rows="10" name="info_content"
                        id="info_content" placeholder="소개를 입력해주세요" maxlength="4000"></textarea>
                  </div>
                  </div>                  
                  <div class="col-6 mt-4 pt-2 pb-2">
                     <div class="row">
                        <div class="col">
                           <div class="row font-weight-bold" style="color: #124b66">
                              <div class="col-6 text-left">
                                 개강 <input class="ml-2 mr-1" id="startDate" type="date">
                                 <!-- 우선 달력으로 기간 설정하고-->
                              </div>
                              <div class="col-6 text-right">
                                 종강 <input class="ml-2" id="endDate" type="date">
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="row mt-2 text-info">
                        <div class="col">
                           <div class="row">
                              <div class="col-9 mt-1">
                                 월<input class="week ml-2 mr-4" type="checkbox" value="1">
                                 <!-- 체크박스로 요일 설정 -->
                                 화<input class="week ml-2 mr-4" type="checkbox" value="2">
                                 수<input class="week ml-2 mr-4" type="checkbox" value="3">
                                 목<input class="week ml-2 mr-4" type="checkbox" value="4">
                                 금<input class="week ml-2 mr-4" type="checkbox" value="5">
                              </div>
                              <div class="col-3 text-right">
                                 <input class="btn btn-sm btn btn-outline-primary btn-block"
                                    type="button" value="설정 완료" onclick="test()">
                                 <!-- 누르면 펑션 실행 -->
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="row mt-2">
                        <div class="col">
                           <!-- 선택한 기간에 맞는 요일 출력-->
                           <div id="showBox" class="pl-2 pr-2" style="font-size:small; overflow: auto; height: 40vh; overflow-x:hidden "></div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="container">
               <div class="row mt-3 mb-3">
                  <div class="col-8"></div>
                  <div class="col-2">
                     <a
                        href="${pageContext.request.contextPath }/center/center_choice.do"
                        class="btn btn-secondary btn-md btn-block">목록으로</a>
                  </div>
                  <div class="col-2">
                     <input type="button" value="확인" onclick="submit()"
                        class="btn btn-primary btn-md btn-block">
                  </div>
               </div>
            </div>
         </div>
      </div>


      <jsp:include page="../commons/include_footer.jsp"></jsp:include>
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