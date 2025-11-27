var movetime = 20;
var waittime = 20;
if (dosep == 1 || keyboard_check_pressed(ord("P")))
{
    amt = 0;
    dosep = 2;
    scr_lerpvar("amt", 0, 1, movetime, 2, "in");
    scr_delay_var("dosep", 3, movetime + waittime);
}
if (dosep == 3)
{
    dosep = 4;
    scr_lerpvar("amt", amt, 0, waittime, 2, "out");
    scr_delay_var("dosep", 0, waittime + 1);
}
var sep = 20 * amt;
var dir = 0;
if (room == room_dw_churchb_moneyfountain)
    dir = 1;
if (dir == 0)
    siner++;
if (dir == 1)
    siner--;
if (siner <= 0)
    siner = 9999999;
var alf = 1 - (amt / 2);
if (dir == 1 && global.flag[898] == 0)
    siner = 0;
anim_index = siner * 0.26666666666666666;
draw_sprite_ext(spr_dw_church_waterfall_bottom, anim_index, round(x - sep), y, 2, 2, 0, c_white, alf);
draw_sprite_ext(spr_dw_church_waterfall_bottom, anim_index, round(x + 40 + sep), y, 2, 2, 0, c_white, alf);
for (var v = 1; v < 7; v++)
{
    draw_sprite_ext(spr_dw_church_waterfall_tile, anim_index, round((x + 0) - sep), y - (40 * v), 2, 2, 0, c_white, 1 - (amt / 2));
    draw_sprite_ext(spr_dw_church_waterfall_tile, anim_index, round(x + 40 + sep), y - (40 * v), 2, 2, 0, c_white, 1 - (amt / 2));
}
if (!surface_exists(clip_surface))
    clip_surface = surface_create(40, 160);
if (!surface_exists(clip_surface2))
    clip_surface2 = surface_create(40, 160);
var clip_x = round(x - sep);
var clip_y = y - 160;
surface_set_target(clip_surface);
draw_clear_alpha(c_black, 0);
gpu_set_fog(1, #0071D5, 0, 0);
with (obj_mainchara)
    draw_sprite_ext(sprite_index, image_index, x - clip_x, y - clip_y, image_xscale, image_yscale, image_angle, c_black, alf);
with (obj_caterpillarchara)
    draw_sprite_ext(sprite_index, image_index, x - clip_x, y - clip_y, image_xscale, image_yscale, image_angle, c_black, alf);
gpu_set_fog(0, c_white, 0, 0);
surface_reset_target();
clip_x = round(x - sep);
clip_y = y - 160;
surface_set_target(clip_surface);
draw_clear_alpha(c_black, 0);
gpu_set_fog(1, #0071D5, 0, 0);
with (obj_mainchara)
    draw_sprite_ext(sprite_index, image_index, x - clip_x, y - clip_y, image_xscale, image_yscale, image_angle, c_black, alf);
with (obj_caterpillarchara)
    draw_sprite_ext(sprite_index, image_index, x - clip_x, y - clip_y, image_xscale, image_yscale, image_angle, c_black, alf);
gpu_set_fog(0, c_white, 0, 0);
surface_reset_target();
draw_surface(clip_surface, clip_x, clip_y);
clip_x = round(x + 40 + sep);
surface_set_target(clip_surface2);
draw_clear_alpha(c_black, 0);
gpu_set_fog(1, #0071D5, 0, 0);
with (obj_mainchara)
    draw_sprite_ext(sprite_index, image_index, x - clip_x, y - clip_y, image_xscale, image_yscale, image_angle, c_black, alf);
with (obj_caterpillarchara)
    draw_sprite_ext(sprite_index, image_index, x - clip_x, y - clip_y, image_xscale, image_yscale, image_angle, c_black, alf);
gpu_set_fog(0, c_white, 0, 0);
surface_reset_target();
draw_surface(clip_surface2, clip_x, clip_y);
