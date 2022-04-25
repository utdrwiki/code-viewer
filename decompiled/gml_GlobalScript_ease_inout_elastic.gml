ease_inout_elastic = function(argument0, argument1, argument2, argument3) //gml_Script_ease_inout_elastic
{
    var _s = 1.70158
    var _p = 0
    var _a = argument2
    if (argument0 == 0 || _a == 0)
        return argument1;
    argument0 /= (argument3 * 0.5)
    if (argument0 == 2)
        return (argument1 + argument2);
    if (!_p)
        _p = (argument3 * 0.44999999999999996)
    if (_a < abs(argument2))
    {
        _a = argument2
        _s = (_p * 0.25)
    }
    else
        _s = ((_p / (2 * pi)) * arcsin((argument2 / _a)))
    if (argument0 < 1)
        return ((-0.5 * ((_a * power(2, (10 * --argument0))) * sin(((((argument0 * argument3) - _s) * (2 * pi)) / _p)))) + argument1);
    return (((((_a * power(2, (-10 * --argument0))) * sin(((((argument0 * argument3) - _s) * (2 * pi)) / _p))) * 0.5) + argument2) + argument1);
}

