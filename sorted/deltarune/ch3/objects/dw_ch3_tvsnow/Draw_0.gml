if (view_current == 0)
{
    xpos = camerax() * 0.75;
    timer++;
    depth = bgdepth;
    draw_sprite_tiled_ext(bg_snowfall, 0, xpos + ceil((timer / 12) + (sin(timer / 48) * 18)), timer / 6, 1, 1, c_white, 0.1);
    draw_sprite_tiled_ext(bg_snowfall, 0, xpos + ceil((timer / 13) + (sin(timer / 57) * 18)), timer / 7, 1, 1, c_white, 0.1);
    draw_sprite_tiled_ext(bg_snowfall, 0, xpos + ceil((timer / 14) + (sin(timer / 64) * 18)), timer / 8, 0.5, 0.5, c_white, 0.1);
}
if (global.chapter == 3)
{
    if (room == room_dw_teevie_preview || room == room_dw_green_room || room == room_dw_ranking_hub)
    {
        draw_set_color(merge_color(c_black, c_navy, 0.8));
        draw_set_alpha(0.4);
        draw_rectangle(0, 0, 9999, 9999, false);
        draw_set_alpha(1);
    }
}
