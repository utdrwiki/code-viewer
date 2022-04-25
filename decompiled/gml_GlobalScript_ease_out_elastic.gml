ease_out_elastic = function(argument0, argument1, argument2, argument3) //gml_Script_ease_out_elastic
{
    var _s = 1.70158
    var _p = 0
    var time = argument0
    var start = argument1
    var change = argument2
    var duration = argument3
    if (time == 0 || change == 0)
        return start;
    time /= duration
    if (time == 1)
        return (start + argument2);
    if (!_p)
        _p = (duration * 0.3)
    if (change < abs(argument2))
    {
        change = argument2
        _s = (_p * 0.25)
    }
    else
        _s = ((_p / (2 * pi)) * arcsin((argument2 / change)))
    return ((((change * power(2, (-10 * time))) * sin(((((time * duration) - _s) * (2 * pi)) / _p))) + argument2) + start);
}

