draw_text_shadow_width = function(argument0, argument1, argument2, argument3) //gml_Script_draw_text_shadow_width
{
    __txtcolor__ = draw_get_color()
    draw_set_color(c_black)
    draw_text_width((argument0 + 1), (argument1 + 1), string_hash_to_newline(argument2), argument3)
    draw_set_color(__txtcolor__)
    draw_text_width(argument0, argument1, string_hash_to_newline(argument2), argument3)
    return;
}

