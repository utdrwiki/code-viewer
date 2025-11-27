if (!surface_exists(my_surface))
    my_surface = surface_create(90, 90);
surface_set_target(my_surface);
draw_clear_alpha(c_black, 0);
draw_sprite_ext(sprite_index, image_index, 45, 45, xscale, yscale, image_angle, image_blend, image_alpha);
surface_reset_target();
var xoff = 0;
var yoff = 0;
if (shakeme)
{
    if ((true_timer % 2) < 1)
        xoff = -4;
    else
        xoff = 4;
}
if (light > 0 && light < 1)
{
    lightshake = min(light * 8, 5);
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprite_index, image_index, x + 1 + xoff + (lightshake * choose(-1, 1)), y + yoff + (lightshake * choose(-1, 1)), xscale, xscale, image_angle, image_blend, light * 0.5);
    d3d_set_fog(false, c_white, 0, 0);
}
if (light < 1)
{
    for (a = 0; a < 90; a++)
    {
        var side = 1;
        draw_surface_part(my_surface, 0, a, 90, 1, (x - 44) + (sin((a + timer) * 1) * (4 - (image_alpha * 4)) * side) + xoff, (y - 45) + a + yoff);
    }
}
if (light > 0 && light < 1)
{
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprite_index, image_index, x + 1 + xoff, y + yoff, xscale, xscale, image_angle, image_blend, (light + light_damage) * 0.7);
    d3d_set_fog(false, c_white, 0, 0);
}
if (light == 1)
{
    d3d_set_fog(true, c_white, 0, 0);
    lightshake = min(light * 8, 5);
    draw_sprite_ext(sprite_index, image_index, x + 1 + xoff + (lightshake * choose(-1, 1)), y + yoff + (lightshake * choose(-1, 1)), (0.85 + (sin(true_timer * 1) * 0.5)) * big_shrink, (0.85 - (sin(true_timer * 1) * 0.5)) * big_shrink, image_angle, image_blend, light * 0.5);
    draw_sprite_ext(sprite_index, image_index, x + 1 + xoff, y + yoff, (0.85 + (sin(true_timer * 1) * 0.5)) * big_shrink, (0.85 - (sin(true_timer * 1) * 0.5)) * big_shrink, image_angle, image_blend, light);
    d3d_set_fog(false, c_white, 0, 0);
}
