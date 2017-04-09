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
    <link rel="stylesheet" href="<%=path%>/assets/css/bootstrap-datetimepicker.css"/>
    <%--<script src="cdn.bootcss.com/avalon.js/1.5.6/avalon.js"></script>--%>
    <script src="<%=path%>/assets/js/ace-extra.min.js"></script>
    <script src="<%=path%>/assets/myjs/avalon.js"></script>
</head>

<body class="navbar" ms-controller="TrainlistController">
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
                    <a href="javascript:void(0)" ms-click="@skip('welcome')">
                        <i class="icon-dashboard"></i>
                        <span class="menu-text"> 首页 </span>
                    </a>
                </li>
                <li class="open active">
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-tag"></i>
                        <span class="menu-text"> 车次管理 </span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li class="active">
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

                <li>
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

        <div class="main-content">
            <div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
                <ul class="breadcrumb" style="margin-top: 10px;">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="#">车次管理</a>
                    </li>
                </ul>
                <!-- .breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        车次管理
                        <small>
                            <i class="icon-double-angle-right"></i>
                            添加车次
                        </small>
                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 列车号 </label>

                                <div class="col-sm-9">
                                    <input type="text" id="form-field-1" placeholder="列车号"
                                           class="col-xs-10 col-sm-5" ms-duplex="@train.carid"/>
                                </div>
                            </div>

                            <div class="space-4"></div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 里程 </label>

                                <div class="col-sm-9">
                                    <input type="text" placeholder="里程"
                                           class="col-xs-10 col-sm-5" ms-duplex="@train.distance"/>
                                </div>
                            </div>

                            <div class="space-4"></div>

                            <div class="space-4"></div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 站票数量 </label>

                                <div class="col-sm-9">
                                    <input type="text" placeholder="站票数量"
                                           class="col-xs-10 col-sm-5" ms-duplex="@train.standticketnum"/>
                                </div>
                            </div>

                            <div class="space-4"></div>
                            <div class="space-4"></div>

                            <div class="space-4"></div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 坐票数量 </label>

                                <div class="col-sm-9">
                                    <input type="text" placeholder="坐票数量"
                                           class="col-xs-10 col-sm-5" ms-duplex="@train.seatticketnum"/>
                                </div>
                            </div>

                            <div class="space-4"></div>
                            <div class="space-4"></div>

                            <div class="space-4"></div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 卧票数量 </label>

                                <div class="col-sm-9">
                                    <input type="text" placeholder="卧票数量"
                                           class="col-xs-10 col-sm-5" ms-duplex="@train.sleepticketnum"/>
                                </div>
                            </div>

                            <div class="space-4"></div>


                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> 出发时间
                                </label>
                                <div style="width: 250px;" class="input-group date form_datetime col-md-5"
                                     data-date-format="yyyy-mm-dd HH:mm:ss"
                                     data-link-field="dtp_input1">
                                    <input class="form-control" size="16" type="text" value="" readonly
                                           ms-duplex="@train.starttime">
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                                <input type="hidden" id="dtp_input1" value=""/><br/>
                            </div>
                            <div class="space-4"></div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> 到达时间
                                </label>
                                <div style="width: 250px;" class="input-group date form_datetime col-md-5"
                                     data-date-format="yyyy-mm-dd HH:mm:ss"
                                     data-link-field="dtp_input1">
                                    <input class="form-control" size="16" type="text" value="" readonly
                                           ms-duplex="@train.arrtime">
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                                <input type="hidden" id="dtp_input2" value=""/><br/>
                            </div>


                            <div class="space-4"></div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    出发站 </label>

                                <div class="col-sm-9">
                                    <select id="selected1" ms-duplex="@train.startstation">
                                        <option ms-for="el in @stalist">{{el.stationname}}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    终点站 </label>

                                <div class="col-sm-9">
                                    <select id="selected2" ms-duplex="@train.endstation">
                                        <option ms-for="el in @endlist">{{el.stationname}}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix form-actions">
                                <div class="col-md-offset-3 col-md-9">
                                    <button class="btn btn-info" type="button" ms-click="@addTrain">
                                        <i class="icon-ok bigger-110"></i>
                                        Submit
                                    </button>
                                    <button class="btn" type="reset" style="margin-left: 20px">
                                        <i class="icon-undo bigger-110"></i>
                                        Reset
                                    </button>
                                </div>
                            </div>
                        </form>


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
<script src="<%=path%>/assets/myjs/Train.js"></script>
<script src="<%=path%>/assets/js/bootstrap.min.js"></script>
<script src="<%=path%>/assets/js/typeahead-bs2.min.js"></script>

<%--<script src="<%=path%>/assets/js/date-time/daterangepicker.min.js"></script>--%>
<script src="<%=path%>/assets/js/bootstrap-datetimepicker.js"></script>
<script src="<%=path%>/assets/js/bootstrap-datetimepicker.fr.js"></script>

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
<script>
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1,
        startDate: new Date()
    });

</script>
</body>
</html>
