var xshake = 0;
var yshake = 0;
if (sprite_index == spr_tenna_desperate)
{
    xshake = choose(-1, 0, 1);
    yshake = choose(-1, 0, 1);
}
if (doshadow)
{
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    var shdoff = 0;
    if (sprite_index == spr_tenna_desperate)
        shdoff = 10;
    draw_sprite_ext(spr_susiezilla_shadow, 0, x + xshake, ((y + 15) - shdoff) + yshake, 3 + (shdoff * 0.05), 3, 0, image_blend, 0.25);
    draw_set_color(c_white);
    draw_set_alpha(1);
}
if ((state != states.dead && (alarm[1] % 4) < 2) || (state == states.dead && (state_timer % 4) < 2))
{
    pal_swap_set(spr_tenna_palette, 1, false);
    draw_sprite_ext(sprite_index, image_index, x + (xoff * polarity) + xshake, y + yoff + z + yshake, xscale, yscale, image_angle, image_blend, image_alpha);
    pal_swap_reset();
    if (flash > 0)
    {
        d3d_set_fog(true, c_yellow, 0, 1);
        draw_sprite_ext(sprite_index, image_index, x + (xoff * polarity) + xshake, y + yoff + z + yshake, xscale, yscale, image_angle, image_blend, flash / 10);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (afterimages)
        afterimages_intensity = scr_approach(afterimages_intensity, 1, 0.25);
    else
        afterimages_intensity = scr_approach(afterimages_intensity, 0, 0.1);
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprite_index, image_index, x + (xoff * polarity), y + yoff + z, xscale, yscale, image_angle, image_blend, afterimages_intensity);
    d3d_set_fog(false, c_white, 0, 0);
}
with (obj_afterimage_grow)
{
    if (sprite_index == spr_ground_shockwave)
    {
        if (image_yscale <= 0.1)
            instance_destroy();
        else
            draw_self();
        image_yscale *= 0.75;
        image_xscale = scr_approach(image_xscale, 0, 0.3);
    }
}
