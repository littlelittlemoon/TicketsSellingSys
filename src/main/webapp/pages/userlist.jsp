<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="others/path.jsp" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>售票业务-退票业务</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
    <link href="<%=path%>/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/sweetalert.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/select2.css"/>
    <%--<script src="cdn.bootcss.com/avalon.js/1.5.6/avalon.js"></script>--%>
    <script src="<%=path%>/assets/js/ace-extra.min.js"></script>
    <script src="<%=path%>/assets/myjs/avalon.js"></script>
</head>

<body class="navbar" ms-controller="userlistController">
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
                <li>
                    <a href="javascript:void(0)" ms-click="@skip('index')">
                        <i class="icon-dashboard"></i>
                        <span class="menu-text"> 首页 </span>
                    </a>
                </li>
                <li>
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

                <li>
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

                <li class="open active">
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

                        <li class="active">
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

        <div class="main-content">
            <div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
                <ul class="breadcrumb" style="margin-top: 10px;">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="#">退票业务</a>
                    </li>
                </ul>
                <!-- .breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        用户管理
                        <small>
                            <i class="icon-double-angle-right"></i>
                            查看用户列表
                        </small>
                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                        <div class="table-header">
                            用户列表
                        </div>

                        <div class="table-responsive">
                            <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>登录id</th>
                                    <th>密码</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>角色</th>
                                    <th></th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr ms-for="el in @datalist">

                                    <td class="center">
                                        {{el.userid}}
                                    </td>
                                    <td class="center">{{el.username}}</td>
                                    <td class="center">{{el.userpass}}</td>
                                    <td class="center">{{el.usersex}}</td>
                                    <td class="center">{{el.role.rolename}}</td>
                                    <td>
                                        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                            <a href="#modal-form" role="button" data-toggle="modal" ms-click="@edit(el)"
                                               class="btn btn-xs btn-info">
                                                <i class="icon-edit bigger-120"></i>
                                            </a>

                                            <button class="btn btn-xs btn-danger" ms-click="@del(el.userid)">
                                                <i class="icon-trash bigger-120"></i>
                                            </button>
                                        </div>

                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <div id="modal-form" class="modal" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="blue bigger">{{@user.username}}的个人信息修改</h4>
                                    </div>

                                    <div class="modal-body overflow-visible">
                                        <div class="row">

                                            <div class="col-xs-12 col-sm-7">
                                                <div class="form-group">
                                                    <label>姓名</label>
                                                    <div>
                                                        <input class="input-large" type="text" id="username"
                                                               placeholder="姓名" ms-duplex="@user.username"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>密码</label>

                                                    <div>
                                                        <input class="input-large" type="text" id="userpass"
                                                               placeholder="密码" ms-duplex="@user.userpass"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>性别</label>
                                                    <div>
                                                        <input class="input-medium" type="text" id="usersex"
                                                               placeholder="性别" ms-duplex="@user.usersex"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>角色</label>
                                                    <div>
                                                        <select id="selected" ms-duplex="@user.role.roleid">
                                                            <option value="R101">管理员</option>
                                                            <option value="R102">售票员</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button class="btn btn-sm" data-dismiss="modal">
                                            <i class="icon-remove"></i>
                                            Cancel
                                        </button>

                                        <button class="btn btn-sm btn-primary" ms-click="@executeEdit">
                                            <i class="icon-ok"></i>
                                            Save
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div><!-- PAGE CONTENT ENDS -->


                        <!-- /widget-main -->
                    </div>
                    <!-- /widget-body -->
                </div>
            </div>
            <!-- /span -->
        </div>


        <!-- PAGE CONTENT ENDS -->
    </div>

</div>
<!-- /.main-container -->

<!-- basic scripts -->

<script src="<%=path%>/assets/js/jquery-2.0.3.min.js"></script>
<script src="<%=path%>/assets/myjs/userlist.js"></script>
<script src="<%=path%>/assets/js/bootstrap.min.js"></script>
<script src="<%=path%>/assets/js/typeahead-bs2.min.js"></script>

<script src="<%=path%>/assets/js/fuelux/fuelux.wizard.min.js"></script>
<script src="<%=path%>/assets/js/jquery.validate.min.js"></script>
<script src="<%=path%>/assets/js/additional-methods.min.js"></script>
<script src="<%=path%>/assets/js/bootbox.min.js"></script>
<script src="<%=path%>/assets/js/jquery.maskedinput.min.js"></script>
<script src="<%=path%>/assets/js/select2.min.js"></script>


<script src="<%=path%>/assets/js/jquery.dataTables.min.js"></script>
<script src="<%=path%>/assets/js/jquery.dataTables.bootstrap.js"></script>
<!-- ace scripts -->

<script src="<%=path%>/assets/js/ace-elements.min.js"></script>
<script src="<%=path%>/assets/js/ace.min.js"></script>
<script src="<%=path%>/assets/myjs/sweetalert.min.js"></script>

<!-- inline scripts related to this page -->

</body>
</html>
