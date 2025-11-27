if (!tenna)
{
    draw_self();
}
else
{
    draw_sprite_ext(spr_whitepixel, 0, camerax(), cameray() + 404, camerawidth(), 100, 0, c_black, 1);
    var index = 0;
    if (sprite_index == sprEat)
        index = 1;
    draw_sprite_ext(spr_tenna_grasp_chef, index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (!leaving && food_type > -1)
    draw_sprite_ext(spr_chefs_food, food_type, x, y, 2, 2, 0, c_white, 1);
if (foods_needed > 1)
{
    draw_set_font(fnt_mainbig);
    draw_set_halign(fa_center);
    draw_set_color(c_black);
    draw_set_color(c_white);
}
