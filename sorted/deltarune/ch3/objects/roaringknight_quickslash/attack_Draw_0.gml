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
surface_set_target(hell_surface);
draw_clear_alpha(c_black, 0);
draw_set_blend_mode(bm_add);
var _gtx = gt_minx() + 5;
var _gty = gt_miny() + 5;
with (obj_roaringknight_quickslash)
{
    if (!slash)
        draw_sprite_ext(spr_rk_quickslash_marker_gradient, image_index, (x - _gtx) + xdraw, (y - _gty) + ydraw, image_xscale, thickness, image_angle, image_blend, image_alpha);
}
draw_set_blend_mode(bm_normal);
surface_reset_target();
draw_surface(hell_surface, _gtx, _gty);
