<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Document</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            body {
                min-width: 1200px;
            }
            #img {
                margin: 0 auto;
                width: 1200px;
                height: 700px;
            }
            .item {
                padding: 50px;
            }
            .wrapper {
                display: grid;
                grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
                height: 100px;
            }
            .items {
                border: 2px solid black;
                background-color: rgb(0, 0, 0);
                text-align: center;
                text-shadow: 3px 3px 3px gray;
            }
            .teamName {
                color: aliceblue;
                font-size: 50px;
                font-family: "궁서";
                font-weight: 1000;
            }
            .items > b {
                font-size: 30px;
                color: rgb(255, 255, 255);
            }

            .close,
            .modal-header,
            h4 {
                background-color: #ffffff;
                color: rgb(0, 0, 0);
                text-align: center;
                font-size: 30px;
            }
            .modal-footer {
                background-color: #f9f9f9;
            }
        </style>
    </head>
    <body>

        <div class="wrapper">
            <div class="items">
                <br/>
                <b>pricing</b>
            </div>
            <div class="items">
                <br/>
                <b>project</b>
            </div>
            <div class="items" style="padding:10px">
                <span class="teamName">群鷄一鶴</span>
            </div>
            <div class="items" id="loginBtn">
                <br/>
                <b>login</b>
            </div>
            <div class="items">
                <br/>
                <b>signUp</b>
            </div>
        </div>

        <div
            id="myCarousel"
            class="carousel slide"
            data-ride="carousel"
            style="height: 850px;">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img id="img" src="img/img01.jpg" alt="New York">
                    <div class="carousel-caption">
                        <h3>Chatting</h3>
                        <p>채팅입니다.</p>
                    </div>
                </div>

                <div class="item">
                    <img id="img" src="img/img02.jpg" alt="Chicago">
                    <div class="carousel-caption">
                        <h3>Document</h3>
                        <p>문서 작성 및 관리 입니다</p>
                    </div>
                </div>

                <div class="item">
                    <img id="img" src="img/img03.jpg" alt="Los Angeles">
                    <div class="carousel-caption">
                        <h3>Calender</h3>
                        <p>일정관리 입니다.</p>
                    </div>
                </div>
            </div>

            <!-- Left and right controls -->
            <a
                class="left carousel-control"
                href="#myCarousel"
                role="button"
                data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a
                class="right carousel-control"
                href="#myCarousel"
                role="button"
                data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- -----------------로그인 모달------------------ -->
        <div class="modal fade" id="loginModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="padding:35px 50px;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4>
                            <span class="glyphicon glyphicon-lock"></span>LOGIN
                        </h4>
                    </div>
                    <div class="modal-body" style="padding:40px 50px;">
                        <form role="form">
                            <div class="form-group">
                                <label for="usrname">
                                    <span class="glyphicon glyphicon-user"></span>아이디
                                </label>
                                <input type="text" class="form-control" id="usrname" placeholder="아이디입력">
                            </div>
                            <div class="form-group">
                                <label for="psw">
                                    <span class="glyphicon glyphicon-eye-open"></span>비밀번호
                                </label>
                                <input type="text" class="form-control" id="psw" placeholder="비밀번호입력">
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" value="" checked="checked">Remember me</label>
                            </div>
                            <button type="submit" class="btn btn-success btn-block">
                                <span class="glyphicon glyphicon-off"></span>Login
                            </button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <a href="#">아이디 / 비밀번호 찾기</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        $(document).ready(function () {
            $("#loginBtn").click(function () {
                $("#loginModal").modal();
            });
        });
    </script>
</html>
