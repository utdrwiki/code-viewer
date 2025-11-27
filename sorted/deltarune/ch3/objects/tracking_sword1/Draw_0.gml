if (afterimagecon == 0)
{
    draw_self();
    if (con == 2)
    {
        d3d_set_fog(true, c_white, 0, 0);
        draw_self();
        d3d_set_fog(false, c_white, 0, 0);
    }
}
if (afterimagecon == 1)
{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.0025);
    for (i = 0; i < 40; i++)
        draw_sprite_ext(sprite_index, image_index, lerp(x, targetx, i / 40), lerp(y, targety, i / 40), image_xscale, image_yscale, image_angle, image_blend, 0.2 + (i / 80));
    afterimagecon = 2;
}
else if (afterimagecon == 2)
{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.0025);
    for (i = 0; i < 40; i++)
        draw_sprite_ext(sprite_index, image_index, lerp(x, targetx, i / 40), lerp(y, targety, i / 40), image_xscale, image_yscale, image_angle, image_blend, (0.2 + (i / 80)) * 0.5);
    afterimagecon = 3;
}
