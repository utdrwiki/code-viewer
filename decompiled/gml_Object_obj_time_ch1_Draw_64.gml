if (quit_timer >= 1)
    draw_sprite_ext(scr_84_get_sprite_ch1("spr_quitmessage"), (quit_timer / 7), 4, 4, 2, 2, 0, c_white, (quit_timer / 15))
if scr_debug_ch1()
    scr_84_debug_ch1(0)
