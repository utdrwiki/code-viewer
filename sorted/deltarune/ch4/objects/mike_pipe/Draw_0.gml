if (side == 0)
{
    draw_sprite_ext(spr_mike_crowd, 1, x, y - yscale2, 1, 1, image_angle + angle, c_white, image_alpha);
    draw_sprite_ext(spr_mike_crowd, 2, x, y - yscale2, 1, yscale2, image_angle + angle, c_white, image_alpha);
    if (angle == 0)
        draw_sprite_ext(spr_mike_crowd, 3, x, y - 10, 1, 1, image_angle + angle, c_white, image_alpha);
    draw_sprite_ext(spr_mike_clap, 0, x + max(0, lengthdir_y(4, rot)), (y - yscale2) + max(0, lengthdir_y(4, rot)), 1, 1, 1, image_blend, 1);
    draw_sprite_ext(spr_mike_clap, 0, x - max(0, lengthdir_y(4, rot)), y - yscale2 - max(0, lengthdir_y(4, rot)), 1, 1, 1, image_blend, 1);
}
else
{
    draw_sprite_ext(spr_mike_crowd, 1, x, y + yscale2, 1, 1, image_angle + angle, c_white, image_alpha);
    draw_sprite_ext(spr_mike_crowd, 2, x, y + yscale2, 1, yscale2, image_angle + angle, c_white, image_alpha);
    if (angle == 0)
        draw_sprite_ext(spr_mike_crowd, 3, x, y + 10, 1, 1, image_angle + angle, c_white, image_alpha);
    draw_sprite_ext(spr_mike_clap, 0, x + max(0, lengthdir_y(4, rot)), y + yscale2 + max(0, lengthdir_y(4, rot)), 1, -1, 1, image_blend, 1);
    draw_sprite_ext(spr_mike_clap, 0, x - max(0, lengthdir_y(4, rot)), (y + yscale2) - max(0, lengthdir_y(4, rot)), 1, -1, 1, image_blend, 1);
}
rot += 60;
