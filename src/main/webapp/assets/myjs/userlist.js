var baseurl = "http://localhost:8899/TicketsSellingSys/";

var userlistController = avalon.define({
    $id: "userlistController",
    datalist: "",
    user: "",
    url: "",

    load: function () {
        userlistController.refreshlist();
        $.ajax({
            type: "GET",
            url: baseurl + "loginController/currentuser",
            data: {},
            success: function (data) {
                userlistController.url = "/" + data.url;
                userlistController.user = data.model;
            }
        });
    },

    //加载所有用户
    refreshlist: function () {
        $.ajax({
            type: "POST",
            url: baseurl + "User/Userlist",
            data: {},
            success: function (data) {
                userlistController.datalist = data.items;
            }
        });
    },

    edit: function (obj) {
        userlistController.user = obj;
    },

    executeEdit: function () {
        $.ajax({
            type: "post",
            url: baseurl + "User/Edituser",
            data: {
                userid: userlistController.user.userid,
                username: $("#username").val(),
                userpass: $("#userpass").val(),
                usersex: $("#usersex").val(),
                roleid: $("#selected").val(),
                rolename: $("#selected option:selected").text()
            },
            success: function (data) {
                if (data.success == true) {
                    swal(data.msg, "", "success");
                    $("#modal-form").modal("hide");
                    userlistController.refreshlist();
                }
                else
                    swal(data.msg, "", "error");
            }
        });
    },

    del: function (id) {
        swal({
            title: "您确定要删除吗？",
            text: "",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "是的，确定删除",
            confirmButtonColor: "#ec6c62"
        }, function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    type: 'post',
                    url: baseurl + 'User/Deluser',
                    data: {
                        id: id
                    },
                    success: function (data) {
                        if (data.success == true) {
                            swal(data.msg, "You clicked the button!", "success")
                        }
                        else {
                            swal(data.msg, "You clicked the button!", "error")
                        }
                        userlistController.refreshlist();
                    }
                });
            }
        });

    },

    adduser: function () {
        $.ajax({
            type: "post",
            url: baseurl + "User/Adduser",
            data: {
                username: $("#form-field-1").val(),
                userpass: $("#form-field-2").val(),
                usersex: $("#selected1 option:selected").text(),
                roleid: $("#selected2").val(),
                rolename: $("#selected2 option:selected").text()
            },
            success: function (data) {
                if (data.success == true) {
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
                else
                    swal(data.msg, "", "error");
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
userlistController.load();