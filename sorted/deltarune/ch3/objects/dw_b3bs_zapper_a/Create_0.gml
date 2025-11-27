if (scr_debug())
    scr_setparty(1, 1, 0);
var range = 180;
for (var i = 0; i < 3; i++)
{
    with (instance_create(426 + (range * i), 272.5, obj_dw__backstagelight))
    {
        type = 1;
        movetype = 0;
        wally = 240;
        detecttype = 1;
        movespeed = 100;
        rate = 32;
    }
}
with (instance_create(426 + (range * 3), 316, obj_dw__backstagelight))
{
    type = 1;
    movetype = 1;
    wally = 240;
    movespeed = 100;
    rate = 32;
}
con = 0;
timer = 0;
if (global.flag[1103] == 0)
{
    with (instance_create(1480, 120, obj_solidblocksized))
    {
        sprite_index = spr_pxwhite;
        visible = true;
        image_blend = c_black;
        image_xscale = 320;
        image_yscale = 240;
        depth = 1000049;
    }
    with (instance_create(1440, 320, obj_solidblocksized))
    {
        sprite_index = spr_pxwhite;
        visible = true;
        image_blend = c_black;
        image_xscale = 40;
        image_yscale = 40;
        depth = 1000049;
    }
}
ccon = 0;
ctimer = 0;
if (global.flag[1135] == 1)
    ccon = 100;
camx = 0;
var makestealth = true;
if (global.flag[1137] > 0)
{
    with (obj_dw__backstagelight)
        instance_destroy();
}
if (makestealth)
{
    with (scr_dark_marker(344, 142, scr_84_get_sprite("spr_dw_ch3_b3bs_stealthzone")))
    {
        depth = 1000050;
        image_blend = #65381B;
    }
    scr_stealth_drawmarkers();
}
paannounce = 0;
pa = 0;
if (global.flag[1136] == 1)
    paannounce = 99;
patime = 0;
if (global.flag[1184] == 0)
    fastcon = 1;
else
    fastcon = -1;
closeddoor = instance_create(194, 108, obj_solidblock);
with (closeddoor)
{
    sprite_index = spr_dw_ch3_b3bs_closeddoor;
    scr_darksize();
    visible = true;
    depth = 1000049;
}
doortrig = 0;
doortrig = instance_create(194, 205, obj_trigger_interact);
with (doortrig)
    scr_size(6.25, 1.875);
if (global.flag[1137] == 1)
{
    safe_delete(closeddoor);
    safe_delete(doortrig);
}
doorcon = 0;
