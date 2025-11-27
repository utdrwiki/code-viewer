con = 0;
customcon = 0;
timer = 0;
init = 0;
siner = 0;
depth = 100000;
background_orb_alpha = 0;
foreground_orb_alpha = 0;
background_spotlight_alpha = 0;
everyman_appeared = 0;
layer_set_visible("DEBUG_ASSETS", false);
layer_set_visible("TILES_FOREXPANSION", false);
scr_setparty(1, 1, 0);
if (scr_debug())
{
    if (!snd_is_playing(global.currentsong[1]) && global.tempflag[96] == 0)
    {
        global.currentsong[0] = snd_init("titan_tower.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
    }
    if (keyboard_check(ord("P")))
    {
    }
}
prophecyactive = false;
prophecy[0] = 0;
prophecy[1] = 0;
prophecy[2] = 0;
init = 0;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 9999;
blackall.image_yscale = 999;
blackall.depth = 110;
blackall.image_blend = c_black;
blackall.visible = 1;
heal_fx_kris = false;
heal_fx_ralsei = false;
beam_fx = false;
beam_marker = scr_dark_marker(0, 0, spr_heal_beam_small);
with (beam_marker)
    visible = 0;
titan_actor = instance_create(3952, -88, obj_titan_enemy_actor);
titan_actor.depth = 100000;
wind_track[0] = -4;
wind_track[1] = -4;
wind_track_start = false;
wind_track_fade = false;
shortened = false;
if (global.tempflag[96] > 0)
{
    shortened = true;
    con = 10;
    blackall.image_blend = c_white;
}

regain_control = function()
{
    global.interact = 0;
    global.facing = 0;
    var kr_x = kr_actor.x;
    var kr_y = kr_actor.y;
    obj_mainchara.x = kr_x;
    obj_mainchara.y = kr_y;
    obj_mainchara.visible = 1;
    obj_mainchara.cutscene = 0;
    var su_x = su_actor.x;
    var su_y = su_actor.y;
    var ra_x = ra_actor.x;
    var ra_y = ra_actor.y;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
        {
            x = su_x;
            y = su_y;
        }
        else if (name == "ralsei")
        {
            x = ra_x;
            y = ra_y;
        }
        scr_caterpillar_interpolate();
        visible = 1;
    }
    with (obj_actor)
        visible = 0;
};

lose_control = function()
{
    global.interact = 1;
    kr_actor.x = obj_mainchara.x;
    kr_actor.y = obj_mainchara.y;
    kr_actor.sprite_index = obj_mainchara.sprite_index;
    var su_x = 0;
    var su_y = 0;
    var su_sprite = -4;
    var ra_x = 0;
    var ra_y = 0;
    var ra_sprite = -4;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
        {
            su_x = x;
            su_y = y;
            su_sprite = sprite_index;
        }
        else if (name == "ralsei")
        {
            ra_x = x;
            ra_y = y;
            ra_sprite = sprite_index;
        }
    }
    su_actor.x = su_x;
    su_actor.y = su_y;
    su_actor.sprite_index = su_sprite;
    ra_actor.x = ra_x;
    ra_actor.y = ra_y;
    ra_actor.sprite_index = ra_sprite;
    with (obj_actor)
        visible = 1;
    with (obj_caterpillarchara)
        visible = 0;
    with (obj_mainchara)
        visible = 0;
};

cup = -4;
