if (room == room_dw_b3bs_rouxls_lanina)
{
    holeid = -999;
    global.flag[1169] = 1;
    var pointsDisplay = instance_create(x + 16, y, obj_board_pointsGetDisplay);
    pointsDisplay.amount = 100;
    scr_board_marker(x, y, spr_board_holemarker, 0, depth, 2);
    instance_destroy();
}
if (holeid == 0)
{
    var pointsDisplay = instance_create(x + 16, y, obj_board_pointsGetDisplay);
    pointsDisplay.amount = 10;
    scr_board_marker(x, y, spr_board_holemarker, 0, depth, 2);
    instance_destroy();
}
if (holeid == 1)
{
    if (!skip)
    {
        with (obj_board_b3bs_intro)
            con = 1;
    }
    if (global.flag[1040] < 3)
        global.flag[1040] = 3;
    scr_board_marker(x, y, spr_board_holemarker, 0, depth, 2);
    instance_destroy();
}
if (holeid == 2)
{
    scr_board_marker(x, y, spr_board_stairs, 0, depth, 2);
    with (instance_create(x, y, obj_board_bs_warp))
    {
        scr_darksize(id);
        playX = 480;
        playY = 128;
        buffer = 10;
    }
    if (!skip)
        snd_play(snd_link_secret);
    if (global.flag[1040] < 1)
        global.flag[1040] = 1;
    instance_destroy();
}
if (holeid == 3)
{
    scr_board_marker(x, y, spr_board_stairs, 0, depth, 2);
    with (instance_create(x, y, obj_board_bs_warp))
    {
        scr_darksize(id);
        playX = 224;
        playY = 128;
        buffer = 10;
    }
    if (!skip)
        snd_play(snd_link_secret);
    if (global.flag[1040] < 2)
        global.flag[1040] = 2;
    instance_destroy();
}
if (holeid == 9)
{
    digamt = 1;
    var pointsDisplay = instance_create(x + 16, y, obj_board_pointsGetDisplay);
    pointsDisplay.amount = 1;
}
if (holeid == 10)
{
    digamt = 1;
    var pointsDisplay = instance_create(x + 16, y, obj_board_pointsGetDisplay);
    pointsDisplay.amount = 10;
    if (x == 896 && global.flag[1246] == 0)
    {
        pointsDisplay.amount = 100;
        global.flag[1246] = 1;
    }
    scr_board_marker(x, y, spr_board_holemarker, 0, depth, 2);
    instance_destroy();
}
