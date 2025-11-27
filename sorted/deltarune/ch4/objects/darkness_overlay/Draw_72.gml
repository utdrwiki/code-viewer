if (auto_depth)
{
    if (global.fighting == 1 && darkfight)
        depth = 6;
    else
        depth = 50000;
}
with (obj_growtangle)
    draw_sprite_ext(sprite_index, 1, x - camerax(), y - cameray(), image_xscale, image_yscale, image_angle, c_white, image_alpha);
