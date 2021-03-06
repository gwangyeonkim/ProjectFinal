<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/projectMain.css">
        <script src="js/index.js"></script>
    </head>
    <body>

        <div class="wrapper">

            <div class="nav">
                <a href="#" class="logo">Home</a>
                <div class="dropdown">
                    <button class="dropbtn">Document</button>
                    <div class="dropdown-content">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">Calendar</button>
                    <div class="dropdown-content">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">Member</button>
                    <div class="dropdown-content">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">Template</button>
                    <div class="dropdown-content">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                    </div>
                </div>
                <div class="nav-right">
                    <a id="loginInfo">
                        loginInfo
                        <img id="chatIcon" alt="chat" src="img/chat.png"/>
                        <img id="notiIcon" alt="notification" src="img/notification.png"/>
                        <span id="notiNonCheck">&#128308;</span>
                        <!-- ??? notiCount??? ????????? ?????? ????????? -->
                        <span id="notiCount">1</span>
                    </a>
                    <a class="active" href="#home">logout</a>
                </div>
            </div>
            <div class="content">
                <!--?????? ????????? ???-->
                <div class="child1"></div>
            </div>
        </div>
    </body>
</html>