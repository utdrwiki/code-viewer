con = -1;
customcon = 0;
start_timer = 0;
side_b = scr_sideb_active();
if (!side_b || global.plot < 63 || global.plot >= 91)
{
    instance_destroy();
    exit;
}
if (!i_ex(obj_homealone_vent_loader))
{
    var loader = instance_create(0, 0, obj_homealone_vent_loader);
    loader.load_room = 52;
    loader.load_vent = "noelle";
}
with (obj_homealone_heart)
    cutscene = 1;
heart_choice_x = 0;
heart_choice_y = 0;
heart_bump_check = false;
heart_fall = false;
heart_fall_timer = 0;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 100;
blackall.image_blend = c_black;
blackall.visible = 0;
noelle_npc = scr_marker(188, 85, spr_noelle_sit);
with (noelle_npc)
    scr_depth();
kris_marker = scr_marker(135, 93, spr_kris_sit);
with (kris_marker)
    scr_depth();
desaturate_fx = instance_create(0, 0, obj_ch4_PDC14A_noelle_desaturate);
desaturate_fx.depth = kris_marker.depth + 20;
desaturate_fx.con = 0;
desaturate_fx.palette_index = 0;
vent_cover_marker = -4;
vent_panel_marker = -4;
pause_heart = false;
unpause_heart = false;
heart_explore = false;
heart_explore_con = 0;
heart_explore_timer = 0;
heart_check = false;
drip_marker = scr_marker(510, 535, spr_rose);
drip_marker.depth = blackall.depth - 10;
drip_marker.image_xscale = 1;
drip_marker.image_yscale = 1;
drip_marker.visible = 0;
drip_timestamps = [1000, 100, 50, 200, 1000];
drip_modifier = 30;
drip_index = 0;
drip_timer = 0;
con = 0;
auto_text = false;
auto_text_buffer_time = 90;
auto_text_buffer = auto_text_buffer_time;
auto_text_start = false;
auto_text_stop = false;
kris_heart_check = false;
exit_block = -4;
ticking_sfx = false;
ticking_sfx_timer = 0;
shake_text = false;
shake_amount = 1;
set_text_speed = false;
text_speed = 1;
desaturate_room = false;
saturate_room = false;
blood_drip = false;
noelle_x = 497;
noelle_y = 512;
debug_skip = false;
krishandshakecon = 0;
krishandshakeval = 0.1;
ominousfademarker1 = scr_marker(0, 0, spr_vfx_ominousFade);
ominousfademarker1.image_alpha = 0;
ominousfademarker2 = scr_marker(0, 0, spr_vfx_ominousFade);
ominousfademarker2.image_alpha = 0;
ominousfademarker3 = scr_marker(0, 0, spr_vfx_ominousFade);
ominousfademarker3.image_alpha = 0;
ominousfademarker1.depth = 6000;
ominousfademarker2.depth = 6000;
ominousfademarker3.depth = 6000;
fademarksin = 0;
fadesinamt = 1;
idealfadesinamt = 1;
fadecon = 0;
