$(function () {
    validateRule();
    $("#inlineRadio2").click(function () {
        $("#phonenumber").show();
        $("#phonenumber-error").show();
    });
    $("#inlineRadio3").click(function () {
        $("#phonenumber").show();
        $("#phonenumber-error").show();
    });
    $("#inlineRadio1").click(function () {
        $("#phonenumber").hide();
        $("#phonenumber-error").hide();
    });
});

$.validator.setDefaults({
    submitHandler: function () {
        reg();
    }
});

function reg() {
    $.modal.loading($("#regBtn").data("loading"));
    var username = $.common.trim($("input[name='loginName']").val());
    var password = $.common.trim($("input[name='password']").val());
    var phonenumber = $.common.trim($("input[name='phonenumber']").val());
    var userType = $.common.trim($('input:radio:checked').val());
    // console.log("用户类型");
    // if (userType != 1) {
    //     $.modal.msg("老师或者学生社长必须填写手机号");
    // }
    $.ajax({
        type: "post",
        dataType: "json",
        url: ctx + "register",
        data: {
            "loginName": username,
            "password": password,
            "phonenumber": phonenumber,
            "userType": userType
        },
        success: function (r) {
            if (r.code == 0) {
                $.modal.msg(r.msg);
                location.href = ctx + 'login';
            } else {
                $.modal.closeLoading();
                $.modal.msg(r.msg);
            }
        }
    });
}

function validateRule() {
    var icon = "<i class='fa fa-times-circle'></i> ";
    // $.validator.addMethod("af", function (value, element, params) {
    //     console.log("value is " ,value)
    //     console.log("params is " ,params)
    //     if (params == 1) {
    //         return false;
    //     }else if (value){
    //
    //     }else {
    //         return true;
    //     }
    // }, "老师或者学生社长必须填写手机号");

    jQuery.validator.addMethod("isMobile", function(value, element) {
        var length = value.length;
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    }, "请正确填写手机号码");
    $("#regFrom").validate({
        rules: {
            loginName: {
                required: true
            },
            password: {
                required: true
            },
            password2: {
                required: true
            },
            phonenumber: {
                required: true,
                isMobile: true,
                minlength : 11
            },
        },
        messages: {
            loginName: {
                required: icon + "请输入您的用户名",
            },
            password: {
                required: icon + "请输入您的密码",
            },
            password2: {
                required: icon + "请输入您的密码",
                equalTo: icon + "确认密码与密码不同"
            },
            phonenumber: {
                required: icon + "老师或者学生社长必须填写手机号",
                isMobile: icon + "请填写正确手机号",
                minlength: icon + "不能小于11位"
            }
        }
    })
}
