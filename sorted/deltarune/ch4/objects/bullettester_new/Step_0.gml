if (global.mnfight != 2)
{
    timer++;
    if (timer >= 2)
    {
        global.mnfight = 2;
        global.myfight = -1;
        if (!instance_exists(obj_growtangle))
            instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
        if (!instance_exists(obj_heart))
            scr_moveheart();
        for (i = 1; i < 5; i++)
            global.hp[i] = global.maxhp[i];
        timer = 0;
    }
}
if (keyboard_check_pressed(vk_tab))
{
    if (window_get_width() == 1280)
        window_set_size(640, 480);
    else
        window_set_size(1280, 960);
}
if (keyboard_check_pressed(ord("1")))
{
    if (global.monster[0] == 0)
        global.monster[0] = 1;
    else if (scr_monsterpop() > 1)
        global.monster[0] = 0;
}
if (keyboard_check_pressed(ord("2")))
{
    if (global.monster[1] == 0)
        global.monster[1] = 1;
    else if (scr_monsterpop() > 1)
        global.monster[1] = 0;
}
if (keyboard_check_pressed(ord("3")))
{
    if (global.monster[2] == 0)
        global.monster[2] = 1;
    else if (scr_monsterpop() > 1)
        global.monster[2] = 0;
}
change = 1;
if (keyboard_check_direct(vk_shift))
    change = 10;
if (keyboard_check_pressed(219))
    global.monsterinstance[0].spawntype -= change;
if (keyboard_check_pressed(221))
    global.monsterinstance[0].spawntype += change;
if (keyboard_check_pressed(186))
    global.monsterinstance[1].spawntype -= change;
if (keyboard_check_pressed(222))
    global.monsterinstance[1].spawntype += change;
if (keyboard_check_pressed(190))
    global.monsterinstance[2].spawntype -= change;
if (keyboard_check_pressed(191))
    global.monsterinstance[2].spawntype += change;
if (keyboard_check_pressed(ord("4")))
{
    if (neverendingturn == 0)
    {
        neverendingturn = 1;
        global.turntimer = 99999;
    }
    else
    {
        neverendingturn = 0;
        global.turntimer = 240;
    }
}
if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("R")))
{
    snd_free_all();
    room_restart();
}
if (keyboard_check_pressed(ord("I")))
    global.tempflag[27]++;
if (keyboard_check_pressed(ord("U")) && global.tempflag[27] > 0)
    global.tempflag[27]--;
if (keyboard_check(vk_shift) && keyboard_check_pressed(ord("1")))
{
    var newvalue = get_string("Enter Attack #1 number | current=" + string(string(global.monsterinstance[0].spawntype)), "");
    global.monsterinstance[0].spawntype = real(newvalue);
}
if (keyboard_check(vk_shift) && keyboard_check_pressed(ord("2")))
{
    var newvalue = get_string("Enter Attack #2 number | current=" + string(string(global.monsterinstance[1].spawntype)), "");
    global.monsterinstance[1].spawntype = real(newvalue);
}
if (keyboard_check(vk_shift) && keyboard_check_pressed(ord("3")))
{
    var newvalue = get_string("Enter Attack #3 number | current=" + string(string(global.monsterinstance[2].spawntype)), "");
    global.monsterinstance[2].spawntype = real(newvalue);
}
if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(ord("I")))
{
    var inst = get_string("enter instance name", "");
    var _xx = get_string("enter X position", string(camerax() + 320));
    var _yy = get_string("enter Y position", string(cameray() + 240));
    var __depth = get_string("enter depth", 0);
    if (inst != -1)
        instance_create_depth(real(_xx), real(_yy), real(__depth), asset_get_index(inst));
}
if (keyboard_check_pressed(vk_numpad3))
{
    if (room_speed == 30)
        room_speed = 5;
    else
        room_speed = 30;
}
if (keyboard_check_pressed(vk_backspace))
    drawdebug = 1 - drawdebug;
if (keyboard_check_pressed(ord("B")))
    room_goto(room_bullettest);
global.tempflag[20] = global.monster[0];
global.tempflag[21] = global.monster[1];
global.tempflag[22] = global.monster[2];
global.tempflag[23] = global.monsterinstance[0].spawntype;
global.tempflag[24] = global.monsterinstance[1].spawntype;
global.tempflag[25] = global.monsterinstance[2].spawntype;

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
