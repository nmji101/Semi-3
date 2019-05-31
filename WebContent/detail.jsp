<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>상세페이지</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!--                달력 api cdn-->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!--                /달력 api cdn-->
        <style>
            div{
                border: 1px solid rgba(0, 0, 0, 0.19);
                box-sizing: border-box;
            }
            #wrapper{
                overflow: hidden;
            }
            #topMenu{
                margin: 0px;
                padding: 0px;
                text-align: center;
            }
            #topMenu>li{
                float: left;
                list-style: none;
                width: 25%;
            }
            #contents{
                margin: auto;
                padding-top: 30px;
                padding-left: 15%;
                overflow: hidden;
            }
            #contents>div{
                float: left;
            }
            #mainContent{
                width: 600px;
            }
            #sideContent{
                width: 300px;
                /*                height: 150px;*/
                /*                position: fixed;*/
                /*                left: 60.5%;*/
                overflow: hidden;
            }
            #sideFixed{
                position: fixed;
                width: 300px;
                font-size: 12px;
            }
            #classNavi{
                overflow: hidden;
                /*                position: fixed;*/
                width: 600px;
                /*                height: 30px;*/
                background-color: white;
            }
            #clickNavi{
                margin: 0px;
                padding: 0px;
                text-align: center;
            }
            #clickNavi>li{
                float: left;
                list-style: none;
                width: 20%;
            }
            /*            요약정보*/
            #sumary{
                /*                임시 : 내용채워지는대로 자동으로 높이 생기도록하기*/
                height: 250px;
                overflow: hidden;
                /*                margin-top: 30px;*/
            }
            .class_name{
                height: 200px;
                float: left;
            }
            /*            튜터이미지 원형*/
            .class_tuImg{
                display: inline-block;
                overflow: hidden;
                border-radius: 100px;
                width: 150px;
                height: 150px;
            }
            #tutorImg{
                width: 100%;
            }
            /*            /이미지원형*/
            .class_nickname{
                text-align: center;
            }
            .class_title{
                float: left;
                height: 200px;
                width: 330px;
                overflow: hidden;
                margin-left: 20px;
            }
            .class_title>.star{
                height: 50px;
                padding-top: 15px;
                overflow: hidden;
            }
            .info>ul>li{
                float: left;
                list-style: none;
                width: 33.3%;
                text-align: center;
            }
            .info{
                overflow: hidden;
            }
            .info>ul{
                overflow: hidden;
                margin: 3px 0px;
                padding: 0px;
                border-top: 1px solid rgba(183, 38, 38, 0.51);
                border-bottom: 1px solid rgba(183, 38, 38, 0.51);
            }

            /*            /요약정보*/
            /*            튜터설명*/
            #tutorinfo{
                min-height: 500px;
            }
            /*            /튜터설명*/
            /*            수업소개*/
            #introduction{
                min-height: 500px;
            }
            /*            /수업소개*/
            #place{
                min-height: 400px;
            }
            #review{
                min-height: 500px;
            }
            .class_detail{
                padding-top: 40px;
                margin: 0px 40px;
            }
            /*            사이드 fixed 메뉴*/
            #sideTop{
                font-size: 20px;
            }
            .calendar{
                cursor: pointer;
            }
            /*            사이드 fixed 메뉴*/
            /*                임시*/
            #purchase{
                text-align: center;
                margin-top: 20px;
            }
            #purchaseBtn{
                font-size: 15px;
                background-color: rgba(77, 77, 226, 0.44);
                border-style: none;
                width: 100%;
                transition-duration: 1s;
            }
            #purchaseBtn:hover{
                background-color: rgba(77, 77, 226, 0.24);
            }
            #scdBtn{
            	background-color: transparent;
            	text-align : center;
            }
        </style>
		<!--         다음지도 api cdn -->
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9810110832de2e2124764f7bd3da339a&libraries=services"></script>
        <!--         /다음지도 api cdn -->	
        <script>
            $(function(){
                var he1 = document.getElementById("myCarousel1").scrollHeight;
                var he2 = document.getElementById("classNavi").scrollHeight;
                $(window).scroll(function() {
                    if($(this).scrollTop() > he1+he2){
                        $("#classNavi").css({ "position": "fixed", "top": "0px" });
                    }else{
                        $("#classNavi").css({ "position": "relative"});
                    }
                });
                $(".class_detail").each(function(i,item){//해당 카테고리 위치로 이동하면 일단 배경색 바꿔놓기.
                    var id = $(this).prop("id");
                    var scrollHe = document.getElementById(id).scrollHeight;
                    if($(this).scrollTop()>scrollHe){
                        //아직 미완성
                    }
                });

                //위치 지도에 표시하기 daum API이용
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = {
                        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };  

                // 지도를 생성합니다    
                var map = new daum.maps.Map(mapContainer, mapOption); 

                // 주소-좌표 변환 객체를 생성합니다
                var geocoder = new daum.maps.services.Geocoder();

                // 주소로 좌표를 검색합니다.
                //여기에 주소넣기!!!
                geocoder.addressSearch("${classInfo.info_addr}", function(result, status) {

                    // 정상적으로 검색이 완료됐으면 
                    if (status === daum.maps.services.Status.OK) {

                        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

                        // 결과값으로 받은 위치를 마커로 표시합니다
                        var marker = new daum.maps.Marker({
                            map: map,
                            position: coords
                        });

                        // 인포윈도우로 장소에 대한 설명을 표시합니다
                        var infowindow = new daum.maps.InfoWindow({
                            content: '<div style="width:150px;text-align:center;">수업 장소</div>',
                            removable : true
                        });
                        infowindow.open(map, marker);

                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        map.setCenter(coords);
                    } 
                });


			// 특정날짜들 배열
            //var disabledDays = ["2019-6-9","2019-6-24","2019-6-26"]; //내가 제외하고싶은 날짜
            var disabledDays = [];
            $(".date").each(function(i,item){
            	var closedate = new Date($(item).val());
            	var m = closedate.getMonth(), d = closedate.getDate(), y = closedate.getFullYear();
            	disabledDays.push(y + '-' +(m+1) + '-' + d);
            });
            //console.log(disabledDays);
            
            // 특정일 선택막기
            function disableAllTheseDays(date) {
                var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
                for (i = 0; i < disabledDays.length; i++) {
                    if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
                        return [false];
                    }
                }
                return [true];
            }
            function getDayLabel(day) {          
                var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
                //var day = new Date(date).getDay();
                var dayLabel = week[day]; 
                return dayLabel;
            }
            $("#scdBtn").hide();
            $("#select").hide();
				
                $(".calendar").on("click",function(){
                    var calendar = $(".calendar").text();
                    if(calendar == "달력에서 보기"){
                        $(".calendar").text("달력 접기");
                        $( "#datepicker" ).datepicker({
                            onSelect: function (dateText, inst) {
                                //alert(dateText);
                                //해당날짜의 일정불러와서 띄워주기.
                                $.ajax({
                        			url:"applicable.classInfo",
                        			type:"post",
                        			data:{ //ajax로 보낼 값
                        				classId : "${classInfo.info_classid}",
                        				check: dateText
                        			}
                        		}).done(function(resp){
                        			var checkDate = new Date(dateText) //해당날짜
                        			var m = checkDate.getMonth(), d = checkDate.getDate(), y = checkDate.getFullYear(), dy = checkDate.getDay();
                        			var dayLabel = getDayLabel(dy);
                        			var dateInfo = y+"년 "+m+"월 "+d+"일 ("+dayLabel+")";
                 			
                        			//alert(resp); //resp : 해당날짜에 현재 신청한 인원
                        			var maximumNum = "${classInfo.info_maxperson}"; //해당 클래스의 정원
                        			//alert(dateInfo); //날짜정보
                        			//alert(maximumNum); //해당클래스 정원
                        			$("#checkDate").text(dateInfo);
                        			$("#checkApplicable").text(resp+"명/"+maximumNum+"명");
                        			$("#scdBtn").show();
                        		})
                            }
                        	,showMonthAfterYear: true
                            ,dateFormat: "yy-mm-dd"
                            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] 
							,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
							,dayNamesMin: ['일','월','화','수','목','금','토']
                        	,minDate : new Date("${classInfo.info_start}") //최소날짜  포맷은 2019-5-30 , 2019/05/30 가능 
                            ,maxDate : new Date("${classInfo.info_end}") //최대날짜 
                        	,beforeShowDay: disableAllTheseDays 
                        });
                        $( "#datepicker" ).show();
                    }else{
                        $(".calendar").text("달력에서 보기");
                        $( "#datepicker" ).hide();
                    }
                });
                //여기까지 달력
                
                $("#scdBtn").on("click",function(){
                	var selectDate = $("#checkDate").text();
                	$("#selectDate").text(selectDate);
                	$("#selectInfo").prop("flag","true");
                	$("#scdBtn").hide();
                	$("#select").show();
                	//플래그 true로
                });
                
                $("#closeImg").on("click",function(){
                	$("#selectInfo").prop("flag","false");
                	$("#select").hide();
                });
                $("#purchaseBtn").click(function(){ //구매하기버튼눌렀을때
                	if($("#selectInfo").prop("flag")=="false"){
                		alert("상품을 선택해주세요");
                		return;
                	}
                	
                });
  
                
            });
        </script>
    </head>
    <body>
    <c:forEach var="date" items="${closedDateList}">
    	<input class="date" type="hidden" value="${date }">
    </c:forEach>
    <form>
    	
    </form>
        <div id="wrapper" class="container">
            <!--           HEADER-->
            <div id="header" class="row">
                <div class="col-lg-2 col-md-2 col-sm-2"><a href="#">로고</a></div>
                <div class="col-lg-4 col-md-4 col-sm-4"><input type="text" placeholder="검색하기"></div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <ul id="topMenu">
                        <li><a href="#">로그인</a></li>
                        <li><a href="#">회원가입</a></li>
                        <li><a href="#">마이페이지</a></li>
                        <li><a href="#">튜터등록</a></li>
                    </ul>        
                </div>
            </div>
            <!--           HEADER-->
            <div id="contents">
                <div id="mainContent">
                    <div id="myCarousel1" class="carousel slide" data-ride="carousel" data-interval="3000">
                        <c:if test="${classInfo.info_img2 !=null}">
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel1" data-slide-to="0" class="active">
                                </li>
                                <li data-target="#myCarousel1" data-slide-to="1"></li>
                            </ol>
                        </c:if>
                        <c:if test="${classInfo.info_img3 !=null}">
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel1" data-slide-to="0" class="active">
                                </li>
                                <li data-target="#myCarousel1" data-slide-to="1"></li>
                                <li data-target="#myCarousel1" data-slide-to="2"></li>
                            </ol>
                        </c:if>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="${classInfo.info_img1 }" class="card-img-top">
                            </div>
                            <c:if test="${classInfo.info_img2 !=null}">
                                <div class="carousel-item">
                                    <img src="${classInfo.info_img2 }" class="card-img-top">
                                </div>
                            </c:if>
                            <c:if test="${classInfo.info_img3 !=null}">
                                <div class="carousel-item">
                                    <img src="${classInfo.info_img3 }" class="card-img-top">
                                </div>
                            </c:if>
                        </div>
                        <c:if test="${classInfo.info_img2 !=null}">
                            <a class="carousel-control-prev" href="#myCarousel1" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#myCarousel1" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </c:if>
                    </div>
                    <!--                캐러셀 이미지 끝-->
                    <div id="classNavi">
                        <ul id="clickNavi">
                            <!--                           href에다가 해당위치 id넣어주기-->
                            <li><a href="#sumary">요약</a></li>
                            <li><a href="#tutorinfo">튜터정보</a></li>
                            <li><a href="#introduction">수업소개</a></li>
                            <li><a href="#place">위치</a></li>
                            <li><a href="#review">후기</a></li>
                        </ul>
                    </div>
                    <div id="sumary" class="class_detail">
                        <!--                        요약부분-->
                        <div class="class_name">
                            <div class="tutor">
                                <span class="class_tuImg">
                                    <img id="tutorImg" src="${tutorImg}" alt="no img">
                                </span>
                            </div>
                            <div class="class_nickname">
                                ${tutorNickname}
                            </div>
                        </div>
                        <div class="class_title">
                            <div class="title">
                                <h5>${classInfo.info_title}</h5>
                            </div>
                            <div class="star">
                                <a class="starImg" href="#">
                                    <!--                                 별점에 따라..몇개로할건지..... -->
                                    <img src="Content/Images/star.jfif">
                                    <img src="Content/Images/star.jfif">
                                </a>
                            </div>
                            <div class="info">
                                <ul>
                                    <li>
                                        <div>
                                            <img src="Content/Images/map-location.png">
                                        </div>
                                        위치
                                    </li>
                                    <li>
                                        <div>
                                            <img src="Content/Images/south-korean-won.png">
                                        </div>
                                        ${classInfo.info_price }원
                                    </li>
                                    <li>
                                        <div>
                                            <img src="Content/Images/group.png">
                                        </div>
                                        ${classInfo.info_maxperson }명
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div id="tutorinfo" class="class_detail">
                        <h3>튜터정보(쪽지기능)</h3>
                        <div>${classInfo.info_intro }</div>
                    </div>
                    <div id="introduction" class="class_detail">
                        <h3>수업소개</h3>
                        <div>${classInfo.info_explain }</div>
                    </div>
                    <div id="place" class="class_detail">
                        <h3>위치(지도확대축소 드래그 추가가능)</h3>
                        <div>
                            <div id="map" style="width:100%;height:300px;"></div>
                        </div>
                    </div>
                    <div id="review" class="class_detail">
                        <h3>후기</h3>
                        <div>후기용 게시판//임시자리~</div>
                    </div>
                    <!--                    여기까지 mainContent   -->
                </div>
                <div id="sideContent">
                    <div id="sideFixed">
                        <div id="sideTop" class="d-flex">
                            <span><b>옵션선택</b></span>
                            <span class="ml-auto calendar">달력에서 보기</span>
                        </div>
                        <div class="d-flex">
                            <span>일정</span><span class="ml-auto pr-2">V</span>
                        </div>
                        <!--여기가 달력 추가될 위치-->
                        <div id="datepicker"></div>
                        <!--/달력 추가될 위치-->
                        <div id="schedule">
                        	<button type="button" id="scdBtn">
                        	<div id="scdWrapper">
                        		<div id="checkDate"></div>
                        		<div id="checkApplicable"></div>
                        	</div>
                        	</button>
                        </div>
                        <div id="select">
                        	<div>
                        		<div id="selectInfo" class="d-flex" flag="false">
                        			<span id="selectDate"></span><img class="ml-auto" id="closeImg" src="Content/Images/close.png">
                        		</div>
                        		<div>참가비 (1인)</div>
                        		<div id="selectPrice">${classInfo.info_price }원</div>
                        	</div>
                        </div>
                        <div id="purchase"><input id="purchaseBtn" type="button" value="구매하기"></div>
                    </div>
                </div>
            </div>
        </div>
        <div>Icons made by <a href="https://www.flaticon.com/authors/smashicons" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/" 		    title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" 		    title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
    </body>
</html>