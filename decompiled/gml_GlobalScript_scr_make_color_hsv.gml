scr_make_color_hsv = function(argument0, argument1, argument2) //gml_Script_scr_make_color_hsv
{
    var hue = argument0
    if (hue < 0)
        hue = (256 - ((-hue) % 256))
    else
        hue %= 256
    return make_color_hsv(hue, argument1, argument2);
}

