<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="others/path.jsp" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>售票业务-查询车票</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
    <link href="<%=path%>/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/sweetalert.css"/>
    <link rel="stylesheet" href="<%=path%>/assets/css/select2.css"/>
    <script src="<%=path%>/assets/js/ace-extra.min.js"></script>
    <script src="<%=path%>/assets/myjs/avalon.js"></script>
</head>

<body class="navbar" ms-controller="searchTicketController">
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
                        <li>
                            <a href="javascript:void(0)" ms-click="@skip('TimeTable')">
                                <i class="icon-double-angle-right"></i> 列车时刻表查询
                            </a>
                        </li>
                        <li class="active">
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
                        <a href="#">售票业务</a>
                    </li>
                </ul>
                <!-- .breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        售票业务
                        <small>
                            <i class="icon-double-angle-right"></i>
                            车票业务
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
                                    <label>出发地：</label>
                                    <select style="width: 200px;"
                                            id="selected1">
                                        <option ms-for="el in @stalist" ms-attr="{value:el.stationname}">
                                            {{el.stationname}}
                                        </option>
                                    </select>
                                    <label style="margin-left: 10px;">目的地：</label>
                                    <select style="width: 200px;" id="selected2">
                                        <option ms-for="el in @endlist" ms-attr="{value:el.stationname}">
                                            {{el.stationname}}
                                        </option>
                                    </select>
                                    <button class="btn btn-primary btn-sm" style="margin-left: 50px;" type="button"
                                            ms-click="@searchprice">
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
                                    票价列表
                                </h5>

                                <div class="widget-toolbar widget-toolbar-light no-border">
                                    <select id="simple-colorpicker-1" class="hide">
                                        <option selected="" data-class="blue" value="#307ECC">#307ECC</option>
                                        <option data-class="blue2" value="#5090C1">#5090C1</option>
                                        <option data-class="blue3" value="#6379AA">#6379AA</option>
                                        <option data-class="green" value="#82AF6F">#82AF6F</option>
                                        <option data-class="green2" value="#2E8965">#2E8965</option>
                                        <option data-class="green3" value="#5FBC47">#5FBC47</option>
                                        <option data-class="red" value="#E2755F">#E2755F</option>
                                        <option data-class="red2" value="#E04141">#E04141</option>
                                        <option data-class="red3" value="#D15B47">#D15B47</option>
                                        <option data-class="orange" value="#FFC657">#FFC657</option>
                                        <option data-class="purple" value="#7E6EB0">#7E6EB0</option>
                                        <option data-class="pink" value="#CE6F9E">#CE6F9E</option>
                                        <option data-class="dark" value="#404040">#404040</option>
                                        <option data-class="grey" value="#848484">#848484</option>
                                        <option data-class="default" value="#EEE">#EEE</option>
                                    </select>
                                </div>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main no-padding">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead class="thin-border-bottom">
                                        <tr>
                                            <th>车次</th>
                                            <th class="width-50">时间</th>
                                            <th>票价(元)</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <tr ms-for="el in @datalist">
                                            <th>{{el.train.trainid}}</th>
                                            <th>{{el.ticketinfolist[0].staTime}} → {{el.ticketinfolist[0].arrTime}}
                                            </th>
                                            <th>
                                                <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                                                   <span class="label label-sm label-warning"
                                                                         style="margin-right: 5px;">站票:</span>{{el.ticketinfolist[0].ticketprice}}<br>
                                                                    <span class="label label-sm label-warning"
                                                                          style="margin-right: 5px;">坐票:</span>{{el.ticketinfolist[1].ticketprice}}<br>
                                                                    <span class="label label-sm label-warning"
                                                                          style="margin-right: 5px;">卧票:</span>{{el.ticketinfolist[2].ticketprice}}
                                                </div>
                                            </th>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>


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
<script src="<%=path%>/assets/myjs/searchTicket.js"></script>
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


    });
</script>
</body>
</html>
