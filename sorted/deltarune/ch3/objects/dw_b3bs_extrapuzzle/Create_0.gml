if (scr_debug())
    scr_setparty(0, 0, 0);
marksiner = 0;
depth = 999998;
update = false;
block = 0;
bxoff = -128;
byoff = 32;
if (global.flag[1111] > 0 && global.flag[1055] < 6)
{
    block = instance_create(round((global.flag[1109] + bxoff) / 32) * 32, round((global.flag[1110] + byoff) / 32) * 32, obj_pushableblock_board);
    if (global.flag[1109] < 352)
        block.x = -999;
}
prefire = 0;
if (global.flag[1109] == 480 && global.flag[1110] == 224)
    prefire = 1;
solidblock = instance_create(384, 192, obj_board_solid);
doorblock = instance_create(640, 40, obj_solidblock);
with (doorblock)
{
    visible = true;
    depth = 10000;
    image_blend = c_black;
    sprite_index = spr_pxwhite;
    image_xscale = 640;
    image_yscale = 480;
}
trigger = instance_create(352, 256, obj_board_trigger);
with (trigger)
{
    visible = true;
    scr_darksize();
    depth = 999998;
    sprite_index = spr_dw_puzzlecloset_mysterytile;
}
trigd = 0;
pressed = 0;
doorcon = 0;
switchtile = instance_create(512, 128, obj_board_switchtile);
camcontrol = true;
if (global.flag[1112] == 1 || global.flag[1055] >= 6)
{
    camcontrol = false;
    doorcon = 3;
    safe_delete(doorblock);
    with (obj_board_switchtile)
        instance_destroy();
}
debug_message(room_get_name(room) + "start: block x/y=" + string(global.flag[1109]) + "|" + string(global.flag[1110]));
endcon = 0;
if (global.flag[1055] >= 6)
{
    scr_marker_ext(192, 64, spr_pxwhite, 384, 256, undefined, undefined, c_black, 99801);
    endcon = 1;
    global.flag[1111] = 2;
}
roomstart = 0;
