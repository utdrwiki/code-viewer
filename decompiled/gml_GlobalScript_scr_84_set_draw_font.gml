scr_84_set_draw_font = function(argument0) //gml_Script_scr_84_set_draw_font
{
    global.chemg_font = argument0
    draw_set_font(scr_84_get_font(argument0))
    return;
}

