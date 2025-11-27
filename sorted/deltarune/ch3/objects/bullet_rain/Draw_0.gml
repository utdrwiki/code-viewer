if (updateimageangle == true)
{
    image_angle = gravity_direction - 270;
    draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
}
else if (instance_exists(obj_growtangle))
{
    if (i_ex(obj_rouxls_ch3_enemy))
        draw_sprite_general(sprite_index, 0, 0, 0, sprite_width, clamp((obj_growtangle.y + 86) - y, 0, sprite_height), x - 4, y - 14, image_xscale, image_yscale, image_angle, c_white, c_white, c_white, c_white, 1);
    else
        draw_sprite_general(sprite_index, 0, 0, 0, sprite_width, clamp((obj_growtangle.y + 86) - y, 0, sprite_height), x - 4, y - 14, image_xscale, image_yscale, image_angle, c_white, c_white, c_white, c_white, 1);
}
