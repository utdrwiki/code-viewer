siner++;
var scale = 0.5 + (global.darkzone * 0.5);
if (!surface_exists(mysurface))
    mysurface = surface_create(__view_get(e__VW.WView, 0), __view_get(e__VW.HView, 0));
surface_set_target(mysurface);
if (brightbloom == 1)
{
    draw_clear_alpha(c_black, 0);
    draw_set_blend_mode(bm_add);
}
if (style == 0)
{
    draw_set_alpha(0.5);
    var b = bloomdist + (sin(siner / period) * amplitude);
    draw_surface_ext(application_surface, -b, -b, 0.5, 0.5, 0, c_white, 0.5);
    draw_surface_ext(application_surface, b, -b, 0.5, 0.5, 0, c_white, 0.5);
    draw_surface_ext(application_surface, -b, b, 0.5, 0.5, 0, c_white, 0.5);
    draw_surface_ext(application_surface, b, b, 0.5, 0.5, 0, c_white, 0.5);
    draw_set_alpha(bloomstrength);
}
if (style == 1)
{
    var b = bloomdist + (sin(siner / period) * amplitude);
    draw_set_alpha(0.6);
    draw_surface(application_surface, -b * 2, -b * 2);
    draw_surface(application_surface, b * 2, -b * 2);
    draw_surface(application_surface, -b * 2, b * 2);
    draw_surface(application_surface, b * 2, b * 2);
    draw_set_alpha(0.5);
    draw_surface(application_surface, -b, -b);
    draw_surface(application_surface, b, -b);
    draw_surface(application_surface, -b, b);
    draw_surface(application_surface, b, b);
    draw_set_alpha(bloomstrength);
}
if (style == 2)
{
    var b = bloomdist + (sin(siner / period) * amplitude);
    for (i = 0; i < 4; i++)
        draw_surface_ext(application_surface, lengthdir_x(b * 2, (siner * 2) + (90 * i)) + xoff, lengthdir_y(b * 2, (siner * 2) + (90 * i)) + yoff, scale, scale, 0, c_white, 0.6);
    for (i = 0; i < 4; i++)
        draw_surface_ext(application_surface, lengthdir_x(b, (siner * 2) + (90 * i) + 45) + xoff, lengthdir_y(b, (siner * 2) + (90 * i) + 45) + yoff, scale, scale, 0, c_white, 0.5);
}
if (style == 3)
{
    var b = bloomdist + (sin(siner / period) * amplitude);
    draw_set_alpha(0.5);
    for (i = 0; i < 4; i++)
        draw_surface(application_surface, lengthdir_x(b, (siner * 2) + (90 * i) + 45), lengthdir_y(b, (siner * 2) + (90 * i) + 45));
    draw_set_alpha(bloomstrength);
}
surface_reset_target();
draw_surface(mysurface, camerax(), cameray());
if (brightbloom != 0)
    draw_set_blend_mode(bm_normal);

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
