light_color = 15245445;
if (obj_rhythmgame.red_glow > 0)
    light_color = merge_color(#85A0E8, #FF8186, obj_rhythmgame.red_glow);
if (con > 0)
{
    draw_set_blend_mode(bm_add);
    var _pointX = x + lengthdir_x(20, direction - 180);
    var _pointY = y + lengthdir_y(20, direction - 180);
    floorY = obj_rhythmgame.y + 370 + (cos(siner / 20) * (range / 2));
    pointA = scr_intercept_x(_pointX, _pointY, 900, direction - 17, floorY);
    pointB = scr_intercept_x(_pointX, _pointY, 900, direction + 17, floorY);
    draw_set_blend_mode(bm_normal);
    scr_draw_set_mask(true);
    draw_sprite(spr_rhythmgame_bg_overlay, 1, obj_rhythmgame.x, obj_rhythmgame.y + 100);
    scr_draw_in_mask_begin();
    draw_set_color(light_color);
    d_ellipse(x, floorY - 20, x + 180, floorY + 10, false);
}
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);
