if (con != 1 || (timer % 2) != 0)
{
    if (sprite_index == spr_almond)
        draw_sprite_ext(sprite_index, image_index, xprevious, yprevious, image_xscale, image_yscale, image_angle, c_gray, image_alpha);
    draw_self();
    if (sprite_index == spr_almond)
        draw_sprite(spr_almond_iris, 0, x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction));
}
