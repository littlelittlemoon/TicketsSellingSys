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
    <link rel="stylesheet" href="<%=path%>/assets/css/datepicker.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/ui.jqgrid.css"/>
    <script src="<%=path%>/assets/js/ace-extra.min.js"></script>
    <script src="<%=path%>/assets/myjs/avalon.js"></script>
</head>

<body class="navbar" ms-controller="returnTicketsController">
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
                <li class="active open">
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
                        <li class="active">
                            <a href="javascript:void(0)" ms-click="@skip('returnTickets')">
                                <i class="icon-double-angle-right"></i> 退票业务
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
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
                        车票业务
                        <small>
                            <i class="icon-double-angle-right"></i>
                            退票业务
                        </small>
                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="nav-search" id="nav-search">
                            <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="姓名或身份证号" class="nav-search-input"
                                           id="nav-search-input" autocomplete="off" ms-duplex="@keyword"
                                    />
									<i class="icon-search nav-search-icon"></i>
								</span>
                                <button type="button" class="btn btn-danger btn-xs btn-group-xs" ms-click="@search">查询
                                </button>
                            </form>
                        </div><!-- #nav-search -->
                        <div class="table-header">
                            可 退 票 订 单
                        </div>

                        <div class="table-responsive">
                            <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>姓名</th>
                                    <th>身份证</th>
                                    <th class="hidden-480">状态</th>
                                    <th>出发时间</th>
                                    <th>出发/目的地</th>
                                    <th>座位类型</th>
                                    <th class="hidden-480">票价</th>

                                    <th></th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr ms-for="el in @datalist">

                                    <td class="center">
                                        <a href="#">{{el.pname}}</a>
                                    </td>
                                    <td class="center">{{el.pid}}</td>
                                    <td class="hidden-480 center">{{el.sellstyle.sname}}</td>
                                    <td class="center">{{el.ticketInfo.statime}}</td>
                                    <td class="center">
                                        {{el.ticketInfo.startStation.stationname}} 到
                                        {{el.ticketInfo.endStation.stationname}}
                                    </td>
                                    <td class="hidden-480 center">
                                        <span class="label label-sm label-warning">{{el.ticketInfo.seat.seatname}}</span>
                                    </td>
                                    <th class="center">{{el.ticketInfo.price}}</th>
                                    <td class="center">
                                        <button class="btn btn-sm btn-danger"
                                                ms-click="@returnTicket(el.pid)">
                                            <i class="icon-off bigger-120"></i> 退票
                                        </button>
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
                                                        class="ui-icon icon-double-angle-left bigger-140"></span></td>
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
                                                        class="ui-icon icon-double-angle-right bigger-140"></span></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>

                                </tr>
                                </tbody>
                            </table>

                        </div>

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
<script src="<%=path%>/assets/myjs/returnTickets.js"></script>
<script src="<%=path%>/assets/js/bootstrap.min.js"></script>
<script src="<%=path%>/assets/js/typeahead-bs2.min.js"></script>


<script src="<%=path%>/assets/js/jquery.dataTables.min.js"></script>
<script src="<%=path%>/assets/js/jquery.dataTables.bootstrap.js"></script>
<!-- ace scripts -->

<script src="<%=path%>/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="<%=path%>/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="<%=path%>/assets/js/jqGrid/i18n/grid.locale-en.js"></script>

<script src="<%=path%>/assets/js/ace-elements.min.js"></script>
<script src="<%=path%>/assets/js/ace.min.js"></script>
<script src="<%=path%>/assets/myjs/sweetalert.min.js"></script>

<!-- inline scripts related to this page -->

</body>
</html>
