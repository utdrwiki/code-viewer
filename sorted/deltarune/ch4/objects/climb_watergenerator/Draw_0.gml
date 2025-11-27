if (scr_debug() && keyboard_check_pressed(ord("V")))
    dodraw = !dodraw;
if (dodraw)
    draw_sprite_ext(spr_climb_waterbucket, 0, x, y, 2, -2, 0, c_white, 1);
