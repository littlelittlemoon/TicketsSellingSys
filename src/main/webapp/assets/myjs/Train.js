var baseurl = "http://localhost:8899/TicketsSellingSys/";
var trainlist = avalon.define({
        $id: "TrainlistController",
        pageSize: 5,
        pageCurrent: 1,
        pageTotle: 0,
        keyword: "",
        datalist: "",
        url: "",
        user: "",
        stalist: "",
        endlist: "",
        train: {         //定义一个train对象包含train的所有属性
            trainid: "",
            carid: "",
            startstation: "",
            endstation: "",
            starttime: "",
            arrtime: "",
            distance: "",
            standticketnum: "",
            seatticketnum: "",
            sleepticketnum: ""
        },

        priceinfo: {         //定义一个train对象包含train的所有属性
            trainid: "",
            startstation: "",
            endstation: "",
            starttime: "",
            arrtime: "",
            distance: "",
            seat: "站票",
            price: ""
        },

        load: function () {
            trainlist.refreshlist();
            trainlist.staStation();
            trainlist.endStation();
            $.ajax({
                type: "GET",
                url: baseurl + "loginController/currentuser",
                data: {},
                success: function (data) {
                    trainlist.url = "/" + data.url;
                    trainlist.user = data.model;
                }
            });
        },

        //请求起始站的json
        staStation: function () {
            $.ajax({
                type: 'get',
                url: baseurl + "search/Stationlist",
                data: {
                    type: 'sta'
                },
                success: function (data) {
                    trainlist.stalist = data.items;
                }
            });
        },

        //请求终点站的json
        endStation: function () {
            $.ajax({
                type: 'get',
                url: baseurl + "search/Stationlist",
                data: {
                    type: 'end'
                },
                success: function (data) {
                    trainlist.endlist = data.items;
                }
            });
        },

        //加载列车
        refreshlist: function () {
            $.ajax({
                type: "POST",
                url: baseurl + "Train/trainlist",
                data: {
                    pageSize: trainlist.pageSize,
                    pageCurrent: trainlist.pageCurrent,
                    keyword: trainlist.keyword
                },
                success: function (data) {
                    trainlist.datalist = data.model.results;
                    trainlist.pageTotle = data.model.totalPage;
                }
            });
        },

        search: function () {
            trainlist.pageCurrent = 1;
            trainlist.refreshlist();
        },

        firstPage: function () {
            trainlist.pageCurrent = 1;
            trainlist.refreshlist();
        },
        lastPage: function () {
            trainlist.pageCurrent = trainlist.pageTotle;
            trainlist.refreshlist();
        },
        previousPage: function () {
            if (trainlist.pageCurrent == 1) {
                swal("当前为第一页!");
                return;
            }
            trainlist.pageCurrent--;
            trainlist.refreshlist();

        },
        nextPage: function () {
            if (trainlist.pageCurrent == trainlist.pageTotle) {

                swal("当前为最后一页!");
                return;
            }
            trainlist.pageCurrent++;
            trainlist.refreshlist();
        },

        addTrain: function () {
            if ($("input").val() == "" || trainlist.train.starttime == "" || trainlist.train.arrtime == "") {
                swal("请填写完整信息");
            } else {
                $.ajax({
                    type: "post",
                    url: baseurl + "Train/addTrain",
                    data: {
                        carid: trainlist.train.carid,
                        sStation: jQuery("#selected1 option:selected").text(),
                        eStation: jQuery("#selected2 option:selected").text(),
                        starttime: trainlist.train.starttime,
                        arrtime: trainlist.train.arrtime,
                        distance: trainlist.train.distance,
                        standticketnum: trainlist.train.standticketnum,
                        seatticketnum: trainlist.train.seatticketnum,
                        sleepticketnum: trainlist.train.sleepticketnum
                    },
                    success: function (data) {
                        swal({
                            title: data.msg,
                            text: "",
                            type: "success",
                            closeOnConfirm: false,
                            confirmButtonText: "OK",
                            confirmButtonColor: "#ec6c62"
                        }, function (isConfirm) {
                            if (isConfirm) {
                                window.location.reload();
                            }
                        });
                    }
                });
            }
        },

        editTrain: function (train) {
            $("#traintable").addClass("hide");
            $("#edittable").removeClass("hide");
            trainlist.train = train;
            //循环为select赋值
            var count = $("#selected4").get(0).options.length;
            for (var i = 0; i < count; i++) {
                if ($("#selected4").get(0).options[i].text == trainlist.train.startstation.stationname) {
                    $("#selected4").get(0).options[i].selected = true;
                    break;
                }
            }
            var count1 = $("#selected5").get(0).options.length;
            for (var i = 0; i < count1; i++) {
                if ($("#selected5").get(0).options[i].text == trainlist.train.endstation.stationname) {
                    $("#selected5").get(0).options[i].selected = true;
                    break;
                }
            }
        },

        //执行更新
        updateTrain: function () {
            $.ajax({
                type: "post",
                url: baseurl + "Train/updateTrain",
                data: {
                    trainid: trainlist.train.trainid,
                    carid: trainlist.train.carid,
                    sStation: jQuery("#selected4 option:selected").text(),
                    eStation: jQuery("#selected5 option:selected").text(),
                    starttime: trainlist.train.starttime,
                    arrtime: trainlist.train.arrtime,
                    distance: trainlist.train.distance,
                    standticketnum: trainlist.train.standticketnum,
                    seatticketnum: trainlist.train.seatticketnum,
                    sleepticketnum: trainlist.train.sleepticketnum
                },
                success: function (data) {
                    swal({
                        title: data.msg,
                        text: "",
                        type: "success",
                        closeOnConfirm: false,
                        confirmButtonText: "OK",
                        confirmButtonColor: "#ec6c62"
                    }, function (isConfirm) {
                        if (isConfirm) {
                            window.location.reload();
                        }
                    });
                }
            });
        },

        delTrain: function (trainid) {
            swal({
                title: "确定删除？",
                text: "",
                type: "warning",
                showCancelButton: true,
                closeOnConfirm: false,
                confirmButtonText: "OK",
                confirmButtonColor: "#ec6c62"
            }, function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        type: "post",
                        url: baseurl + "Train/delTrain",
                        data: {
                            trainid: trainid
                        },
                        success: function (data) {
                            swal({
                                title: data.msg,
                                text: "",
                                type: "success",
                                closeOnConfirm: false,
                                confirmButtonText: "OK",
                                confirmButtonColor: "#ec6c62"
                            }, function (isConfirm) {
                                if (isConfirm) {
                                    window.location.reload()
                                }
                            })
                        },
                        }
                    );
                }
            });

        },

        addPriceinfo: function (train) {
            $("#traintable").addClass("hide");
            $("#addForm").removeClass("hide");
            trainlist.priceinfo.trainid = train.trainid;
            trainlist.train = train;
        }
        ,

        savepriceinfo: function () {
            if (trainlist.priceinfo.starttime == "" || trainlist.priceinfo.arrtime == "" || trainlist.priceinfo.distance == "" || trainlist.priceinfo.price == "") {
                swal("请填写完整", "", "error");
            } else
                $.ajax({
                    type: "post",
                    url: baseurl + "PriceInfo/addPriceInfo",
                    data: {
                        trainid: trainlist.priceinfo.trainid,
                        seat: trainlist.priceinfo.seat,
                        stastation: jQuery("#selected1 option:selected").text(),
                        endstation: jQuery("#selected2 option:selected").text(),
                        starttime: trainlist.priceinfo.starttime,
                        arrtime: trainlist.priceinfo.arrtime,
                        distance: trainlist.priceinfo.distance,
                        price: trainlist.priceinfo.price
                    },
                    success: function (data) {
                        swal({
                            title: data.msg,
                            text: "",
                            type: "success",
                            closeOnConfirm: false,
                            confirmButtonText: "OK",
                            confirmButtonColor: "#ec6c62"
                        }, function (isConfirm) {
                            if (isConfirm) {
                                window.location.reload();
                            }
                        });
                    },
                });
        }
        ,
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
trainlist.load();