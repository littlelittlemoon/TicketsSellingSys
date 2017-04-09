var baseurl = "http://localhost:8899/TicketsSellingSys/";

var SellTicketsInfoController = avalon.define({
    $id: "SellTicketsInfoController",
    user: "",
    pageSize: 5,
    pageCurrent: 1,
    pageTotle: 0,
    keyword: "",
    datalist: "",
    url: "",

    load: function () {
        SellTicketsInfoController.refreshlist();
        $.ajax({
            type: "GET",
            url: baseurl + "loginController/currentuser",
            data: {},
            success: function (data) {
                SellTicketsInfoController.url = "/" + data.url;
                SellTicketsInfoController.user = data.model;
            }
        });
    },

    //加载已购的所有订单
    refreshlist: function () {
        $.ajax({
            type: "POST",
            url: baseurl + "order/OrderList",
            data: {
                pageSize: SellTicketsInfoController.pageSize,
                pageCurrent: SellTicketsInfoController.pageCurrent,
                keyword: SellTicketsInfoController.keyword
            },
            success: function (data) {
                SellTicketsInfoController.datalist = data.model.results;
                SellTicketsInfoController.pageTotle = data.model.totalPage;
            }
        });
    },

    search: function () {
        SellTicketsInfoController.pageCurrent = 1;
        SellTicketsInfoController.refreshlist();
    },

    firstPage: function () {
        SellTicketsInfoController.pageCurrent = 1;
        SellTicketsInfoController.refreshlist();
    },
    lastPage: function () {
        SellTicketsInfoController.pageCurrent = SellTicketsInfoController.pageTotle;
        SellTicketsInfoController.refreshlist();
    },
    previousPage: function () {
        if (SellTicketsInfoController.pageCurrent == 1) {
            swal("当前为第一页!");
            return;
        }
        SellTicketsInfoController.pageCurrent--;
        SellTicketsInfoController.refreshlist();

    },
    nextPage: function () {
        if (SellTicketsInfoController.pageCurrent == SellTicketsInfoController.pageTotle) {

            swal("当前为最后一页!");
            return;
        }
        SellTicketsInfoController.pageCurrent++;
        SellTicketsInfoController.refreshlist();
    },
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
SellTicketsInfoController.load();