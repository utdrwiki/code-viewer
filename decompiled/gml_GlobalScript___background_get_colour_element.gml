var __result;
__background_get_colour_element = function() //gml_Script___background_get_colour_element
{
    var __nearestdepth = -15000
    var __farthestdepth = 15999
    var __depthinc = 100
    __result[0] = -1
    __result[1] = -1
    var __colstring = "Compatibility_Colour"
    var __layerlist = layer_get_all()
    var __layerlistlength = array_length_1d(__layerlist)
    var __layerid = -1
    var __isforeground = 0
    var __i = 0
    while (__i < __layerlistlength)
    {
        var __layername = layer_get_name(__layerlist[__i])
        if (string_pos(__colstring, __layername) > 0)
        {
            __layerid = __layerlist[__i]
            break
        }
        else
        {
            __i++
            continue
        }
    }
    if (__layerid != -1)
    {
        var __els = layer_get_all_elements(__layerid)
        var __elslength = array_length_1d(__els)
        for (__i = 0; __i < __elslength; __i++)
        {
            if (layer_get_element_type(__els[__i]) == 1)
            {
                __result[0] = __els[__i]
                __result[1] = __layerid
            }
        }
    }
    else
    {
        var __newback = __background_set_element(-1, false, 0, -1, 0, 0, 1, 1, 1, 1, 1, 0, 0, c_black, 1)
        __result[0] = __newback[0]
        __result[1] = __newback[1]
    }
    return __result;
}

