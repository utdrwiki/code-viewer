if (!init)
{
    surf = surface_create(640, 480);
    init = true;
}
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
with (obj_actor)
{
    if (visible)
        draw_self_screenspace();
}
with (obj_marker2)
{
    if (visible)
        draw_self_screenspace();
}
with (obj_rhythmgame_performer)
{
    if (visible)
        draw_self_screenspace();
}
draw_set_blend_mode(bm_subtract);
draw_surface(surf, 0, 4);
gpu_set_blendmode_ext(bm_dest_alpha, bm_one);
d3d_set_fog(false, c_black, 0, 0);
draw_set_color(c_white);
with (obj_rhythmgame_spotlights)
{
    var _size = abs(pointA - pointB);
    var _ceny = screeny(floorY - (((floorY - other.y) * _size) / 10));
    d_ellipse(screenx(pointA), _ceny - (_size / 2), screenx(pointB), _ceny + (_size / 2), false);
}
surface_reset_target();
gpu_set_blendmode(bm_add);
draw_surface_ext(surf, camerax(), cameray(), 1, 1, 0, c_black, image_alpha);
gpu_set_blendmode(bm_normal);
