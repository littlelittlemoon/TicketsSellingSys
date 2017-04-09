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
    <link rel="stylesheet" href="<%=path%>/assets/css/bootstrap-datetimepicker.css"/>
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
                <li class="active open">
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-desktop"></i>
                        <span class="menu-text"> 售票业务 </span>
                        <b class="arrow icon-angle-down"></b>
                    </a>
                    <ul class="submenu">
                        <li class="active">
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

                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-list"></i>
                        <span class="menu-text"> 信息查询</span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li href="javascript:void(0)" ms-click="@skip('SellTicketsInfo')">
                            <a href="javascript:void(0)">
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
                        <form class="form-horizontal" role="form" ms-class="@visible">
                            <div>
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
                                    <label style="margin-left: 10px;">出发时间：</label>

                                    <span class="input-icon input-icon-right">
                                        <div style="width: 250px;" class="input-group date form_date col-md-5"
                                             data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
                                             data-link-format="yyyy-mm-dd">
                                            <input class="form-control" size="16" type="text" value="" readonly
                                                   ms-duplex="@date">
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-calendar"></span></span>
                                        </div>
				                        <input type="hidden" id="dtp_input2" value=""/>
                                        <%--<div style="width: 250px;"--%>
                                             <%--class="input-group date form_datetime col-md-5"--%>
                                             <%--data-date-format="yyyy-mm-dd"--%>
                                             <%--data-link-field="dtp_input1">--%>
                                        <%--<input class="form-control" size="16" type="text" value="" readonly--%>
                                               <%--ms-duplex="@date">--%>
                                    <%--<span class="input-group-addon"><span--%>
                                            <%--class="glyphicon glyphicon-calendar"></span></span>--%>
                                    </span>

                                    <%--<input type="date" ms-duplex="@date"/>--%>
                                    <%--<i class="icon-calendar bigger-110"></i>--%>
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

                    </div>
                    <!-- /widget-body -->
                </div>
                <div ms-class="@visible" class="hide">
                    <div class="widget-header align-center header-color-blue">
                        <h5 class="bigger lighter ">
                            <i class="icon-table"></i>
                            <b>车 票 列 表</b>
                        </h5>

                    </div>
                    <div class="table-responsive">
                        <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>车次</th>
                                <th>出发站</th>
                                <th>目的站</th>
                                <th>出发时间</th>
                                <th>到达时间</th>
                                <th>站票</th>
                                <th>坐票</th>
                                <th>卧票</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ms-for="obj in @datalist">
                                <td class="center">{{obj.train.trainid}}</td>
                                <td class="center">{{obj.ticketinfolist[0].staStation}}</td>
                                <td class="center">{{obj.ticketinfolist[0].endStation}}</td>
                                <td class="center">{{obj.ticketinfolist[0].staTime}}</td>
                                <td class="center">{{obj.ticketinfolist[0].arrTime}}</td>
                                <td>
                                    <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                        <span class="label label-sm label-info" style="margin-right: 5px;">数量:</span>{{obj.train.standticketnum}}<br>
                                        <span class="label label-sm label-warning" style="margin-right: 5px;">票价:</span>{{obj.ticketinfolist[0].ticketprice}}
                                    </div>
                                </td>
                                <td>
                                    <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                        <span class="label label-sm label-info" style="margin-right: 5px;">数量:</span>{{obj.train.seatticketnum}}<br>
                                        <span class="label label-sm label-warning" style="margin-right: 5px;">票价:</span>{{obj.ticketinfolist[1].ticketprice}}
                                    </div>
                                </td>
                                <td>
                                    <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                        <span class="label label-sm label-info" style="margin-right: 5px;">数量:</span>{{obj.train.sleepticketnum}}<br>
                                        <span class="label label-sm label-warning" style="margin-right: 5px;">票价:</span>{{obj.ticketinfolist[2].ticketprice}}
                                    </div>
                                </td>

                                <td class="center">
                                    <button class="btn btn-sm btn-success" ms-click="@pay(obj)">
                                        <i class="icon-smile bigger-120"></i> 购票
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                </div>
                </div>

                <%--订单流程--%>
                <div class="widget-box hide" ms-class="@ordervisible" ms-controller="order">
                    <div class="widget-header widget-header-blue widget-header-flat">
                        <h5 class="lighter green"><b>填写订单信息</b></h5>
                    </div>

                    <div class="widget-body">
                        <div class="widget-main">
                            <div id="fuelux-wizard" class="row-fluid" data-target="#step-container">
                                <ul class="wizard-steps">
                                    <li data-target="#step1" class="active">
                                        <span class="step">1</span>
                                        <span class="title">确认车票信息</span>
                                    </li>

                                    <li data-target="#step2">
                                        <span class="step">2</span>
                                        <span class="title">提交订单</span>
                                    </li>

                                    <li data-target="#step3">
                                        <span class="step">3</span>
                                        <span class="title">售票成功</span>
                                    </li>
                                </ul>
                            </div>

                            <hr/>
                            <div class="step-content row-fluid position-relative" id="step-container">
                                <div class="step-pane active" id="step1">
                                    <h3 align="center" class="lighter block green">请确认你将要购买的车票信息</h3>
                                    <div class="row-fluid">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div class="table-responsive">
                                                    <table class="table table-striped table-bordered table-hover">
                                                        <thead>
                                                        <tr>
                                                            <th>出发车站</th>
                                                            <th>终点站</th>
                                                            <th class="hidden-480">
                                                                <i class="icon-time bigger-110 hidden-480"></i>
                                                                乘车时间
                                                            </th>

                                                            <th>全价（元）</th>
                                                            <th>剩余票数</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td class="align-center">
                                                                {{@order.ticketinfolist[0].staStation}}
                                                            </td>
                                                            <td class="align-center">
                                                                {{@order.ticketinfolist[0].endStation}}
                                                            </td>
                                                            <td class="hidden-480 align-center">
                                                                {{@order.ticketinfolist[0].staTime}}
                                                            </td>
                                                            <td>
                                                                <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                                                    <span class="label label-sm label-warning"
                                                                          style="margin-right: 5px;">站票:</span>{{@order.ticketinfolist[0].ticketprice}}<br>
                                                                    <span class="label label-sm label-warning"
                                                                          style="margin-right: 5px;">坐票:</span>{{@order.ticketinfolist[1].ticketprice}}<br>
                                                                    <span class="label label-sm label-warning"
                                                                          style="margin-right: 5px;">卧票:</span>{{@order.ticketinfolist[2].ticketprice}}
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                                                    <span class="label label-sm label-danger"
                                                                          style="margin-right: 5px;">还剩</span>{{@order.train.standticketnum}}<br>
                                                                    <span class="label label-sm label-danger"
                                                                          style="margin-right: 5px;">还剩</span>{{@order.train.seatticketnum}}<br>
                                                                    <span class="label label-sm label-danger"
                                                                          style="margin-right: 5px;">还剩</span>{{@order.train.sleepticketnum}}
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        </tbody>
                                                    </table>
                                            </div>
                                                <!-- /.table-responsive -->
                                        </div>
                                            <!-- /span -->
                                    </div>
                                        <!-- /row -->
                                </div>

                                </div>

                                <div class="step-pane" id="step2">
                                    <form class="form-horizontal" id="validation-form" method="get">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <!-- PAGE CONTENT BEGINS -->

                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="tabbable">
                                                            <ul class="nav nav-tabs" id="myTab">
                                                                <li class="active">
                                                                    <a data-toggle="tab" href="#home">
                                                                        <i class="green icon-edit bigger-110"></i>
                                                                        <b>请填写订单信息</b>
                                                                    </a>
                                                                </li>
                                                            </ul>

                                                            <div class="tab-content">
                                                                <form class="form-inline" id="orderform">
                                                                    <div id="home" class="tab-pane in active">
                                                                        <button type="button"
                                                                                class="btn btn-info btn-xs"
                                                                                ms-click="@addpassenger"
                                                                                style="margin-bottom: 10px;">
                                                                            添加乘车人
                                                                        </button>
                                                                        <span>&nbsp;&nbsp;</span>
                                                                        <button type="button"
                                                                                class="btn btn-danger btn-xs"
                                                                                ms-click="@delpassenger"
                                                                                style="margin-bottom: 10px;">
                                                                            删除一条
                                                                        </button>
                                                                        <span>&nbsp;&nbsp;</span>
                                                                        <span>站票：{{@order.ticketinfolist[0].ticketprice}}</span>
                                                                        <span>&nbsp;</span>
                                                                        <span>坐票：{{@order.ticketinfolist[1].ticketprice}}</span>
                                                                        <span>&nbsp;</span>
                                                                        <span>卧票： {{@order.ticketinfolist[2].ticketprice}}</span>

                                                                        <%--<button type="button"--%>
                                                                        <%--class="btn btn-info btn-xs"--%>
                                                                        <%--ms-click="@statistics"--%>
                                                                        <%--style="margin-bottom: 10px;">--%>
                                                                        <%--添加--%>
                                                                        <%--</button>--%>
                                                                        <%--<button type="button" ms-click="@delpassenger" class="btn btn-danger btn-xs">--%>
                                                                        <%--<i class="icon-trash smaller-20"></i> 删除一条--%>
                                                                        <%--</button>--%>

                                                                        <span> &nbsp;</span>
                                                                        <h5 class="inline" style="color: red">***
                                                                            温馨提示：最多可添加5名乘客 ***</h5>
                                                                        <div style="margin-bottom: 10px;">
                                                                            姓名：<input type="text"
                                                                                      class="input-small"
                                                                                      placeholder="乘车人姓名"/>
                                                                        <span>&nbsp;</span>
                                                                            身份证号：<input type="text"
                                                                                        class="input-large"
                                                                                        placeholder="身份证号码"/>
                                                                        <span>&nbsp;</span>
                                                                            座位类型：
                                                                            <select id="ticket" name="ticket"
                                                                                    class=""
                                                                                    data-placeholder="请选择票种类型...">
                                                                                <option selected>站票</option>
                                                                                <option>坐票</option>
                                                                                <option>卧票</option>
                                                                            </select>
                                                                            <span>&nbsp;</span>
                                                                            <span>&nbsp;&nbsp;&nbsp;</span>
                                                                    </div>
                                                                    </div>
                                                                </form>
                                                        </div>
                                                        </div>
                                                    </div><!-- /span -->
                                            </div>
                                            </div>
                                        </div><!-- /row -->
                                    </form>
                                </div>

                                <div class="step-pane" id="step3">
                                    <div class="center">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <!-- PAGE CONTENT BEGINS -->

                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="tabbable">
                                                            <ul class="nav nav-tabs" id="myTab2">
                                                                <li class="active">
                                                                    <a data-toggle="tab" href="#home">
                                                                        <i class="green icon-edit bigger-110"></i>
                                                                        <b>确认订单信息：</b>

                                                                    </a>
                                                                </li>
                                                            </ul>

                                                            <div class="tab-content" id="passengertab">
                                                                <div id="info" class="tab-pane in active">
                                                                    <b>乘车人数： {{@num+1}} 人</b><br>
                                                            </div>
                                                        </div>
                                                        </div>
                                                    </div><!-- /span -->
                                            </div>
                                            </div>
                                        </div><!-- /row -->
                                </div>
                            </div>
                            </div>

                            <hr/>
                            <div class="row-fluid wizard-actions">
                                <button class="btn btn-prev">
                                    <i class="icon-arrow-left"></i> 上一步
                                </button>

                                <button class="btn btn-success btn-next" data-last="Finish ">
                                    下一步
                                    <i class="icon-arrow-right icon-on-right"></i>
                                </button>
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
<script src="<%=path%>/assets/myjs/searchTicket.js"></script>
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


