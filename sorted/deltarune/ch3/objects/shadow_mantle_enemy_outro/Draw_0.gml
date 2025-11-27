timer++;
if (timer == 1)
    snd_play_x(snd_board_bosshit, 1, 0.9);
if (timer == 12)
    snd_play_x(snd_board_bosshit, 0.6, 0.9);
if (timer == 24)
    snd_play_x(snd_board_bosshit, 0.3, 0.9);
if (timer == 36)
    snd_play_x(snd_board_bosshit, 0.1, 0.9);
if (timer == 48)
    snd_play_x(snd_board_bosshit, 0.05, 0.9);
if (timer < 25)
{
    if (image_alpha == 1)
        image_alpha = 0;
    else
        image_alpha = 1;
}
if (timer == 25)
    image_alpha = 1;
if (timer > 54 && timer < 64)
{
    x = lerp(x, 304, (timer - 54) / 10);
    y = lerp(y, 174, (timer - 54) / 10);
}
if (timer == 104 || timer == 134 || timer == 164)
{
    snd_play(snd_board_bosshit);
    hurttimer = 8;
    with (obj_shadow_mantle_bg)
        con = 2;
}
siner++;
draw_sprite_ext(sprite_index, image_index, round(x / 2) * 2, round((y + (sin(siner / 8) * 4)) / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (hurttimer > 0)
{
    hurttimer--;
    if ((hurttimer % 2) == 0)
    {
        d3d_set_fog(true, c_white, 0, 1);
        draw_sprite_ext(sprite_index, image_index, round(x / 2) * 2, round((y + (sin(siner / 8) * 4)) / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
}
