if (active)
{
    if (draw_eye)
    {
        draw_sprite_ext(sprite_index, image_index, xprevious, yprevious, image_xscale, image_yscale, image_angle, c_gray, image_alpha);
        draw_self();
        draw_sprite(spr_almond_iris, 0, x + lengthdir_x(6 * eye_dist, my_dir), y + lengthdir_y(6 * eye_dist, my_dir));
    }
    else
    {
        var dir = irandom(360);
        var dist = irandom(10);
        draw_sprite_ext(sprite_index, image_index, x + irandom_range(-2, 2), y + irandom_range(-2, 2), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        if (image_blend == c_white)
            draw_sprite(spr_almond_iris, 0, x + lengthdir_x(dist, dir), y + lengthdir_y(dist, dir));
    }
}
else
{
    draw_self();
}
