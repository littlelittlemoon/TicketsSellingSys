<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="others/path.jsp" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>信息查询</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
    <link href="<%=path%>/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/sweetalert.css"/>
    <%--<script src="cdn.bootcss.com/avalon.js/1.5.6/avalon.js"></script>--%>
    <script src="<%=path%>/assets/js/ace-extra.min.js"></script>
    <script src="<%=path%>/assets/myjs/avalon.js"></script>
</head>

<body class="navbar" ms-controller="TimeTableController">
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

                <li class="active open">
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
                        <li class="active">
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
                        信息查询
                        <small>
                            <i class="icon-double-angle-right"></i>
                            列车时刻表查询
                        </small>
                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <label>选择车次：</label>
                                    <select style="width: 200px;"
                                            id="selected">
                                        <option ms-for="el in @trainlist">
                                            {{el.trainid}}
                                        </option>
                                    </select>

                                    <button class="btn btn-primary btn-sm" style="margin-left: 50px;" type="button"
                                            ms-click="@search">
                                        <i class="icon-search smaller-125"></i>
                                        查询
                                    </button>

                                    <button class="btn btn-grey btn-sm" style="margin-left: 30px;" type="reset">
                                        <i class="icon-undo smaller-125"></i>
                                        重置
                                    </button>
                                </div>
                            </div>
                        </form>

                        <div class="widget-box">
                            <div class="widget-header header-color-blue">
                                <h5 class="bigger lighter">
                                    <i class="icon-table"></i>
                                    列车时刻表
                                </h5>

                                <div class="widget-toolbar widget-toolbar-light no-border">

                                </div>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main no-padding">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead class="thin-border-bottom">
                                        <tr>
                                            <th>
                                                站点
                                            </th>

                                            <th>
                                                时间
                                            </th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <tr ms-for="el in @datalist">
                                            <th>{{el.startstation}} → {{el.endstation}}</th>
                                            <th>{{el.statime}} → {{el.arrtime}}</th>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
<script src="<%=path%>/assets/myjs/TimeTable.js"></script>
<script src="<%=path%>/assets/js/bootstrap.min.js"></script>
<script src="<%=path%>/assets/js/typeahead-bs2.min.js"></script>

<script src="<%=path%>/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="<%=path%>/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=path%>/assets/js/jquery.slimscroll.min.js"></script>

<!-- ace scripts -->

<script src="<%=path%>/assets/js/ace-elements.min.js"></script>
<script src="<%=path%>/assets/js/ace.min.js"></script>
<script src="<%=path%>/assets/myjs/sweetalert.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function ($) {

        $('#simple-colorpicker-1').ace_colorpicker({pull_right: true}).on('change', function () {
            var color_class = $(this).find('option:selected').data('class');
            var new_class = 'widget-header';
            if (color_class != 'default')  new_class += ' header-color-' + color_class;
            $(this).closest('.widget-header').attr('class', new_class);
        });


        // scrollables
        $('.slim-scroll').each(function () {
            var $this = $(this);
            $this.slimScroll({
                height: $this.data('height') || 100,
                railVisible: true
            });
        });

        /**$('.widget-box').on('ace.widget.settings' , function(e) {
					e.preventDefault();
				});*/



        // Portlets (boxes)
        $('.widget-container-span').sortable({
            connectWith: '.widget-container-span',
            items: '> .widget-box',
            opacity: 0.8,
            revert: true,
            forceHelperSize: true,
            placeholder: 'widget-placeholder',
            forcePlaceholderSize: true,
            tolerance: 'pointer'
        });

    });
</script>

</body>
</html>
