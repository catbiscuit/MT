/** layuiAdmin.std-v1.1.0 LPPL License By http://www.layui.com/admin/ */
;
//extend设置别名
layui.extend({
    setter: "config",
    admin: "lib/admin",
    view: "lib/view"
}).define(["setter", "admin"], function (a) {
    var e = layui.setter,
    i = layui.element,
    n = layui.admin,
    t = n.tabsPage,
    d = layui.view,
    l = function (a, d) {
        var l,
            b = r("#LAY_app_tabsheader>li"),//获取tab页的导航标题
        y = a.replace(/(^http(s*):)|(\?[\s\S]*$)/g, "");//替换特殊字符和标记
        if (b.each(function (e) { var i = r(this), n = i.attr("lay-id"); n === a && (l = !0, t.index = e) }), d = d || "新标签页", e.pageTabs)
            l || (r(s).append(['<div class="layadmin-tabsbody-item layui-show">', '<iframe src="' + a + '" frameborder="0" class="layadmin-iframe"></iframe>', "</div>"].join("")), t.index = b.length, i.tabAdd(o, { title: "<span>" + d + "</span>", id: a, attr: y }));
        else {
            var u = n.tabsBody(n.tabsPage.index).find(".layadmin-iframe");
            u[0].contentWindow.location.href = a
        }
        i.tabChange(o, a),//切换到当前标签
        n.tabsBodyChange(t.index, {
            url: a,
            text: d
        })
    },
    s = "#LAY_app_body",
    o = "layadmin-layout-tabs",
    r = layui.$;
    r(window);
    n.screen() < 2 && n.sideFlexible(),
    layui.config({
        base: e.base + "modules/"
    }),
    /*加载第三方插件ECharts，不需要*/
    //layui.each(e.extend,
    //function (a, i) {
    //    var n = {};
    //    n[i] = "{/}" + e.base + "lib/extend/" + i,
    //    layui.extend(n)
    //}),
    d().autoRender(),
    layui.use("common"),
    a("index", { openTabsPage: l })//输出一个index的模块，回调函数为:openTabsPage: l
});