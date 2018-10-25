layui.define(function (exports) {
    var obj = {
        hello: function (str) {
            alert("Hello" + (str || "index"));
        }
    };

    exports("index", obj);
});