if (keyboard_check_pressed(ord("F")) && scr_debug())
    fade = 1;
if (fade == 1)
{
    var fadespeed = 10;
    scr_var_delay("image_alpha", 0.75, fadespeed * 1);
    scr_var_delay("image_alpha", 0.5, fadespeed * 2);
    scr_var_delay("image_alpha", 0, fadespeed * 3);
    scr_doom(id, fadespeed * 5);
    fade = 0;
}
if (i_ex(kris))
{
    draw_sprite_ext(spr_board_shadow_circle, 0, x, y, 2, 2, 0, c_black, image_alpha);
    draw_set_alpha(image_alpha);
    draw_set_color(c_black);
    ossafe_fill_rectangle(x + 128, y - 900, x + 32 + 900, y + 32 + 900, 0);
    ossafe_fill_rectangle(x, y - 900, x + -900, y + 32 + 900, 0);
    ossafe_fill_rectangle(x, y, x + 128, y - 900, 0);
    ossafe_fill_rectangle(x, y + 128, x + 128, y + 900, 0);
    draw_set_color(c_white);
    draw_set_alpha(1);
}
