if (!place_meeting(x, y, obj_board_grayregion))
    blushamt = -1;
scr_depth_board();
if (init == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kr = id;
    }
    if (kr != 0)
        init = 1;
}
if (active == 1)
{
    var _xx, _yy;
    if (con == 1)
    {
        pushed = true;
        for (var i = 0; i < 3; i++)
            snd_play_delay(snd_wing, 1 + (2 * i), 1, 1.5 + (i / 20));
        _xx = 0;
        _yy = 0;
        if (dir == "right")
            _xx = 32;
        if (dir == "left")
            _xx = -32;
        if (dir == "down")
            _yy = 32;
        if (dir == "up")
            _yy = -32;
        x += _xx;
        y += _yy;
        var checker = instance_place(x, y, obj_board_solid);
        if (checker == -4)
            checker = collision_rectangle(132, 68, 508, 92, object_index, true, false);
        if (checker == -4)
            checker = collision_rectangle(132, 292, 508, 316, object_index, true, false);
        if (checker == -4)
            checker = collision_rectangle(132, 68, 156, 316, object_index, true, false);
        if (checker == -4)
            checker = collision_rectangle(484, 68, 508, 316, object_index, true, false);
        if (checker != -4)
            con = 99;
        else
            con = 2;
        x -= _xx;
        y -= _yy;
    }
    if (con == 2)
    {
        scr_lerpvar("x", x, x + _xx, pushspeed);
        scr_lerpvar("y", y, y + _yy, pushspeed);
        timer = 0;
        con = 3;
    }
    if (con == 3)
    {
        timer++;
        if (timer >= pushspeed)
        {
            con = 98;
            timer = 0;
            global.interact = 0;
        }
    }
    if (con == 98)
    {
        timer++;
        if (timer == 6)
        {
            safe_delete(mysolid);
            with (fakeground)
            {
                scr_lerpvar("image_index", 0, 4, 8);
                scr_doom(id, 10);
            }
            door = instance_create(x, y, obj_board_warptouch);
            with (door)
            {
                setxy_board(1960, 1160);
                warpx = 896;
                warpy = 1344;
                playerX = 1184;
                playerY = 1440;
            }
            con++;
        }
    }
    if (con == 99)
        con = 0;
}
else if (daddy != 0)
{
    if (!(x >= 128 && x <= 512 && y >= 64 && y <= 320))
        instance_destroy();
}
