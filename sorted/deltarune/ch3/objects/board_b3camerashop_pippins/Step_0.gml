scr_depth_board();
if (place_meeting(x, y, obj_mainchara_board))
    event_user(0);
buffer--;
if (myinteract == 3)
{
    buffer = 3;
    if (con == 0)
    {
        global.interact = 1;
        scr_board_score(-100);
        global.flag[1117] += 100;
        timer = 0;
        con = 1;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 15)
        scr_lerpvar("y", y, y - 32, 20, 2, "in");
    if (timer == 65)
    {
        snd_play_x(snd_board_mantle_dash_fast, 1, 1.8);
        snd_play_x(snd_board_splash, 0.4, 1.8);
        scr_lerpvar("x", x, x - 320, 20);
    }
    if (timer == 85)
    {
        global.interact = 0;
        safe_delete(mysolid);
        instance_destroy();
    }
    if (x < (board_tilex(0) - 32))
    {
        with (obj_b3camerashop)
            pipstring = pipstring2;
    }
}
if (i_ex(mysolid))
{
    mysolid.x = x;
    mysolid.y = y - 4;
}
