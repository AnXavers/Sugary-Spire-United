if (global.lowperformance)
{
	var a = layer_get_all();
	for (var i = 0; i < array_length(a); i++)
		layer_enable_fx(a[i], !global.lowperformance);
}
