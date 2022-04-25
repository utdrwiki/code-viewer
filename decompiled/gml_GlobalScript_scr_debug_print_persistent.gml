scr_debug_print_persistent = function(argument0) //gml_Script_scr_debug_print_persistent
{
    draw_set_halign(fa_right)
    var dcolor = draw_get_color()
    draw_set_color(c_black)
    draw_text_transformed(621, 11, string_hash_to_newline(argument0), 0.5, 0.5, 0)
    draw_set_color(dcolor)
    draw_text_transformed(620, 10, string_hash_to_newline(argument0), 0.5, 0.5, 0)
    draw_set_halign(fa_left)
    return;
}

