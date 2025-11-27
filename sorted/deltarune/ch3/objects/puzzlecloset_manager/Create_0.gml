depth = 999999;
if (scr_debug())
    scr_setparty(1, 1, 0);
surf1 = -1;
surf2 = -1;
surf3 = -1;
surf4 = -1;
surf5 = -1;
surf6 = -1;
surf1b = -1;
surf2b = -1;
surf3b = -1;
surf4b = -1;
surf5b = -1;
surf6b = -1;
shuffle = 1;
nextloc = 0;
view_enabled = true;
vwid = 128;
vhei = 160;
view_visible[0] = true;
timer = 0;
wrapchar = false;
crtinit = 0;
instance_create(x, y, obj_dw_ch3_tvsnow);
if (room == room_dw_puzzlecloset_1)
{
    var xloc = 1552;
    var yloc = 208;
    vwid = 128;
    vhei = 160;
    view_visible[1] = true;
    view_set_wport(1, vwid);
    view_set_hport(1, vhei);
    camera_destroy(view_camera[1]);
    view_camera[1] = camera_create_view(xloc, yloc, vwid, vhei);
    xloc = 1424;
    view_visible[2] = true;
    view_set_wport(2, vwid);
    view_set_hport(2, vhei);
    camera_destroy(view_camera[2]);
    view_camera[2] = camera_create_view(xloc, yloc, vwid, vhei);
    xloc = 1680;
    view_visible[3] = true;
    view_set_wport(3, vwid);
    view_set_hport(3, vhei);
    camera_destroy(view_camera[3]);
    view_camera[3] = camera_create_view(xloc, yloc, vwid, vhei);
}
if (room == room_dw_puzzlecloset_2)
{
    vwid = 160;
    vhei = 128;
    var xloc = 3008;
    var yloc = 192;
    var yspace = 128;
    var camwid = 160;
    var camhei = 128;
    view_visible[1] = true;
    view_set_wport(1, vwid);
    view_set_hport(1, vhei);
    camera_destroy(view_camera[1]);
    view_camera[1] = camera_create_view(xloc + (vwid * 0), yloc + (yspace * 0), camwid, camhei);
    view_visible[2] = true;
    view_set_wport(2, vwid);
    view_set_hport(2, vhei);
    camera_destroy(view_camera[2]);
    view_camera[2] = camera_create_view(xloc + (vwid * 1), yloc + (yspace * 0), camwid, camhei);
    view_visible[3] = true;
    view_set_wport(3, vwid);
    view_set_hport(3, vhei);
    camera_destroy(view_camera[3]);
    view_camera[3] = camera_create_view(xloc + (vwid * 2), yloc + (yspace * 0), camwid, camhei);
    view_visible[4] = true;
    view_set_wport(4, vwid);
    view_set_hport(4, vhei);
    camera_destroy(view_camera[4]);
    view_camera[4] = camera_create_view(xloc + (vwid * 0), yloc + (yspace * 1), camwid, camhei);
    view_visible[5] = true;
    view_set_wport(5, vwid);
    view_set_hport(5, vhei);
    camera_destroy(view_camera[5]);
    view_camera[5] = camera_create_view(xloc + (vwid * 1), yloc + (yspace * 1), camwid, camhei);
    view_visible[6] = true;
    view_set_wport(6, vwid);
    view_set_hport(6, vhei);
    camera_destroy(view_camera[6]);
    view_camera[6] = camera_create_view(xloc + (vwid * 2), yloc + (yspace * 1), camwid, camhei);
    doorsolid = instance_create(3424, 224, obj_board_softsolid);
}
if (room == room_dw_puzzlecloset_3)
{
    var xloc = 2688;
    var yloc = 608;
    var yspace = 128;
    var camwid = 384;
    var camhei = 256;
    vwid = 384;
    vhei = 256;
    view_visible[1] = true;
    view_set_wport(1, vwid);
    view_set_hport(1, vhei);
    camera_destroy(view_camera[1]);
    view_camera[1] = camera_create_view(xloc + (vwid * 0), yloc + (yspace * 0), camwid, camhei);
}
keycon = 0;
camcontrol = true;
caterinit = 0;
if (scr_debug())
{
    if (keyboard_check(ord("I")))
    {
        global.flag[1055] = 1;
        debug_print("Sword Route Active");
    }
}
var swordroute = false;
if (global.flag[1055] > 0)
    swordroute = true;
if (swordroute)
{
    with (obj_pushableblock_board)
    {
        instance_create(x, y, obj_dw_puzzlecloset_1_bush);
        instance_destroy();
    }
}
if (room == room_dw_puzzlecloset_0)
    camcontrol = false;
if (room == room_dw_puzzlecloset_2)
{
    if (swordroute)
    {
        keycon = 999;
        safe_delete(doorsolid);
        doorsolid = 0;
    }
}
if (global.flag[1233] == 1)
{
    with (obj_doorAny)
    {
        if (x > 640)
        {
            scr_delay_var("doorDelay", -1, 2);
            scr_delay_var("doorFadeMusic", 1, 2);
            scr_delay_var("doorFadeMusicTime", 14, 2);
        }
    }
}
pc3fuzzinit = 0;
fuzzsnd = 0;
fuzzvol = 0;
pc3check = 0;
endcon = 0;
if (global.flag[1055] >= 6)
{
    if (room == room_dw_puzzlecloset_3)
        scr_marker_ext(512, 32, spr_pxwhite, 400, 256, undefined, undefined, c_black, 99801);
    with (obj_dw_puzzlecloset_dooriel)
        instance_destroy();
    endcon = 1;
}
