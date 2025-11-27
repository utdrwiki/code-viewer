if (mercified && sprite_index != spr_bullet_dice_all4s)
    sprite_index = spr_bullet_dice4pip;
if (force_index == -1)
{
    if ((image_index % 4) == 0 && queue_lock)
        force_index = image_index;
    tick_count += (turn_rate / (1.5 + slowed_rotate));
    if (tick_count >= (0.1 + (0.6 * ((image_index % 4) == 0))))
    {
        tick_count -= (0.1 + (0.6 * ((image_index % 4) == 0)));
        image_index += 1;
    }
}
else
{
    image_index = force_index;
}
if (!active)
    image_blend = c_gray;
else if ((mercified && image_index >= 10 && image_index < 14.5) || (mercified && sprite_index == spr_bullet_dice_all4s))
    image_blend = c_lime;
else
    image_blend = c_white;
draw_self();
if (alarm[1] == 9 || alarm[1] == 8 || alarm[1] == 4 || alarm[1] == 3)
{
    d3d_set_fog(true, c_red, 0, 1);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.3);
    d3d_set_fog(false, c_black, 0, 0);
}
if (image_alpha < 1)
    image_alpha += 0.2;
