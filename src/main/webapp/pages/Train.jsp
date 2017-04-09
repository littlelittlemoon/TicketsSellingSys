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
    <link rel="stylesheet" href="<%=path%>/assets/css/bootstrap-datetimepicker.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/select2.css"/>
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
                    <a href="javascript:void(0)" ms-click="@skip('index')">
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
                        <li>
                            <a href="javascript:void(0)" ms-click="@skip('addTrain')">
                                <i class="icon-double-angle-right"></i> 添加车次
                            </a>
                        </li>
                        <li class="active">
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

                <li class="open">
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
                            查看车次列表
                        </small>
                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div id="traintable">
                            <div class="nav-search" id="nav-search">
                                <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="列车号或站点" class="nav-search-input"
                                           id="nav-search-input" autocomplete="off" ms-duplex="@keyword"
                                    />
									<i class="icon-search nav-search-icon"></i>
								</span>
                                    <button type="button" class="btn btn-danger btn-xs btn-group-xs" ms-click="@search">
                                        查询
                                    </button>
                                </form>
                            </div><!-- #nav-search -->
                            <div class="table-header">
                                车次列表
                            </div>

                            <div class="table-responsive">
                                <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>列车号</th>
                                        <th>出发站</th>
                                        <th>终点站</th>
                                        <th>出发时间</th>
                                        <th>到达时间</th>
                                        <th>里程</th>
                                        <th>站票数量</th>
                                        <th>坐票数量</th>
                                        <th>卧票数量</th>
                                        <th></th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <tr ms-for="el in @datalist">

                                        <td class="center">{{el.carid}}</td>
                                        <td class="center">{{el.startstation.stationname}}</td>
                                        <td class="center">{{el.endstation.stationname}}</td>
                                        <td class="center">{{el.starttime}}</td>
                                        <td class="center">{{el.arrtime}}</td>
                                        <td class="center">{{el.distance}}</td>
                                        <td class="center">{{el.standticketnum}}</td>
                                        <td class="center">{{el.seatticketnum}}</td>
                                        <td class="center">{{el.sleepticketnum}}</td>
                                        <td>
                                            <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                                <a href="#modal-form" role="button" data-toggle="modal"
                                                   ms-click="@editTrain(el)"
                                                   class="btn btn-xs btn-info">
                                                    <i class="icon-edit bigger-120"></i>
                                                </a>

                                                <button class="btn btn-xs btn-danger" ms-click="@delTrain(el.trainid)">
                                                    <i class="icon-trash bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-primary"
                                                        ms-click="@addPriceinfo(el)">
                                                    <i class="icon-check bigger-120"></i>
                                                </button>
                                            </div>

                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="pg_grid-pager" class="ui-pager-control" role="group" style="margin-top: 0px;">
                                <table cellspacing="0" cellpadding="0" border="0"
                                       class="ui-pg-table"
                                       style="width: 100%;"
                                       role="row">
                                    <tbody>
                                    <tr>
                                        <td id="grid-pager_center" align="center"
                                            style="white-space: pre; width: 346px;">
                                            <table
                                                    cellspacing="0" cellpadding="0" border="0"
                                                    style="table-layout: auto;" class="ui-pg-table">
                                                <tbody>
                                                <tr>
                                                    <td id="first_grid-pager" ms-click="@firstPage"
                                                        class="ui-pg-button ui-corner-all "><span
                                                            class="ui-icon icon-double-angle-left bigger-140"></span>
                                                    </td>
                                                    <td id="prev_grid-pager" ms-click="@previousPage"
                                                        class="ui-pg-button ui-corner-all "><span
                                                            class="ui-icon icon-angle-left bigger-140"></span></td>
                                                    <td class="ui-pg-button ui-state-disabled"
                                                        style="width: 4px;"><span class="ui-separator"></span></td>
                                                    <td dir="ltr">第 <input type="text" style="width: 25px;"
                                                                           ms-duplex="@pageCurrent"> 页 共 <span
                                                            id="sp_1_grid-pager"> {{@pageTotle}} 页</span></td>
                                                    <td class="ui-pg-button ui-state-disabled"
                                                        style="width: 4px; cursor: default;"><span
                                                            class="ui-separator"></span></td>
                                                    <td id="next_grid-pager" ms-click="@nextPage"
                                                        class="ui-pg-button ui-corner-all"
                                                        style="cursor: default;"><span
                                                            class="ui-icon icon-angle-right bigger-140"></span></td>
                                                    <td id="last_grid-pager" ms-click="@lastPage"
                                                        class="ui-pg-button ui-corner-all"
                                                        style="cursor: default;"><span
                                                            class="ui-icon icon-double-angle-right bigger-140"></span>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </td>

                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <form class="form-horizontal hide" role="form" id="addForm">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 列车号 </label>

                                <div class="col-sm-9">
                                    <input type="text" id="form-field-1" placeholder="列车id"
                                           class="col-xs-10 col-sm-5" ms-duplex="@priceinfo.trainid" readonly/>
                                </div>
                            </div>

                            <div class="space-4"></div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 里程 </label>

                                <div class="col-sm-9">
                                    <input type="text" placeholder="里程"
                                           class="col-xs-10 col-sm-5" ms-duplex="@priceinfo.distance"/>
                                </div>
                            </div>

                            <div class="space-4"></div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 票价 </label>

                                <div class="col-sm-9">
                                    <input type="text" placeholder="票价"
                                           class="col-xs-10 col-sm-5" ms-duplex="@priceinfo.price"/>
                                </div>
                            </div>

                            <div class="space-4"></div>


                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> 出发时间
                                </label>
                                <div style="width: 250px;" class="input-group date form_datetime col-md-5"
                                     data-date="2016-06-16T05:25:07Z" data-date-format="yyyy-mm-dd HH:mm:ss"
                                     data-link-field="dtp_input1">
                                    <input class="form-control" size="16" type="text" value="" readonly
                                           ms-duplex="@priceinfo.starttime">
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
                                     data-date="2016-06-16T05:25:07Z" data-date-format="yyyy-mm-dd HH:mm:ss"
                                     data-link-field="dtp_input1">
                                    <input class="form-control" size="16" type="text" value="" readonly
                                           ms-duplex="@priceinfo.arrtime">
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
                                    <select id="selected1" ms-duplex="@priceinfo.startstation">
                                        <option ms-for="el in @stalist">{{el.stationname}}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    终点站 </label>

                                <div class="col-sm-9">
                                    <select id="selected2" ms-duplex="@priceinfo.endstation">
                                        <option ms-for="el in @endlist">{{el.stationname}}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    座位类型 </label>

                                <div class="col-sm-9">
                                    <select id="selected3" ms-duplex="@priceinfo.seat">
                                        <option>站票</option>
                                        <option>坐票</option>
                                        <option>卧票</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix form-actions">
                                <div class="col-md-offset-3 col-md-9">
                                    <button class="btn btn-info" type="button" ms-click="@savepriceinfo">
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


                        <form class="form-horizontal hide" role="form" id="edittable">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 列车号 </label>

                                <div class="col-sm-9">
                                    <input type="text" placeholder="列车号"
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
                                <input type="hidden" value=""/><br/>
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
                                <input type="hidden" value=""/><br/>
                            </div>


                            <div class="space-4"></div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    出发站 </label>

                                <div class="col-sm-9">
                                    <select id="selected4" ms-duplex="@train.startstation">
                                        <option ms-for="el in @stalist">{{el.stationname}}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    终点站 </label>

                                <div class="col-sm-9">
                                    <select id="selected5" ms-duplex="@train.endstation">
                                        <option ms-for="el in @endlist">{{el.stationname}}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix form-actions">
                                <div class="col-md-offset-3 col-md-9">
                                    <button class="btn btn-info" type="button" ms-click="@updateTrain">
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
        minDate: "0",
        startDate: new Date()
    });

</script>
</body>
</html>
