scr_84_draw_text_outline_ch1 = function(argument0, argument1, argument2) //gml_Script_scr_84_draw_text_outline_ch1
{
    var xx = argument0
    var yy = argument1
    var str = argument2
    var __txtcolor__ = draw_get_color()
    draw_set_colour(c_black)
    draw_text((xx - 1), (yy - 1), str)
    draw_text((xx + 1), (yy - 1), str)
    draw_text((xx - 1), (yy + 1), str)
    draw_text((xx + 1), (yy + 1), str)
    draw_set_colour(__txtcolor__)
    draw_text(xx, yy, str)
    return;
}

