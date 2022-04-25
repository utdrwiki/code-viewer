scr_wrap = function(argument0, argument1, argument2) //gml_Script_scr_wrap
{
    var _val = argument0
    var _range = abs((argument2 - argument1))
    if (argument2 <= argument1)
    {
        show_debug_message("wrap error, min higher than max!")
        return argument0;
    }
    else
    {
        while (_val < argument1)
            _val += _range
        while (_val > argument2)
            _val -= _range
        return _val;
    }
}

