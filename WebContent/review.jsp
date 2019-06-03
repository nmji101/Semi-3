<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <style>
        div{
            box-sizing: border-box;
            /* border: 1px solid black */
        }
        .center{
            text-align: center;
        }
        .imgSize{
            width:100%;
            max-width: 100%;
            max-height: 100px;
        }
        .btnLike{
            width:100%;
            max-width: 100%;
            height: 100%;
            padding:inherit;
        }
        .textArea{
            max-height: 100%;
            width: 100%;
        }
        .line{
        border: 1px solid black
        }
    </style>
           <script>
           $(function(){
        		$(".btnLike").on("click", function(){
        			alert("추천 하였습니다.")
        		}) 
           })
    		</script>
    <body>
        <div class="container">
<!--             <p>
                <button class="btn btn-primary" id="review" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" 
                aria-controls="collapseExample"> 클래스 후기</button>
            </p> -->
           <div class= "collapse show" id="collapseExample">   
                <div class="card card-body">
    <!------------------------------------------------------------------------------------------------------->
    		<c:forEach var="tmp" items="${list }">
                    <div class="row line">
                        <div class="col-2 col-sm-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 px-0">
                            <div class="row mx-0 line">
                                <img class ="imgSize" src="dancing-dave-minion-510835_640.jpg" class="rounded float-left" alt="...">
                            </div>
                            <div class="row mx-0 line">
                            	<!-- 후기 등록자 아이디 -->
                               <div class="col-12 col-sm-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 px-0">${tmp.re_userId }</div>
                            </div>
                        </div>
                        <div class="col-10 col-sm-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 px-0">
                            <div class="row mx-0 line">
                            	<!-- 별점 -->
                                <div class="col-3 col-sm-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 px-0">
                               	 ${tmp.star }
                                </div>
                                <!-- 후기등록일자 -->
                                <div class="col-6 col-sm-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 px-0">${tmp.re_writeDate }</div>
                                <div class="col-3 col-sm-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 px-0">
                                    <div class="row mx-0">
                                    <!-- 좋아요 횟수 -->
                                        <div class="col-6 col-sm-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 px-0 center">
                                            <span>${tmp.re_like }</span>
                                        </div>
                                        <div class="col-6 col-sm-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 p-0">
                                            <button type="button" class="btn btn-outline-primary btnLike">▲</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mx-0 textArea">
                             <!-- 후기 내용 -->
                                ${tmp.re_review }
                            </div>
                        </div>
                    </div>
                    <p></p>
               </c:forEach>
<!-- --------------------------------------------------------- Navi ------------------------------------------------------ -->
                    <p></p>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 px-0">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <p>${resultNavi }</p>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>