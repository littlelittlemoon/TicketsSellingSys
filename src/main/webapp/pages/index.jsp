<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="others/path.jsp" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>车站售票系统控制台</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
    <link href="<%=path%>/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/font.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/sweetalert.css"/>
    <script src="<%=path%>/assets/js/ace-extra.min.js"></script>
    <script src="<%=path%>/assets/myjs/avalon.js"></script>
</head>

<body class="navbar" ms-controller="indexController">
<jsp:include page="others/navbar.jsp"/>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <div class="sidebar sidebar-fixed" id="sidebar" ms-controller="sidebarController">
            <ul class="nav nav-list">
                <li class="active">
                    <a href="#">
                        <i class="icon-dashboard"></i>
                        <span class="menu-text"> 首页 </span>
                    </a>
                </li>
                <li ms-class="{show:!@isMgr}" class="hide">
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-desktop"></i>
                        <span class="menu-text"> 售票业务 </span>
                        <b class="arrow icon-angle-down"></b>
                    </a>
                    <ul class="submenu">
                        <li>
                            <a href="javascript:void(0)" ms-click="@skip('searchTickets')">
                                <i class="icon-double-angle-right"></i> 车票业务
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" ms-click="@skip('returnTickets')">
                                <i class="icon-double-angle-right"></i> 退票业务
                            </a>
                        </li>
                    </ul>
                </li>

                <li ms-class="{show:!@isMgr}" class="hide">
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-list"></i>
                        <span class="menu-text"> 信息查询</span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="javascript:void(0)" ms-click="@skip('SellTicketsInfo')">
                                <i class="icon-double-angle-right"></i> 售票信息查询
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" ms-click="@skip('TimeTable')">
                                <i class="icon-double-angle-right"></i> 列车时刻表查询
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" ms-click="@skip('TicketsPrice')">
                                <i class="icon-double-angle-right"></i> 票价查询
                            </a>
                        </li>
                    </ul>
                </li>
                <li ms-class="{show:@isMgr}" class="hide">
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-tag"></i>
                        <span class="menu-text"> 车次管理 </span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="javascript:void(0)" ms-click="@skip('addTrain')">
                                <i class="icon-double-angle-right"></i> 添加车次
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" ms-click="@skip('Train')">
                                <i class="icon-double-angle-right"></i> 查看车次列表
                            </a>
                        </li>
                    </ul>
                </li>

                <li ms-class="{show:@isMgr}" class="hide">
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-book"></i>
                        <span class="menu-text"> 途经站管理 </span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="#">
                                <i class="icon-double-angle-right"></i> 查看途经站情况
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-double-angle-right"></i> 管理途经站
                            </a>
                        </li>
                    </ul>
                </li>

                <li ms-class="{show:@isMgr}" class="hide">
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-calendar"></i>
                        <span class="menu-text"> 用户管理 </span>
                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="javascript:void(0)" ms-click="@skip('adduser')">
                                <i class="icon-double-angle-right"></i> 添加用户
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0)" ms-click="@skip('userlist')">
                                <i class="icon-double-angle-right"></i> 查看用户列表
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- /.nav-list -->

            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>

            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'collapsed')
                } catch (e) {
                }
            </script>
        </div>

        <div class="main-content fixed">
            <div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
                <ul class="breadcrumb" style="margin-top: 10px;">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="#">首页</a>
                    </li>
                </ul>
            </div>

            <div class="page-content" style="margin-top: auto" ms-controller="welcomeController">
                <div class="page-header">
                    <h1>
                        首页
                        <small>
                            <i class="icon-double-angle-right"></i>
                            查看
                        </small>
                    </h1>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="alert alert-block alert-success">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="icon-remove"></i>
                            </button>

                            <i class="icon-ok green"></i> 欢迎使用
                            <strong class="green">
                                车站售票管理系统
                            </strong>
                        </div>

                        <div class="tabbable">
                            <ul class="nav nav-tabs" id="myTab">
                                <li class="active"><a data-toggle="tab" href="#home"> <i
                                        class="green icon-home bigger-110"></i> 个人信息
                                </a></li>
                            </ul>

                            <div class="tab-content">
                                <div id="home" class="tab-pane active">
                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name">头像</div>
                                            <div class="profile-info-value">
                                                <img style="height: 40px;width: 40px" class="nav-user-photo"
                                                     ms-attr="{src:@url}"/>
                                            </div>
                                        </div>
                                        <div class="profile-info-row">
                                            <div class="profile-info-name">姓名</div>

                                            <div class="profile-info-value">
                                                <span class="editable editable-click"
                                                      id="username">{{@user.username}}</span>
                                            </div>
                                        </div>
                                        <div class="profile-info-row">
                                            <div class="profile-info-name">职位</div>

                                            <div class="profile-info-value">
                                                <span class="editable editable-click"
                                                      id="age">{{@user.role.rolename}}</span>
                                            </div>
                                        </div>

                                        <div class="profile-info-row">
                                            <div class="profile-info-name">性别</div>

                                            <div class="profile-info-value">
                                                <span class="editable editable-click"
                                                      id="signup">{{@user.usersex}}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6" id="default-buttons" style="padding: 20px">

                                <button class="btn btn-primary" data-target="#changePwdModal" data-toggle="modal">
                                    <i class="icon-cog align-top bigger-125"></i>
                                    修改密码
                                </button>

                                <button class="btn btn-danger" style="margin-left: 20px;" data-target="#uploadModal"
                                        data-toggle="modal">
                                    <i class="icon-upload  align-top bigger-125 icon-on-right"></i>
                                    修改头像
                                </button>
                            </div>
                            <!-- Modal -->
                            <div class="modal fade" id="changePwdModal" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                                    aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">修改密码</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form ms-validate="@validate">
                                                <div class="form-group">
                                                    <label for="recipient-name" class="control-label">当前密码:</label>
                                                    <input type="password" class="form-control" id="recipient-name"
                                                           ms-duplex="@pwd1" ms-rules='{required:true}'
                                                           data-required-message="请输入原密码"
                                                           placeholder="输入当前密码">
                                                    <span style="color: red">{{@pwd1errormsg}}</span>
                                                </div>
                                                <div class="form-group">
                                                    <label for="form-field-1" class="control-label">新密码:</label>
                                                    <input type="password" class="form-control" id="form-field-1"
                                                           ms-duplex="@pwd2"
                                                           ms-rules='{required:true}' data-required-message="请输入新密码"
                                                           placeholder="输入新密码"/>
                                                    <span style="color: red">{{@pwd2errormsg}}</span>
                                                </div>
                                                <div class="form-group">
                                                    <label for="form-field-2" class="control-label">确认密码:</label>
                                                    <input type="password" class="form-control" id="form-field-2"
                                                           ms-duplex="@pwd3"
                                                           ms-rules='{required:true,equalto:"form-field-1"}'
                                                           data-equalto-message="两次密码输入不一致"
                                                           placeholder="再次输入新密码"/>
                                                    <span style="color: red">{{@pwd3errormsg}}</span>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary" ms-click="@changePwd">确定
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal -->
                            <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                                    aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="exampleModalLabel">上传头像</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form enctype="multipart/form-data`">
                                                <input type="file" class="form-control" name="file" id="file">
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary" ms-click="@changeImg">确定
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /span -->
        </div>
        <!-- /row -->
        <!-- PAGE CONTENT ENDS -->
    </div>
    <!-- /.col -->
