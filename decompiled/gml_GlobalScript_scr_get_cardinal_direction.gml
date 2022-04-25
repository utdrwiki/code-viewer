scr_get_cardinal_direction = function(argument0) //gml_Script_scr_get_cardinal_direction
{
    _mycardinal = "n"
    _mydegree = argument0
    while (_mydegree > 360 || _mydegree < 0)
    {
        if (_mydegree > 360)
            _mydegree -= 360
        if (_mydegree < 0)
            _mydegree += 360
    }
    if (_mydegree >= 315 || _mydegree <= 45)
        _mycardinal = "r"
    if (_mydegree >= 45 && _mydegree <= 135)
        _mycardinal = "u"
    if (_mydegree >= 135 && _mydegree <= 225)
        _mycardinal = "l"
    if (_mydegree >= 225 && _mydegree <= 315)
        _mycardinal = "d"
    return _mycardinal;
}

