con = -1
customcon = 0
auto_text = 0
auto_con = -1
shortened = 0
tempcon = -1
smoketimer = 0
smokecon = 0
var tiled_wall = instance_create(-10, 437, obj_cyber_wall_lights)
with (tiled_wall)
{
    total_width = (sprite_get_width(sprite_index) * 16)
    depth = 5000
}
var tiled_wall_end = instance_create(590, 437, obj_cyber_wall_lights_right)
with (tiled_wall_end)
    depth = 4900
coaster_entry_shadow = scr_dark_marker(-35, -22, bg_dw_city_coaster_entry_shadow)
coaster_entry_shadow.depth = 100000
coaster_entry = scr_dark_marker(-39, -5, bg_dw_city_coaster_entry)
coaster_entry.depth = (coaster_entry_shadow.depth - 100)
coaster_entry_hood = scr_dark_marker(-39, -5, bg_dw_city_coaster_entry_hood)
coaster_entry_hood.depth = (coaster_entry.depth - 100)
coaster_ramp = scr_dark_marker(1800, 28, bg_dw_city_coaster_ramp)
coaster_ramp.depth = 90000
coaster_ramp.visible = true
coaster_kris = instance_create(800, 72, obj_coaster)
with (coaster_kris)
    scr_depth()
coaster_kris.visible = false
coaster_susie = instance_create(800, 118, obj_coaster)
coaster_susie.type = 1
with (coaster_susie)
    scr_depth()
coaster_susie.visible = false
coaster_ralsei = instance_create(800, 181, obj_coaster)
coaster_ralsei.type = 2
with (coaster_ralsei)
    scr_depth()
coaster_ralsei.visible = false
coaster_berdly = instance_create(1890, 126, obj_coaster)
coaster_berdly.type = 3
with (coaster_berdly)
    scr_depth()
coaster_noelle = instance_create(1890, 105, obj_coaster)
coaster_noelle.type = 4
coaster_noelle.depth = 95000
nise_berdly = scr_dark_marker(-100, 0, spr_cutscene_17_berdly_shocked)
with (nise_berdly)
    scr_depth()
parallax = 1
loopcity = 0
looptrack = 0
tiletrack = 0
stoplooptrack = 0
hide_border = 0
if (global.chapter != 2 || global.plot >= 64)
    instance_destroy()
else
{
    if (global.tempflag[28] == 1)
        shortened = 1
    doorway = scr_dark_marker(458, 205, spr_pixel_white)
    doorway.image_xscale = 22
    doorway.image_yscale = 22
    doorway.depth = 0
    doorway.image_blend = c_black
    doorway.image_alpha = 0.75
    whiteall = scr_dark_marker(-10, -10, spr_pixel_white)
    whiteall.image_xscale = 999
    whiteall.image_yscale = 999
    whiteall.depth = 100
    whiteall.image_alpha = 0
    blackall = scr_dark_marker(-10, -10, spr_pixel_white)
    blackall.image_xscale = 999
    blackall.image_yscale = 999
    blackall.depth = 50
    blackall.image_blend = c_black
    blackall.image_alpha = 0
    explode = 0
    explosion = -1
    explodetimer = -1
    explosion_marker = -1
    noise_con = -2
    pan_timer = 0
}