</div>
<!-- /.row -->
</div>
<!-- /.page-content -->
</div>
<!-- /.main-content -->
</div>
<!-- /.main-container-inner -->

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="icon-double-angle-up icon-only bigger-110"></i>
</a>
</div>
<!-- /.main-container -->
<script src="<%=path%>/assets/js/jquery-2.0.3.min.js"></script>
<script src="<%=path%>/assets/myjs/index.js"></script>
<script src="<%=path%>/assets/myjs/ajaxfileupload.js"></script>
<script src="<%=path%>/assets/js/bootstrap.min.js"></script>
<script src="<%=path%>/assets/js/typeahead-bs2.min.js"></script>
<script src="<%=path%>/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="<%=path%>/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=path%>/assets/js/jquery.slimscroll.min.js"></script>
<script src="<%=path%>/assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="<%=path%>/assets/js/jquery.sparkline.min.js"></script>
<script src="<%=path%>/assets/js/flot/jquery.flot.min.js"></script>
<script src="<%=path%>/assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="<%=path%>/assets/js/flot/jquery.flot.resize.min.js"></script>

<!-- ace scripts -->
<script src="<%=path%>/assets/js/ace-elements.min.js"></script>
<script src="<%=path%>/assets/js/ace.min.js"></script>
<script src="<%=path%>/assets/myjs/sweetalert.min.js"></script>
<!-- inline scripts related to this page -->

</body>
</html>
