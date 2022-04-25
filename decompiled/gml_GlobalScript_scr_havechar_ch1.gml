scr_havechar_ch1 = function(argument0) //gml_Script_scr_havechar_ch1
{
    _rreturn = 0
    if (global.char[0] == argument0)
        _rreturn = 1
    if (global.char[1] == argument0)
        _rreturn = 1
    if (global.char[2] == argument0)
        _rreturn = 1
    return _rreturn;
}

