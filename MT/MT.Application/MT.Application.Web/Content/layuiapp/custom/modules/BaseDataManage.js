/** layuiAdmin.std-v1.2.0 LPPL License By http://www.layui.com/admin/ */;
layui.define(["table", "form"], function (e) {
    var t = layui.$,
        i = layui.table;
    layui.form;
    i.render({
        elem: "#LAY-DataItem-List",
        url: '/SystemManage/BaseDataManage/GetDataItemList',
        cols: [
            [{
                type: "checkbox",
                fixed: "left",
            }, {
                field: "F_ID",
                width: 2,
                title: "主键",
                hide: true
            }, {
                field: "F_ItemCode",
                title: "字典编码",
                minWidth: 50
            }, {
                field: "F_ItemName",
                title: "字典名称",
                minWidth: 50,
            }, {
                field: "F_Sort",
                title: "排序",
                width: 20,
                sort: true
            }, {
                field: "F_isEnable",
                title: "是否可用"
            }, {
                field: "F_AddUserName",
                width: 100,
                title: "录入人"
            }, {
                field: "F_AddTime",
                title: "录入时间",
                sort: true
            }, {
                field: "F_Remark",
                title: "备注",
                width: 200
            }, {
                title: "操作",
                width: 150,
                align: "center",
                fixed: "right",
                toolbar: "#table-useradmin-webuser"
            }]
        ],
        page: true,
        limit: 30,
        text: "对不起，加载出现异常！"
    }), i.on("tool(LAY-DataItem-List)", function (e) {
        e.data;
        if ("del" === e.event) layer.prompt({
            formType: 1,
            title: "敏感操作，请验证口令"
        }, function (t, i) {
            layer.close(i), layer.confirm("确定删除此管理员？", function (t) {
                console.log(e), e.del(), layer.close(t)
            })
        });
        else if ("edit" === e.event) {
            t(e.tr);
            layer.open({
                type: 2,
                title: "编辑管理员",
                content: "../../../views/user/administrators/adminform.html",
                area: ["420px", "420px"],
                btn: ["确定", "取消"],
                yes: function (e, t) {
                    var l = window["layui-layer-iframe" + e],
                        r = "LAY-user-back-submit",
                        n = t.find("iframe").contents().find("#" + r);
                    l.layui.form.on("submit(" + r + ")", function (t) {
                        t.field;
                        i.reload("LAY-user-front-submit"), layer.close(e)
                    }), n.trigger("click")
                }, success: function (e, t) { }
            })
        }
    }),
    e("BaseDataManage", {})
});