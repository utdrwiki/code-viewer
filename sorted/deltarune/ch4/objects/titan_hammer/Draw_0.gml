for (var i = 0; i < 8; i++)
    draw_sprite_ext(sprite_index, image_index, lerp(previousXPrevious, x, i / 8), lerp(previousYPrevious, y, i / 8), image_xscale, image_yscale, image_angle, c_white, (0.1 + (i / 16)) * image_alpha);
previousXPrevious = xprevious;
previousYPrevious = yprevious;
draw_self();
if (timer == 30)
    instance_destroy();
