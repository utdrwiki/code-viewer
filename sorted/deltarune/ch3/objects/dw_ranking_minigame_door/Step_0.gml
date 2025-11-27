if (con < 0)
    exit;
if (con == 10 && !d_ex())
{
    con = 11;
    alarm[0] = 30;
    global.interact = 1;
    open_door();
}
if (con == 12)
{
    con = 13;
    alarm[0] = 30;
    instance_create(0, 0, obj_fadeout);
}
if (con == 14)
{
    con = -1;
    if (difficulty >= 0)
        global.band_difficulty = difficulty;
    room_goto(game_room);
}
if (con == 30 && !d_ex() && global.interact == 0)
{
    con = -1;
    global.interact = 1;
    global.msc = 1349;
    scr_text(global.msc);
    d_make();
}
if (con == 50 && !d_ex())
{
    con = 51;
    alarm[0] = 30;
    snd_play(snd_item);
    var door_readable = instance_create(door_marker.x, door_marker.y + 50, obj_readable_room1);
    with (door_readable)
    {
        extflag = "door_susiezilla";
        image_xscale = 8;
        image_yscale = 2;
    }
    with (poster_readable)
        extflag = "poster_coming_soon_susiezilla";
}
if (con == 52)
    con = -1;
