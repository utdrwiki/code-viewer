__background_set_colour = function(argument0) //gml_Script___background_set_colour
{
    var __newcol = argument0
    var __colinfo = __background_get_colour_element()
    if (__colinfo[0] == -1)
        return 0;
    layer_background_blend(__colinfo[0], __newcol)
    return __newcol;
}

