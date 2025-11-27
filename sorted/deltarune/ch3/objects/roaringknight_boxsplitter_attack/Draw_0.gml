if (image_alpha == 1)
{
    if (animtimer < 4)
        animtimer++;
    else if (image_index == 1 || image_index == 4)
        image_index++;
    draw_self();
    aetimer++;
    if ((aetimer % 4) == 0 && image_alpha != 0)
    {
        fade = scr_afterimage();
        fade.sprite_index = sprite_index;
        fade.image_alpha = 0.6;
        fade.fadeSpeed = 0.02;
        fade.hspeed = 2 * sign(x - obj_growtangle.x);
        if (x < obj_growtangle.x)
            fade.depth = depth + 50;
        else
            fade.depth = depth + 100;
    }
}
if (!surface_exists(hell_surface))
    hell_surface = surface_create(142, 142);
draw_set_blend_mode(bm_normal);
surface_set_target(hell_surface);
draw_clear_alpha(c_black, 0);
var _gtx = gt_minx() + 5;
var _gty = gt_miny() + 5;
with (obj_roaringknight_splitslash)
{
    if (!slash)
    {
        var _ease = scr_ease_out(clamp01(timer / 30), 3);
        var _spin = ((_ease * 15) - 15) * flip;
        var _backing = merge_color(c_black, image_blend, 0.5);
        var _size = lerp(4, 0, _ease);
        var _length = clamp01(timer / 30) * 90;
        draw_sprite_ext(spr_pxwhite10_center, 0, 71 + xoffset, 71 + yoffset, _length, _size, _spin + image_angle + angleoffset, _backing, 1);
        gpu_set_blendmode_ext(bm_dest_alpha, bm_dest_alpha);
        draw_sprite_tiled_ext(spr_knight_bullet_flow, 2, timer, timer, 0.25, 0.25, image_blend, 1);
        draw_sprite_tiled_ext(spr_knight_bullet_flow, 2, -timer + 40, -timer + 40, 0.25, 0.25, image_blend, 1);
        gpu_set_blendmode(bm_normal);
    }
}
surface_reset_target();
draw_set_blend_mode(bm_add);
draw_surface(hell_surface, obj_growtangle.x - 71, obj_growtangle.y - 71);
draw_set_blend_mode(bm_normal);
