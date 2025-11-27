if (con < 0)
    exit;
if (con == 10 && !d_ex() && global.interact == 0)
{
    con = 11;
    alarm[0] = 15;
    global.interact = 1;
    var fadeout = instance_create(0, 0, obj_fadeout);
    fadeout.fadespeed = 0.04;
}
if (con == 12)
{
    con = 13;
    alarm[0] = 15;
    snd_play(snd_escaped);
}
if (con == 14)
{
    con = -1;
    global.interact = 3;
    global.entrance = 3;
    instance_create(0, 0, obj_persistentfadein);
    room_goto(room_dw_console_room);
}
