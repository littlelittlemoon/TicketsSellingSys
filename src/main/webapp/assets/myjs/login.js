/**
 * Created by LUOLIANG on 2016/5/14.
 */
/*
 avalon将所有前端代码彻底分成两部分，视图的处理通过绑定实现（angular有个更炫酷的名词叫指令），
 业务逻辑则集中在一个个叫VM的对象中处理。我们只要操作VM的数据，它就自然而然地神奇地同步到视图。
 显然所有神秘都有其内幕，C#是通过一种叫访问器属性的语句实现，那么JS也有对应的东西。
 感谢上帝，IE8最早引入这东西（Object.defineProperty），可惜有BUG，但带动了其他浏览器实现它，
 IE9+便能安全使用它。 对于老式IE，我找了好久，实在没有办法，使用VBScript实现了。
 Object.defineProperty或VBS的作用是将对象的某一个属性，转换一个setter与getter，
 我们只要劫持这两个方法，通过Pub/Sub模式就能偷偷操作视图。为了纪念WPF的指引，
 我将此项目以WPF最初的开发代号avalon来命名。 它真的能让前端人员脱离DOM的苦海，来到数据的乐园中！
 avalon的所有指令都是以ms-*命名,ms是用纪念我之前的一个框架mass Framework!*/

// avalon登录控制器
var loginController = avalon.define({
    $id: "loginController",
    name: "",   //用户名对象
    pwd: "",    //密码对象
    nameerrormsg: "",
    pwderrormsg: "",
    validate: {
        onError: function (reasons) {
            reasons.forEach(function (reason) {
                console.log(reason.getMessage());
                if (reason.getMessage() == "用户名不能为空")
                    loginController.nameerrormsg = reason.getMessage();
                if (reason.getMessage() == "密码不能为空")
                    loginController.pwderrormsg = reason.getMessage()
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
    login: function () {
        $.ajax({
            type: 'POST',
            url: 'loginController/isLogin',
            data: {
                name: loginController.name,
                pwd: loginController.pwd
            },
            success: function (data) {
                if (data.success == true) {
                    window.location.href = "director/index";
                } else {
                    swal("用户名或密码错误", "请重新输入!", "error")
                }
            },
            error: function (e) {
                swal("请求异常", "You clicked the button!", "warning")
            }
        })
    }
});
loginController.$watch("name", function (a, b) {
    if (b != "")
        loginController.nameerrormsg = "";
});
loginController.$watch("pwd", function (a, b) {
    if (b != "")
        loginController.pwderrormsg = "";
});