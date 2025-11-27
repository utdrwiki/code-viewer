if (reset_blend > 0)
{
    draw_set_font(scr_84_get_font("mainbig"));
    draw_set_color(merge_color(c_black, c_white, reset_blend));
    var str = stringsetloc("RESET.", "obj_room_castle_tv_zone_minigame_slash_Draw_0_gml_4_0");
    draw_text(320 - (0.5 * string_width(str)), 220, str);
}
