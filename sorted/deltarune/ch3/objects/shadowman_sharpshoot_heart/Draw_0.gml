if (scr_debug())
{
    draw_set_color(c_maroon);
    draw_line_width(x, y, xprevious, yprevious, 3);
}
for (var i = 0; i < 8; i++)
    draw_sprite_ext(sprite_index, image_index, lerp(previousXPrevious, x, i / 8), lerp(previousYPrevious, y, i / 8), image_xscale, image_yscale, 0, c_white, (0.1 + (i / 16)) * image_alpha);
previousXPrevious = xprevious;
previousYPrevious = yprevious;
draw_self();
if (i_ex(obj_tenna_lightemup_bullet))
{
    bullet = collision_line(x, y, xprevious, yprevious, obj_tenna_lightemup_bullet, true, true);
    if (bullet != -4)
        event_user(1);
}
