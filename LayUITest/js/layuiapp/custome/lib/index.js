;layui.define('element', function(e) {
	var element = layui.element,
		layer = layui.layui;
	element.on('nav(demo)', function(elem) {
		layer.message(elem.text());
	});
	e('index', {});
});