var baseurl = "http://localhost:8899/TicketsSellingSys/";

/**
 * 列车时刻表控制器
 */
var TimeTableController = avalon.define({
    $id: "TimeTableController",
    trainlist: "",
    datalist: "",
    url: "",

    load: function () {
        TimeTableController.loadTrain();
        $.ajax({
            type: "GET",
            url: baseurl + "loginController/currentuser",
            data: {},
            success: function (data) {
                TimeTableController.url = "/" + data.url;
                TimeTableController.user = data.model;
            }
        });
    },

    loadTrain: function () {
        $.ajax({
            type: 'get',
            url: baseurl + 'TimeAndPrice/trainlist',
            data: {},
            success: function (data) {
                TimeTableController.trainlist = data.model.results;
            }
        });
    },

    search: function () {
        $.ajax({
            type: 'post',
            url: baseurl + 'TimeAndPrice/searchTable',
            data: {
                trainid: jQuery("#selected option:selected").text()
            },
            success: function (data) {
                TimeTableController.datalist = data.items;
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
TimeTableController.load();