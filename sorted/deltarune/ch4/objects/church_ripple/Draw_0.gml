if (init == 0)
{
    scr_lerpvar("cursize", 0, maxsize, lifetime, 2, "out");
    scr_lerpvar("alpha", alpha, 0, lifetime);
    scr_lerpvar("ripplethicc", ripplethicc, 1, lifetime, 3, "out");
    scr_doom(id, lifetime + 1);
    init = 1;
}
if (dodraw)
{
    if (!scr_is_switch_os())
        draw_set_circle_precision(32);
    var wid = 640;
    var hei = 480;
    var camx = camerax();
    var camy = cameray();
    if (!surface_exists(surf))
        surf = surface_create(wid, hei);
    surface_set_target(surf);
    draw_clear_alpha(c_white, 0);
    var scale = cursize / 2;
    var xloc = x - camx;
    var yloc = y - camy;
    for (var i = ripplecount; i >= 0; i--)
    {
        var circscale = scale * (i / ripplecount);
        var thickness = max(ripplethicc * (1 - (i * 0.1)), 1);
        draw_set_blend_mode(bm_normal);
        d_circle_color(xloc, yloc, circscale, 16777215, 16777215, 0);
        draw_set_blend_mode(bm_subtract);
        d_circle_color(xloc, yloc, max(1, circscale - thickness), 0, 0, 0);
    }
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
    draw_surface_ext(surf, camx, camy, 1, 1, 0, color, alpha);
    if (!scr_is_switch_os())
        draw_set_circle_precision(24);
}
