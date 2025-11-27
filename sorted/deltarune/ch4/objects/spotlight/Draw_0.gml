if (con > 0)
{
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(sprite_index, 3, x, y, image_xscale, image_yscale, image_angle, light_color, 1);
    var _pointX = x + lengthdir_x(20, direction - 180);
    var _pointY = y + lengthdir_y(20, direction - 180);
    if (auto_floor)
        floor_y = (target.y + target.sprite_height) - target.sprite_xoffset;
    var _pointA = scr_intercept_x(_pointX, _pointY, 900, direction - (size / 2), floor_y);
    var _pointB = scr_intercept_x(_pointX, _pointY, 900, direction + (size / 2), floor_y);
    draw_set_color(light_color);
    d_ellipse(_pointA, floor_y - 10, _pointB, floor_y + 10, false);
    draw_set_color(merge_color(light_color, c_black, 0.9));
    draw_triangle(_pointX, _pointY, _pointA, floor_y, _pointB, floor_y, false);
    draw_set_blend_mode(bm_normal);
}
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, light_color, 1);
if (con > 0)
{
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, light_color, 1);
    draw_set_blend_mode(bm_normal);
    d3d_set_fog(true, other.dark_mode ? #0B152A : #3967D2, 0, 1);
    with (target)
    {
        if (object_index == obj_actor_tenna)
            scr_copy_tenna_ext(id, x, y, image_xscale, -image_yscale, 1, true);
        else
            draw_sprite_part_ext(sprite_index, image_index, 0, (sprite_height / image_yscale) - 16, sprite_width / image_xscale, 18, x + sprite_xoffset, (y - sprite_yoffset) + sprite_height + 20, image_xscale, -image_yscale, c_black, 1);
        d3d_set_fog(false, c_black, 0, 0);
        if (other.dark_mode)
        {
            if (object_index == obj_actor_tenna)
                scr_copy_tenna(id, x, y);
            else
                draw_self();
        }
    }
}
