if (i_ex(obj_board_camera))
{
    if (obj_board_camera.con != 0)
        instance_destroy();
}
timer++;
if (timer == 30)
    instance_destroy();
scr_depth_board();
for (i = 5; i > 0; i -= 1)
{
    remx[i] = remx[i - 1];
    remy[i] = remy[i - 1];
}
remx[0] = x;
remy[0] = y;
var ignoresolid = false;
if (place_meeting(x, y, obj_board_breakableblock))
{
    with (instance_place(x, y, obj_board_breakableblock))
    {
        instance_create(x, y, obj_board_breakpoof);
        snd_play(snd_board_splash);
        instance_destroy();
        ignoresolid = true;
    }
}
if (place_meeting(x, y, obj_mainchara_board))
{
    with (instance_place(x, y, obj_mainchara_board))
    {
        if (name != "susie")
        {
            if (iframes <= 0 && myhealth > 0)
            {
                iframes = 20;
                snd_play(snd_board_playerhurt);
                myhealth -= other.damage;
            }
        }
    }
}
if (place_meeting(x, y, obj_board_penaltyshot))
{
    with (instance_place(x, y, obj_board_penaltyshot))
        hit = 1;
}
if (place_meeting(x, y, obj_board_watertile))
    ignoresolid = true;
var destroy = false;
if (ignoresolid == false)
{
    if (place_meeting(x, y, obj_board_solid))
        destroy = true;
}
if (x < 128 || x > 480 || y < 48 || y > 288)
    destroy = true;
if (destroy == true)
{
    scr_board_afterimage(0, 3);
    instance_destroy();
}
