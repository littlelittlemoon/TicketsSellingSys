var baseurl = "http://localhost:8899/TicketsSellingSys/";
var indexController = avalon.define({
    $id: "indexController",
    url: "",
    user: "",

    load: function () {
        $.ajax({
            type: "GET",
            url: baseurl + "loginController/currentuser",
            data: {},
            success: function (data) {
                indexController.url = "/" + data.url;
                indexController.user = data.model;
                sidebarController.check();
            }
        });
    }
});

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
    isMgr: "",

    //sidebar中通过此方法控制页面跳转
    skip: function (url) {
        window.location.href = baseurl + "director/" + url;
    },

    //根据权限控制功能
    check: function () {
        if (indexController.user.role.rolename == "管理员") {
            sidebarController.isMgr = true;
        }
        if (indexController.user.role.rolename == "售票员") {
            sidebarController.isMgr = false;
        }
    }
});

//当前登录用户信息页面控制器
var welcomeController = avalon.define({
    $id: "welcomeController",
    pwd1: "",               //原密码
    pwd2: "",               //新密码
    pwd3: "",               //确认新密码
    pwd1errormsg: "",
    pwd2errormsg: "",
    pwd3errormsg: "",
    validate: {
        onError: function (reasons) {
            reasons.forEach(function (reason) {
                console.log(reason.getMessage());
                if (reason.getMessage() == "请输入原密码") {
                    welcomeController.pwd1errormsg = reason.getMessage();
                }
                if (reason.getMessage() == "请输入新密码") {
                    welcomeController.pwd2errormsg = reason.getMessage();
                }
                if (reason.getMessage() == "两次密码输入不一致" || reason.getMessage() == "必须填写") {
                    welcomeController.pwd3errormsg = reason.getMessage();
                }
            })
        },
        onValidateAll: function (reasons) {
            if (reasons.length) {
                console.log('有表单没有通过')
            } else {
                console.log('全部通过');
            }
        }
    },

    changePwd: function () {
        if (welcomeController.pwd1 != indexController.user.userpass) {
            swal("原始密码错误", "请重试!", "error");
            welcomeController.pwd1 = "";
            welcomeController.pwd2 = "";
            welcomeController.pwd3 = "";
        } else {
            $.ajax({
                type: 'post',
                url: baseurl + 'User/ChangePwd',
                data: {
                    pwd: welcomeController.pwd2
                },
                success: function (data) {
                    swal({
                        title: data.msg,
                        text: "请重新登录",
                        type: "success",
                        closeOnConfirm: false,
                        confirmButtonText: "确定",
                        confirmButtonColor: "#ec6c62"
                    }, function (isConfirm) {
                        if (isConfirm) {
                            window.location.href = baseurl + "loginController/outLogin";
                        }
                    });
                }
            })
        }
    },
    changeImg: function () {
        // 使用ajax的ajaxFileUpload插件异步上传图片
        $.ajaxFileUpload({
            type: "post",
            url: baseurl + "User/doLoad",
            fileElementId: "file",
            success: function (data, status) {
                if (status == 'success') {
                    swal("上传成功", "头像将在10s之内更新", "success");
                    indexController.load();
                    $("#uploadModal").modal("hide");
                }
                else
                    swal("上传失败", "You clicked the button!", "warning");
            }
        })
    }
});
//通过avalon的$watch监控每个密码框的变化,不为空则把警告信息置空
welcomeController.$watch('pwd1', function (a, b) {
    if (b != '')
        welcomeController.pwd1errormsg = ""
});
welcomeController.$watch('pwd2', function (a, b) {
    if (b != '')
        welcomeController.pwd2errormsg = "";
    if ($('#form-field-1').val() == $('#form-field-2').val() || b != null)
        welcomeController.pwd3errormsg = ""
});
welcomeController.$watch('pwd3', function (a, b) {
    if ($('#form-field-1').val() == $('#form-field-2').val() || b != null)
        welcomeController.pwd3errormsg = ""
});
indexController.load();