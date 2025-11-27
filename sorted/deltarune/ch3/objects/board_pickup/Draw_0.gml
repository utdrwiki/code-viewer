var gridx, gridy;
if (con != 5)
{
    gridx = round(x / 2) * 2;
    gridy = round(y / 2) * 2;
    draw_sprite_ext(sprite_index, image_index, gridx, gridy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
{
    draw_self();
}
if (glow)
{
    glowtimer++;
    if ((glowtimer % 8) == 0)
        glowsiner++;
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprite_index, image_index, gridx, gridy, image_xscale, image_yscale, image_angle, image_blend, abs(sin(glowsiner / 2)));
    d3d_set_fog(false, c_white, 0, 0);
}
