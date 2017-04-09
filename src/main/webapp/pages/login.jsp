<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>车站售票系统登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="assets/css/font.css"/>
    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="assets/css/sweetalert.css"/>
    <script src="assets/myjs/avalon.js"></script>
    <script src="assets/js/jquery-2.0.3.min.js"></script>
    <script src="assets/myjs/login.js"></script>
</head>

<body class="login-layout" background="assets/images/back.jpg" ms-controller="loginController">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="center">
                        <h1>
                            <i class="icon-leaf green"></i>
                            <span class="blue">用户登录</span>
                        </h1>
                    </div>

                    <div class="space-6"></div>

                    <div class="position-relative">
                        <div id="login-box" class="login-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue lighter bigger">
                                        <i class="icon-coffee green"></i>
                                        请输入帐号和密码
                                    </h4>

                                    <div class="space-6"></div>

                                    <%--avalon验证--%>
                                    <form ms-validate="@validate">
                                        <fieldset>
                                            <label class="block clearfix"> <span
                                                    class="block input-icon input-icon-right"> <input
                                                    type="text" class="form-control" placeholder="账 号" id="username"
                                                    ms-duplex="@name" ms-rules='{required:true}'
                                                    data-required-message="用户名不能为空"> <i
                                                    class="icon-user"></i>
												</span>
                                                <span style="color: red">{{@nameerrormsg}}</span>
                                            </label> <label class="block clearfix"> <span
                                                class="block input-icon input-icon-right"> <input
                                                id="password" type="password" class="form-control" placeholder="密 码"
                                                ms-rules='{required:true}' data-required-message="密码不能为空"
                                                ms-duplex="@pwd"/> <i class="icon-lock"></i>
												</span>
                                            <span style="color: red">{{@pwderrormsg}}</span>
                                        </label>
                                            <div class="space"></div>
                                            <div class="clearfix">
                                                <button type="button"
                                                        class="width-35 pull-right btn btn-sm btn-primary"
                                                        ms-click="@login">
                                                    <i class="icon-key"></i> 登 录
                                                </button>

                                            </div>

                                            <div class="space-4"></div>
                                        </fieldset>
                                    </form>

                                </div><!-- /widget-main -->

                            </div><!-- /widget-body -->
                        </div><!-- /login-box -->
                    </div><!-- /position-relative -->
                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
</div><!-- /.main-container -->
<script src="assets/myjs/sweetalert.min.js"></script>
</body>
</html>

