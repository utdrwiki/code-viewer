light_color = 15245445;
if (con > 0)
{
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(sprite_index, 3, x, y, image_xscale, image_yscale, image_angle, light_color, 1);
    var _pointX = x + lengthdir_x(20, direction - 180);
    var _pointY = y + lengthdir_y(20, direction - 180);
    floorY = obj_rhythmgame.y + 370 + (cos(siner / 20) * (range / 2));
    pointA = scr_intercept_x(_pointX, _pointY, 900, direction - 17, floorY);
    pointB = scr_intercept_x(_pointX, _pointY, 900, direction + 17, floorY);
    if (obj_rhythmgame.bg_con == 0)
    {
        draw_set_color(merge_color(light_color, c_black, 0.9));
        draw_triangle(_pointX, _pointY, pointA, floorY, pointB, floorY, false);
    }
    draw_set_blend_mode(bm_normal);
    scr_draw_set_mask(true);
    draw_sprite(spr_rhythmgame_bg_overlay, 1, obj_rhythmgame.x, obj_rhythmgame.y + 100);
    scr_draw_in_mask_begin();
    draw_set_color(light_color);
    draw_ellipse(pointA, floorY - 10, pointB, floorY + 10, false);
}
if (con > 0)
{
    if (i_ex(obj_rhythmgame))
        d3d_set_fog(true, obj_rhythmgame.floor_color, 0, 1);
    else
        d3d_set_fog(true, #3967D2, 0, 1);
    with (obj_marker2)
    {
        if (visible)
            draw_sprite_ext(sprite_index, image_index, x, ((y - sprite_yoffset) + (sprite_height * 1.5)) - 6, image_xscale, -image_yscale / 2, 0, c_black, 1);
    }
    with (obj_rhythmgame_performer)
    {
        if (visible)
            draw_sprite_ext(sprite_index, image_index, x, ((y - sprite_yoffset) + (sprite_height * 1.5)) - 6, image_xscale, -image_yscale / 2, 0, c_black, 1);
    }
    with (obj_actor)
    {
        if (visible)
            draw_sprite_ext(sprite_index, image_index, x, ((y - sprite_yoffset) + (sprite_height * 1.5)) - 6, image_xscale, -image_yscale / 2, 0, c_black, 1);
    }
    with (obj_actor_tenna)
        scr_copy_tenna_ext(id, x, y, image_xscale, -image_yscale / 2, 1, false);
    d3d_set_fog(false, c_black, 0, 0);
    scr_draw_in_mask_end();
}
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, light_color, 1);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, light_color, 1);
draw_set_blend_mode(bm_normal);