<script type="text/javascript">
    jQuery(function ($) {
        var oTable1 = $('#sample-table-2').dataTable({
            "aoColumns": [
                {"bSortable": false},
                null, null, null, null, null,
                {"bSortable": false}
            ]
        });


        $('table th input:checkbox').on('click', function () {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                    .each(function () {
                        this.checked = that.checked;
                        $(this).closest('tr').toggleClass('selected');
                    });

        });


        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table');
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
            return 'left';
        }
    })
</script>

<script type="text/javascript">
    jQuery(function ($) {
        $('[data-rel=tooltip]').tooltip();
        $(".select2").css('width', '200px').select2({
            allowClear: true
        })
                .on('change', function () {
                    $(this).closest('form').validate().element($(this));
                });
        var $validation = false;
        $('#fuelux-wizard').ace_wizard().on('change', function (e, info) {
            if (info.step == 1 && $validation) {
                if (!$('#validation-form').valid()) return false;
            }
        }).on('finished', function (e) {
            order.statistics();
        }).on('stepclick', function (e) {
            //return false;//prevent clicking on steps
        });
        $('#skip-validation').removeAttr('checked').on('click', function () {
            $validation = this.checked;
            if (this.checked) {
                $('#sample-form').hide();
                $('#validation-form').removeClass('hide');
            } else {
                $('#validation-form').addClass('hide');
                $('#sample-form').show();
            }
        });
        //documentation : http://docs.jquery.com/Plugins/Validation/validate
        $.mask.definitions['~'] = '[+-]';
        $('#phone').mask('(999) 999-9999');
        jQuery.validator.addMethod("phone", function (value, element) {
            return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
        }, "Enter a valid phone number.");
        $('#validation-form').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true,
                    minlength: 5
                },
                password2: {
                    required: true,
                    minlength: 5,
                    equalTo: "#password"
                },
                name: {
                    required: true
                },
                phone: {
                    required: true,
                    phone: 'required'
                },
                url: {
                    required: true,
                    url: true
                },
                comment: {
                    required: true
                },
                state: {
                    required: true
                },
                platform: {
                    required: true
                },
                subscription: {
                    required: true
                },
                gender: 'required',
                agree: 'required'
            },
            messages: {
                email: {
                    required: "Please provide a valid email.",
                    email: "Please provide a valid email."
                },
                password: {
                    required: "Please specify a password.",
                    minlength: "Please specify a secure password."
                },
                subscription: "Please choose at least one option",
                gender: "Please choose gender",
                agree: "Please accept our policy"
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                $('.alert-danger', $('.login-form')).show();
            },
            highlight: function (e) {
                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
            },
            success: function (e) {
                $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
                $(e).remove();
            },
            errorPlacement: function (error, element) {
                if (element.is(':checkbox') || element.is(':radio')) {
                    var controls = element.closest('div[class*="col-"]');
                    if (controls.find(':checkbox,:radio').length > 1) controls.append(error);
                    else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                } else if (element.is('.select2')) {
                    error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                } else if (element.is('.chosen-select')) {
                    error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                } else error.insertAfter(element.parent());
            },
            submitHandler: function (form) {
            },
            invalidHandler: function (form) {
            }
        });
        $('#modal-wizard .modal-header').ace_wizard();
        $('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');
    });

    <!-- inline scripts related to this page -->
    //    $('.form_datetime').datetimepicker({
    //        //language:  'fr',
    //        weekStart: 1,
    //        todayBtn: 1,
    //        autoclose: 1,
    //        todayHighlight: 1,
    //        startView: 2,
    //        forceParse: 0,
    //        showMeridian: 0,
    //        startDate: new Date()
    //    });
    $('.form_date').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        startDate: new Date()
    });

</script>
</body>
</html>
