if (global.martian_alarmed == 1)
{
	instance_create(x, y, content);
	with (content)
		use_heat();
	instance_destroy();
}
