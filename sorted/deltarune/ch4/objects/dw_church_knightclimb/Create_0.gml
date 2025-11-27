con = 0;
customcon = 0;
timer = 0;
siner = 0;
image_alpha = 0;
swordcount = 0;
hitcount = 0;
snd_free_all();
killmebro = -4;
if (global.plot == 194)
{
    con = 3;
    customcon = 0;
    global.tempflag[90] = 0;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_facing("u");
    c_waitcustom();
}
else if (scr_debug())
{
    scr_setparty(1, 1);
    if (keyboard_check(ord("P")))
        global.tempflag[90] = 1;
}
for (var i = 0; i < 4; i++)
    global.hp[i] = global.maxhp[i];
layer_set_visible("DEBUG_ASSETS", 0);
cutscene_master = 0;
mylasttrig = 0;
buffer = 0;
wind_effect = instance_create(0, 0, obj_church_wind_effect);
wind_effect.con = 0;
wind_shake_push = false;
wind_shake_timer = 0;
wind_shake_screen = -4;
wind_push = false;
wind_push_timer = 0;
wind_state = 0;
wind_sound = -4;
roaring_knight = instance_create(3040, 4080, obj_ch4_DCA01_roaringknight);
roaring_knight.sprite_index = spr_roaringknight_looking;
roaring_knight.depth = 899990;
camera_pan = false;
camera_pan_timer = 0;
camera_y_pos = 6880;
camera_y_target = 3960;
ralsei_scarf_marker = scr_dark_marker(0, 0, spr_ralsei_walk_up_windy_scarf);
with (ralsei_scarf_marker)
    visible = 0;
var ralsei_post_marker = scr_dark_marker(3060, 1400, spr_ralsei_surprised_left_walk);
anim_player = instance_create(0, 0, obj_anim_custom);
knight_continue = false;
tile_cover = scr_dark_marker(3380, 3880, spr_pixel_white);
with (tile_cover)
{
    image_blend = c_black;
    image_xscale = 40;
    image_yscale = 40;
    scr_depth();
}

knight_notice = function()
{
    anim_timestamps = [200, 200, 150, 150, 200, 500, 200, 60, 60, 60, 60, 60];
    anim_player.init(roaring_knight, 4667, anim_timestamps);
    anim_player.event_connect("anim_end", continue_cutscene);
    anim_player.start();
};

continue_cutscene = function()
{
    knight_continue = true;
};
