time_passed += (delta_time / 1000000)
if target
{
    var sinewave = 0
    if special
    {
        var loop_time = 3
        sinewave = (sin(((2 * pi) * (time_passed / loop_time))) * 7.5)
    }
    x = target.x
    y = ((target.y - 50) - sinewave)
    visible = target.visible
}
