if scr_debug()
{
    if (quicksaved != 2)
        scr_84_debug(false)
    if gif_recording
    {
        draw_set_color(c_red)
        draw_set_font(fnt_main)
        draw_text(0, 440, ("GIF FRAME:" + string(gif_timer)))
    }
}
if (quit_timer >= 1)
    draw_sprite_ext(scr_84_get_sprite("spr_quitmessage"), (quit_timer / 7), 4, 4, 2, 2, 0, c_white, (quit_timer / 15))
