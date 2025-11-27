timer = 0;
con = 0;
init = 0;
econ = 0;
bonus = 0;
if (global.flag[910] >= 2)
    bonus++;
if (global.flag[917] >= 3)
    bonus++;
if (global.flag[930])
    bonus++;
layer_set_visible("DEBUG_ASSETS", false);
if (scr_debug())
{
    scr_setparty(1);
    if (keyboard_check(ord("W")))
    {
        if (keyboard_check_pressed(ord("V")))
        {
        }
    }
    var deset = 0;
    if (keyboard_check(ord("1")))
    {
        global.flag[898] = 0;
        deset = true;
    }
    if (keyboard_check(ord("2")))
    {
        global.flag[898] = 1;
        deset = true;
    }
    if (keyboard_check(ord("3")))
    {
        global.flag[898] = 100;
        deset = true;
    }
    if (keyboard_check(ord("4")))
    {
        global.flag[898] = 500;
        deset = true;
    }
    if (keyboard_check(ord("5")))
    {
        global.flag[898] = 2000;
        deset = true;
    }
    if (keyboard_check(ord("6")))
    {
        global.flag[898] = 9999;
        deset = true;
    }
    if (keyboard_check(ord("7")))
    {
        bonus = 1;
        deset = true;
    }
    if (keyboard_check(ord("8")))
    {
        bonus = 0;
        deset = true;
    }
    if (deset)
    {
        debug_print("global.flag[898]=" + string(global.flag[898]));
        debug_print("bonus=" + string(bonus));
    }
}
plack = scr_makenpc("DEBUG_ASSETS", "dspr_npc_plackard_1");
plack.issolid = false;
mynpc = scr_makenpc("DEBUG_ASSETS", "graphic_6A0D95E9");
fountain = 0;
encounterflag = 1787;
encounterno = 191;
if (global.flag[898] == 0)
{
    econ = 1;
    with (mynpc)
    {
        var col = 16777215;
        other.mynpc = scr_marker_ext(marker.x, marker.y, marker.sprite_index, marker.image_xscale, marker.image_yscale, 0, undefined, col, undefined, 1);
        safe_delete(marker);
        instance_destroy();
    }
    if (global.flag[encounterflag] == 1)
    {
        safe_delete(mynpc);
        econ = 99;
    }
}
else
{
    var tr = findspriteinfo(spr_treasurebox);
    with (instance_create(tr.x, tr.y, obj_treasure_room))
        scr_size(2, 2);
}
