var cx = camerax();
var cy = cameray();
if (delay > 0)
{
    delay--;
    introflashalpha = 0;
    exit;
}
if (!surface_exists(bgsurface))
    bgsurface = surface_create(640, 480);
if (!surface_exists(windowsurface))
    windowsurface = surface_create(302, 122);
colors_lerp = min(colors_lerp + 0.01, 1);
gradient_lerp = min(gradient_lerp + 0.01, 1);
var current_red = merge_color(colors_last.r, colors_current.r, colors_lerp);
var current_green = merge_color(colors_last.g, colors_current.g, colors_lerp);
var current_blue = merge_color(colors_last.b, colors_current.b, colors_lerp);
var current_light = merge_color(colors_last.l, colors_current.l, colors_lerp);
var gradient_top = merge_color(gradient_last.t, gradient_current.t, gradient_lerp);
var gradient_bottom = merge_color(gradient_last.b, gradient_current.b, gradient_lerp);
var t = 0.002 * current_time;
current_green = merge_color(current_green, current_light, 0.5 + (0.5 * sin(t * 0.4)));
var rain_speed = 0.012 * current_time;
surface_set_target(windowsurface);
draw_clear_alpha(c_black, 0);
if (con == 3 || con == 5)
    window_opacity = scr_approach(window_opacity, 0, 0.01);
else
    window_opacity = scr_approach(window_opacity, 1, 0.01);
draw_sprite_ext(spr_dw_church_bell_Large_topcenter, 0, 151, 10, 1.5, 1.5, sin(t * 0.5) * 24, c_green, bellalpha * 0.75);
hammerobj.image_alpha = hammeralpha;
cityobj.image_alpha = cityalpha * 0.5;
var i = ds_list_size(to_draw) - 1;
while (i >= 0)
{
    var obj = ds_list_find_value(to_draw, i);
    if (instance_exists(obj))
    {
        if (obj.image_alpha > 0)
        {
            if (obj == hammerobj)
            {
                shader_set(shd_prophecy);
                var _tex1 = sprite_get_texture(IMAGE_DEPTH_EXTEND_MONO_SEAMLESS_POW2, 0);
                var _tex2 = sprite_get_texture(textureSprite2, 0);
                shader_set(myShader);
                shader_set_uniform_f(uniformTime, (get_timer() / 1000000) * 10);
                shader_set_uniform_f(uniformOpacity, (obj.image_alpha * 0.6) + (0.1 * sin(current_time * 0.001)));
                shader_set_uniform_f(uniformCol, colour[0], colour[1], colour[2]);
                texture_set_stage(sampler1, _tex1);
                texture_set_stage(sampler2, _tex2);
                draw_to_window(obj);
                shader_reset();
            }
            else
            {
                draw_to_window(obj);
            }
        }
    }
    else
    {
        ds_list_delete(to_draw, i);
    }
    i--;
}
draw_sprite_ext(spr_gersonwindow_water, rain_speed, 232, 0, 2, 2, 0, c_white, 0.4 * window_opacity);
draw_sprite_ext(spr_gersonwindow_water, rain_speed, -38, 0, 2, 2, 0, c_white, 0.4 * window_opacity);
draw_sprite_ext(spr_gersonwindow_water, rain_speed, 92, 0, 2, 2, 0, c_white, 0.4 * window_opacity);
draw_sprite_ext(bg_dw_gerson_arena_stained_glass, 0, 44, 0, 2, 2, 0, c_white, 0.5 * window_opacity);
surface_reset_target();
surface_set_target(bgsurface);
draw_clear_alpha(c_black, 0);
draw_sprite_ext(spr_pxwhite, 0, 0, 0, 640, 480, 0, gradient_bottom, 1);
draw_sprite_ext(spr_20px_white_gradient, 0, 640, 160, 640, 8, 180, gradient_top, 1);
draw_set_blend_mode(bm_add);
draw_surface(windowsurface, 168, 0);
draw_set_blend_mode(bm_normal);
surface_reset_target();
draw_surface_ext(windowsurface, 168, 416, 1, -2, 0, c_white, 0.5);
draw_surface_part(bgsurface, 320 - (320 * image_alpha), 0, 640 * image_alpha, 480, (x + 320) - (320 * image_alpha), y);
draw_set_color(c_black);
ossafe_fill_rectangle(cx + 257, cy, cx + 266, cy + 200, false);
ossafe_fill_rectangle(cx + 372, cy, cx + 381, cy + 200, false);
draw_set_color(c_white);
var adv = 0.01;
if (colcon < 1)
    adv = 0.1;
colcon = scr_approach(colcon, con + 1, adv);
pal_swap_set(spr_dw_gerson_arena_palette, colcon, false);
draw_sprite_ext(bg_dw_gerson_arena_battle, 0, cx, cy, 2, 2, 0, c_white, 1);
pal_swap_reset();
draw_sprite_ext(spr_dw_gerson_arena_shadow, 0, (cx + (0.5 * camerawidth())) - 2, cy + 200, 2, 2, 0, gradient_bottom, 0.4);
if (introflashalpha > 0)
{
    introflashalpha -= 0.3;
    draw_sprite_ext(spr_dw_gerson_arena_shadow, 0, cx + (0.5 * camerawidth()), cy + 200, 2.1, 2.1, 0, c_white, 0.5 * sin(degtorad(introflashalpha * 90)));
}
