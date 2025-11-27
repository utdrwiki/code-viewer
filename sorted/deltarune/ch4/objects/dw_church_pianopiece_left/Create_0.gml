if (scr_debug())
    scr_setparty(1, 1);
var xoff = -1560;
var yoff = -920;
global.flag[7] = 0;
warpcon = 0;
layer_set_visible("debug_assets", 0);
init = 0;
cutscene = -1;
darkness = instance_create(x, y, obj_darkness_overlay);
solidblock = instance_create(2160 + xoff, 2400 + yoff, obj_solidblocksized);
with (solidblock)
{
    sprite_index = spr_pxwhite;
    scr_size(560, 120);
    image_blend = c_black;
    depth = 999999;
}
layer_set_visible("Tiles_addedwalkway", 0);
layer_set_visible("tiles_hiddenpole", 0);
hiddenlightx = -4;
hiddenlighty = -4;
hiddentilex = -4;
hiddentiley = -4;
var spritesArray = layer_get_all_elements("debug_assets");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 5707)
    {
        var info = scr_assetgetinfo(spritesArray[i]);
        hiddentilex = info[2];
        hiddentiley = info[3];
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 5597)
    {
        var info = scr_assetgetinfo(spritesArray[i]);
        hiddenlightx = info[2];
        hiddenlighty = info[3];
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 1861)
    {
        hiddennpc = scr_marker_fromasset(spritesArray[i]);
        hiddennpc.image_speed = 1/3;
        hiddennpc.depth = layer_get_depth("Tiles_new_main") + 10;
    }
}
if (scr_debug())
{
    if (keyboard_check(ord("P")))
        global.flag[894] = 0;
}
trcon = 0;
if (global.flag[894] > 0)
{
    trcon = 999;
    safe_delete(solidblock);
    layer_set_visible("Tiles_addedwalkway", 1);
    layer_set_visible("tiles_hiddenpole", 1);
    with (instance_create(hiddenlightx, hiddenlighty, obj_lantern_shrinking))
    {
        r_littlesize = 64;
        r_bigsize = 240;
        r_maxtimer = 80;
        r_timebuffer = 0;
        extflag = "light";
        nointeract = true;
    }
    with (instance_create(hiddentilex, hiddentiley, obj_dw_church_glowtile))
        extflag = "light";
}
bg = instance_create(x, y, obj_dw_church_darkroombg);
