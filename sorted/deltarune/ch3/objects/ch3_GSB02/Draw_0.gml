if (con == 0 && scr_debug() && show_debug)
{
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var _confirm = "[Z]";
    var _cancel = "[X]";
    draw_text_transformed(camerax() + 320, cameray() + 240, string_hash_to_newline(_confirm + " Play it!#" + _cancel + " Nevermind"), 2, 2, 0);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
if (silhouettes)
{
    depth = instrument[1].depth - 10;
    if (i_ex(instrument[0]) && instrument[0].visible)
    {
        with (instrument[0])
        {
            var _floor = obj_rhythmgame.y + 394;
            scr_draw_self_silhouette_plus(-2, 4);
        }
    }
    if (i_ex(instrument[1]) && instrument[1].visible)
    {
        with (instrument[1])
        {
            var _floor = obj_rhythmgame.y + 394;
            scr_draw_self_silhouette_plus();
        }
    }
}
