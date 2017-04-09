//退票页面控制器

var baseurl = "http://localhost:8899/TicketsSellingSys/";
var returnTicketsController = avalon.define({
    $id: "returnTicketsController",
    pageSize: 5,
    pageCurrent: 1,
    pageTotle: 0,
    keyword: "",
    datalist: "",
    url: "",

    load: function () {
        returnTicketsController.refreshlist();
        $.ajax({
            type: "GET",
            url: baseurl + "loginController/currentuser",
            data: {},
            success: function (data) {
                returnTicketsController.url = "/" + data.url;
                returnTicketsController.user = data.model;
            }
        });
    },

    //加载已购的所有订单
    refreshlist: function () {
        $.ajax({
            type: "POST",
            url: baseurl + "order/OrderListOnlyBuy",
            data: {
                pageSize: returnTicketsController.pageSize,
                pageCurrent: returnTicketsController.pageCurrent,
                keyword: returnTicketsController.keyword
            },
            success: function (data) {
                returnTicketsController.datalist = data.model.results;
                returnTicketsController.pageTotle = data.model.totalPage;
            }
        });
    },

    search: function () {
        returnTicketsController.pageCurrent = 1;
        returnTicketsController.refreshlist();
    },

    firstPage: function () {
        returnTicketsController.pageCurrent = 1;
        returnTicketsController.refreshlist();
    },
    lastPage: function () {
        returnTicketsController.pageCurrent = returnTicketsController.pageTotle;
        returnTicketsController.refreshlist();
    },
    previousPage: function () {
        if (returnTicketsController.pageCurrent == 1) {
            swal("当前为第一页!");
            return;
        }
        returnTicketsController.pageCurrent--;
        returnTicketsController.refreshlist();

    },
    nextPage: function () {
        if (returnTicketsController.pageCurrent == returnTicketsController.pageTotle) {

            swal("当前为最后一页!");
            return;
        }
        returnTicketsController.pageCurrent++;
        returnTicketsController.refreshlist();
    },

    //执行退票操作
    returnTicket: function (idcard) {
        swal({
            title: "您确定要退票吗？",
            text: "",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "是的，确定退票",
            confirmButtonColor: "#ec6c62"
        }, function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    type: 'post',
                    url: baseurl + 'order/executeReturn',
                    data: {
                        idcard: idcard
                    },
                    success: function (data) {
                        if (data.success == true) {
                            swal(data.msg, "You clicked the button!", "success")
                        }
                        else {
                            swal(data.msg, "You clicked the button!", "error")
                        }
                        returnTicketsController.refreshlist();
                    }
                });
            }
        });
    }
});


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
returnTicketsController.load();