//车票查询控制器
var baseurl = "http://localhost:8899/TicketsSellingSys/";
var searchTicketController = avalon.define({
    $id: "searchTicketController",
    url: "",
    user: "",
    date: "",
    stalist: "",
    endlist: "",
    datalist: "",
    order: "",

    load: function () {
        searchTicketController.staStation();
        searchTicketController.endStation();
        $.ajax({
            type: "GET",
            url: baseurl + "loginController/currentuser",
            data: {},
            success: function (data) {
                searchTicketController.url = "/" + data.url;
                searchTicketController.user = data.model;
            }
        });
    },

    staStation: function () {
        $.ajax({
            type: 'get',
            url: baseurl + "search/Stationlist",
            data: {
                type: 'sta'
            },
            success: function (data) {
                searchTicketController.stalist = data.items;
            }
        });
    },

    endStation: function () {
        $.ajax({
            type: 'get',
            url: baseurl + "search/Stationlist",
            data: {
                type: 'end'
            },
            success: function (data) {
                searchTicketController.endlist = data.items;
            }
        });
    },

    visible: "",
    // 根据车站以及时间查询
    search: function () {
        $.ajax({
            type: 'post',
            url: baseurl + 'search/detail',
            data: {
                start: jQuery("#selected1 option:selected").text(),
                end: jQuery("#selected2 option:selected").text(),
                date: searchTicketController.date
            },
            success: function (data) {
                searchTicketController.visible = "show",
                    searchTicketController.datalist = data.items;
            }
        });
    },

    //根据车站查询票价
    searchprice: function () {
        $.ajax({
            type: 'post',
            url: baseurl + 'search/Pricelist',
            data: {
                start: jQuery("#selected1 option:selected").text(),
                end: jQuery("#selected2 option:selected").text(),
                date: searchTicketController.date
            },
            success: function (data) {
                searchTicketController.visible = "show",
                    searchTicketController.datalist = data.items;
            }
        });
    },

    ordervisible: "",
    pay: function (data) {
        order.order = data;
        $(".widget-box").show();
        searchTicketController.visible = "hide";
        searchTicketController.ordervisible = "show";
    }
});

var order = avalon.define({
        $id: "order",
        order: "",
        passname: "",
        idcard: "",
        selected: "",
        price: "",
        num: 0,

        submit: function (json) {
            $.ajax({
                type: 'POST',
                url: baseurl + 'order/executeOrder',
                data: {
                    json: JSON.stringify(order.order),
                    orderinfo: JSON.stringify(json)
                },
                success: function (data) {
                    if (data.success == true) {
                        // sidebarController.skip('searchTickets');
                        var list = data.items;
                        var price = 0;
                        var failnum = 0;
                        for (var i = 0; i < list.length; i++) {
                            var msg = "购票成功";
                            if (list[i].success == false) {
                                msg = "重复购买";
                                failnum++;
                            } else {
                                price = price + list[i].passengerInfo.ticketInfo.price;
                            }
                            var result =
                                '<div style="margin-top: 10px">姓名：<input type="text" class="input-small" value="' + list[i].passengerInfo.pid + '" readonly/><span>&nbsp;</span>'
                                + '身份证号：<input type="text" class= "input-large" value="' + list[i].passengerInfo.pname + '" readonly/>'
                                + '<span>&nbsp;</span>座位类型：<input type="text" class="input-small" value="' + list[i].passengerInfo.ticketInfo.seat.seatname + '" readonly/>' +
                                '<span>&nbsp;</span>票价：<input type="text" class="input-small" value="' + list[i].passengerInfo.ticketInfo.price + '" readonly/>'
                                + '<span style="color: red">&nbsp;' + msg + '</span>'
                                + '</div><br>';
                            $("#passengertab").append(result);
                        }
                        $("#passengertab").append("<span style='font-size: 30px;margin-top: 20px;'>总价为：" + price + "</span>");
                        if (failnum == 0) {
                            swal("操作成功", "", "success");
                        }
                        else {
                            swal("操作成功", "有" + failnum + "张车票购买失败", "error");
                        }
                    }
                },
            });
        },

        addpassenger: function () {
            if (order.num < 4) {
                var result = '<div style="margin-bottom: 10px;">姓名：' +
                    '<input type="text" class="input-small" placeholder="乘车人姓名" />' +
                    ' <span>&nbsp;</span>身份证号：<input type="text" class="input-large" ' +
                    'placeholder="身份证号码" /> <span>&nbsp;</span>座位类型： <select id="ticket" ' +
                    'name="ticket" class="" data-placeholder="请选择票种类型..."ms-duplex="@selected"> ' +
                    '<option selected>站票</option> <option>坐票</option> <option>卧票</option> </select> ' +
                    '<span>&nbsp;</span>';
                $("#home").append(result);
                order.num++;
            }
            else {
                swal("每个人最多只能购买5张车票！", "", "error");
            }
        }

        ,

        delpassenger: function () {
            if (order.num >= 1) {
                order.num--;
                $("#home div").last("div").remove();
                $("#passengertab div").last("div").remove();
            } else {
                swal("至少要购买1张车票！", "", "error");
            }
        },

        statistics: function () {
            var obj = $("#home div");
            var json = [];
            var flag = 0;
            for (var i = 0; i < obj.length; i++) {
                var div = $("#home div:eq(" + i + ")");
                var select = div.children("select").val();
                var input = div.children("input:eq(0)").val();
                var input1 = div.children("input:eq(1)").val();
                if (input == "" || select == "" || input1 == "") {
                    swal("请填写完整的乘车人信息", "", "error");
                    flag++;
                    break;
                } else {
                    var arr = {
                        idcard: input,
                        name: input1,
                        seat: select
                    };
                    json.push(arr);
                }
            }
            if (flag == 0)
                order.submit(json);
        }
        ,
        exe: function (json) {
            $.ajax({
                type: "post",
                url: baseurl + "test/testajax",
                data: {
                    json: JSON.stringify(json),
                },
                datatype: "json",
                success: function (data) {
                    alert(data.msg)
                }
            });
        }

    })
    ;

// 顶部navbar控制器
var navbarController = avalon.define({
    $id: "navbarController",
    outlogin: function () {
        swal({
            title: "您确定要退出吗？",
            text: "",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "是的，我要退出",
            confirmButtonColor: "#ec6c62"
        }, function () {
            window.location.href = baseurl + "loginController/outLogin";
        });
    },
});

var sidebarController = avalon.define({
    $id: "sidebarController",

    //sidebar中通过此方法控制页面跳转
    skip: function (url) {
        window.location.href = baseurl + "director/" + url;
    },
});
searchTicketController.load();