scr_darkbox_black = function(argument0, argument1, argument2, argument3) //gml_Script_scr_darkbox_black
{
    draw_set_color(c_black)
    draw_rectangle((argument0 + 20), (argument1 + 20), (argument2 - 20), (argument3 - 20), false)
    scr_darkbox(argument0, argument1, argument2, argument3)
    return;
}

