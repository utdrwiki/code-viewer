if (sprite_index == spr_tenna_point_up)
{
    pal_swap_set(spr_tenna_palette, 1, false);
    draw_sprite_ext(sprite_index, image_index, x + (shake * polarity), y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    pal_swap_reset();
}
else
{
    draw_sprite_ext(sprite_index, image_index, x + (shake * polarity), y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (flash)
{
    d3d_set_fog(true, c_yellow, 0, 1);
    draw_sprite_ext(sprite_index, image_index, x + (shake * polarity), y, image_xscale, image_yscale, image_angle, image_blend, flash / 10);
    d3d_set_fog(false, c_black, 0, 0);
}
if (healflash)
{
    d3d_set_fog(true, c_lime, 0, 1);
    draw_sprite_ext(sprite_index, image_index, x + (shake * polarity), y, image_xscale, image_yscale, image_angle, image_blend, healflash / 10);
    d3d_set_fog(false, c_black, 0, 0);
}
if (sprite_index == spr_susiezilla_ralsei_tower && hp > 0)
{
    if (damage_cooldown > 0)
        image_alpha = 0.5;
    else
        image_alpha = 1;
    draw_sprite_ext(spr_susiezilla_censor_bar, 0, round(x) + (!irandom(10) ? choose(-1, 1) : 0) + (shake * polarity) + 32, (round(y) + (!irandom(10) ? choose(-1, 1) : 0)) - 68, -image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
