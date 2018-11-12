;
layui.define(["layer"], function (e) {
    var layer = layui.layer;
    $.post("/Home/GetPermissions", [],
    function (result) {
        var resultJson = JSON.parse(result);
        if (resultJson.code == "1") {
            if (resultJson.data.length > 0) {
                var MenuData = JSON.parse(resultJson.data);
                var _html = LoadFirstMenu(MenuData);
                $("#LAY-system-side-menu").html(_html);
            }
            else {
                layer.msg("未获取到用户权限，请刷新页面重试！");
            }
        }
        else {
            layer.msg(resultJson.msg, { icon: 5 });//提示消息                                        
        }
    });
    e("loadmenu", {});
});

//加载一级菜单
function LoadFirstMenu(MenuData) {
    var _html = "";
    //加载一级
    $.each(MenuData, function (i) {
        var row = MenuData[i];
        if (row.F_Level == "1") {//一级菜单
            _html += '<li data-name="component" class="layui-nav-item">';
            _html += '    <a href="javascript:;" lay-tips="' + row.F_MenuName + '" lay-direction="2">';
            _html += '        <i class="layui-icon ' + row.F_Icon + '"></i>';
            _html += '        <cite>' + row.F_MenuName + '</cite>';
            _html += '    </a>';
            _html += LoadSecondMenu(MenuData, row.F_ID);
            _html += '</li>';
        }
    });
    return _html;
}
//加载二级菜单
function LoadSecondMenu(MenuData, ParentID) {
    var _html = '<dl class="layui-nav-child">';
    $.each(MenuData, function (i) {
        var row = MenuData[i];
        if (row.F_ParentID == ParentID) {
            if (row.F_isPage != null && row.F_isPage != "null" && row.F_isPage != "NULL" && row.F_isPage == "1") {//为页面
                _html += '<dd data-name="nav">';
                _html += '    <a lay-href="' + row.F_Link + '">' + row.F_MenuName + '</a>';
                _html += '</dd>';
            } else {//单纯的为父级菜单
                _html += '<dd data-name="nav">';
                _html += '    <a href="javascript:;">' + row.F_MenuName + '</a>';
                _html += LoadThreeMenu(MenuData, row.F_ID);
                _html += '</dd>';
            }
        }
    });
    _html += '</dl>';
    return _html;
}
//加载三级菜单
function LoadThreeMenu(MenuData, ParentID) {
    var _html = '<dl class="layui-nav-child">';
    $.each(MenuData, function (i) {
        var row = MenuData[i];
        if (row.F_ParentID == ParentID) {
            _html += '<dd data-name="nav"><a lay-href="' + row.F_Link + '">' + row.F_MenuName + '</a></dd>';
        }
    });

    _html += '</dl>';
    return _html;
}