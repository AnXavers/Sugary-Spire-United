raise_time += (delta_time / 1000000)
destroy_time -= (delta_time / 1000000)
delay_fade_out -= (delta_time / 1000000)
if (delay_fade_out < 0)
    fade_out -= (delta_time / 1000000)
if (target && instance_exists(target))
{
    x = target.x
    var progress = (raise_time / raise_time_start)
    var quadFunc = ((1 - ((1 - progress) * (1 - progress))) * 30)
    y = ((target.y - 70) - quadFunc)
    alpha = (fade_out / fade_out_start)
}
if (destroy_time < 0)
    instance_destroy()
if (!instance_exists(target))
    instance_destroy()
