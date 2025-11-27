if (abs(apparent - global.tension) < 20)
    apparent = global.tension;
if (apparent < global.tension)
    apparent += 20;
if (apparent > global.tension)
    apparent -= 20;
alphamod = scr_approach(alphamod, 0, 0.15);
if (alphamod == 0)
    instance_destroy();
var xx = x;
var yy = __view_get(e__VW.YView, 0) + 40;
var z = 1;
draw_set_color(c_white);
scr_84_set_draw_font("mainbig");
gpu_set_blendmode(bm_add);
tamt = floor((apparent / global.maxtension) * 100);
for (var aa = 1; aa < 2; aa++)
{
    draw_sprite_ext(spr_tplogo, 0, xx - 30 - (z * aa), yy + 30, 1, 1, 0, c_white, (1 - (aa * 0.25)) * alphamod);
    draw_w_offset(-z * aa, 0, (1 - (aa * 0.25)) * alphamod);
    draw_sprite_ext(spr_tplogo, 0, (xx - 30) + (z * aa), yy + 30, 1, 1, 0, c_white, (1 - (aa * 0.25)) * alphamod);
    draw_w_offset(z * aa, 0, (1 - (aa * 0.25)) * alphamod);
    draw_sprite_ext(spr_tplogo, 0, xx - 30, (yy + 30) - (z * aa), 1, 1, 0, c_white, (1 - (aa * 0.25)) * alphamod);
    draw_w_offset(0, -z * aa, (1 - (aa * 0.25)) * alphamod);
    draw_sprite_ext(spr_tplogo, 0, xx - 30, yy + 30 + (z * aa), 1, 1, 0, c_white, (1 - (aa * 0.25)) * alphamod);
    draw_w_offset(0, z * aa, (1 - (aa * 0.25)) * alphamod);
    draw_sprite_ext(spr_tplogo, 0, x - 30 - (z * aa), (y + 30) - (z * aa), 1, 1, 0, c_white, (1 - (aa * 0.25)) * alphamod);
    draw_w_offset(-z * aa, -z * aa, (1 - (aa * 0.25)) * alphamod);
    draw_sprite_ext(spr_tplogo, 0, (x - 30) + (z * aa), (y + 30) - (z * aa), 1, 1, 0, c_white, (1 - (aa * 0.25)) * alphamod);
    draw_w_offset(z * aa, -z * aa, (1 - (aa * 0.25)) * alphamod);
    draw_sprite_ext(spr_tplogo, 0, x - 30 - (z * aa), y + 30 + (z * aa), 1, 1, 0, c_white, (1 - (aa * 0.25)) * alphamod);
    draw_w_offset(-z * aa, z * aa, (1 - (aa * 0.25)) * alphamod);
    draw_sprite_ext(spr_tplogo, 0, (x - 30) + (z * aa), y + 30 + (z * aa), 1, 1, 0, c_white, (1 - (aa * 0.25)) * alphamod);
    draw_w_offset(z * aa, z * aa, (1 - (aa * 0.25)) * alphamod);
}
gpu_set_blendmode(bm_normal);
draw_sprite_ext(spr_tensionfilling, 2, xx, yy, 1, 1, 0, c_white, 0.75 * alphamod);

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
