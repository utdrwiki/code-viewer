if (con == 1)
    con = 0;
else
    con = 1;
direction += 5;
if (con == 0)
{
    var a = 0;
    repeat (8)
    {
        draw_sprite_ext(sprite_index, image_index, round((x + lengthdir_x(len, a + direction)) / 2) * 2, round((y + lengthdir_y(len, a + direction)) / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        a += 45;
    }
}
len -= 6;
if (len < 2)
    con = 2;
if (con == 2)
{
    siner++;
    draw_sprite_ext(sprite_index, image_index, round(x / 2) * 2, round((y + (sin(siner / 8) * 4)) / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (laugh == 1)
{
    var remval = sprite_index;
    var remval2 = image_speed;
    laugh = 2;
    image_index = 0;
    sprite_index = spr_shadow_mantle_laugh;
    image_speed = 0.6;
    scr_lerpvar("image_speed", 0.6, 0.1, 49);
    snd_play_pitch(snd_board_mantle_laugh_mid, 1.3);
    scr_delay_var("sprite_index", remval, 50);
    scr_delay_var("image_speed", remval2, 50);
}
