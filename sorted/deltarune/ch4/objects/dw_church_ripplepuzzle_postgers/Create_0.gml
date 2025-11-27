layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
        global.entrance = 5;
        global.plot = 140;
    }
}
init = 0;
gerson = 0;
con = 0;
lamp_marker = scr_dark_marker(2860, 978, spr_dw_church_lantern);
with (lamp_marker)
    scr_depth();
light_marker = scr_dark_marker(2760, 1092, spr_dw_church_switch);
with (light_marker)
    scr_depth();
light_marker.image_index = 1;
lightint = instance_create(2766, 1126, obj_trigger_interact);
with (lightint)
{
    talked = 0;
    scr_sizeexact(32, 24);
}
sucon = 0;
con = 99;
timer = 0;
gercon = 99;
gertimer = 0;
var songfile = "church_wip.ogg";
sparkle = -4;
if (global.plot < 141)
{
    con = 0;
    gercon = 0;
    gerint = 0;
    gerint = instance_create(2722, 1160, obj_trigger_interact);
    with (gerint)
    {
        talked = 0;
        scr_sizeexact(60, 32);
    }
    global.plot = 140;
    if (scr_debug())
        scr_setparty(1, 1, 0);
    gerson = scr_marker_ext(2680, 1118, spr_gerson_outfit_walk_cane, 2, 2, 0, 0, undefined, 91020);
    if (global.entrance == 5 || (scr_debug() && keyboard_check(ord("W"))))
    {
        scr_setparty(1, 1, 0);
        global.facing = 0;
        with (obj_mainchara)
            setxy(2510, 1120);
        with (obj_caterpillarchara)
        {
            if (name == "susie")
            {
                setxy(2589, 1104);
                scr_caterpillar_interpolate();
                for (var i = 0; i < 25; i++)
                    facing[i] = 3;
            }
            if (name == "ralsei")
            {
                setxy(2412, 1108);
                scr_caterpillar_interpolate();
                for (var i = 0; i < 25; i++)
                    facing[i] = 1;
            }
        }
    }
    songfile = "gerson_theme_intro.ogg";
}
else if (global.plot <= 145)
{
    songfile = "gerson_theme_intro.ogg";
    if (global.plot == 141)
        scr_setparty(0);
    if (global.flag[1604] == 1)
        scr_setparty(1, 1);
}
sparkle = -4;
if (global.plot >= 150 && global.plot < 225)
{
    sparkle = scr_makenpc_fromasset(findsprite(spr_shine_white, "DEBUG_ASSETS"));
    sparkle.siner = 0;
    sparkle.issolid = false;
}
scr_musicer(songfile);
turtle = -4;
if (global.plot >= 225)
    turtle = scr_makenpc_fromasset(findsprite(spr_incense_spared, "DEBUG_ASSETS"));
memspeed = -1;
depth = 0;
var saveLoc = findspriteinfo(spr_savepoint, "DEBUG_ASSETS");
with (instance_create(saveLoc.x, saveLoc.y, obj_savepoint))
{
    if (global.tempflag[90] == 1)
    {
        global.tempflag[90] = 0;
        image_alpha = 0;
        scr_lerpvar("image_alpha", 0, 1, 15);
        scr_tempsave();
    }
}
organik = -4;
blocker = -4;
if (global.plot >= 242)
    organik = scr_makenpc_fromasset(findsprite(spr_npc_organik_3_talk, "DEBUG_ASSETS"));
