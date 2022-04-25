draw_text_outline = function(argument0, argument1, argument2, argument3) //gml_Script_draw_text_outline
{
    resetcolor = draw_get_color()
    draw_set_color(argument3)
    draw_text((argument0 - 1), argument1, argument2)
    draw_text((argument0 - 1), (argument1 - 1), argument2)
    draw_text((argument0 - 1), (argument1 + 1), argument2)
    draw_text((argument0 + 1), argument1, argument2)
    draw_text((argument0 + 1), (argument1 + 1), argument2)
    draw_text((argument0 + 1), (argument1 - 1), argument2)
    draw_text(argument0, (argument1 + 1), argument2)
    draw_text(argument0, (argument1 - 1), argument2)
    draw_set_color(resetcolor)
    draw_text(argument0, argument1, argument2)
    return;
}

