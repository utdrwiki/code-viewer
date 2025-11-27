if (kris == 0)
{
    with (obj_mainchara_board)
        other.kris = id;
}
if (con == 0)
{
    if (global.plot < 180)
        global.plot = 180;
    markerbar = scr_board_marker(board_tilex(0), board_tiley(-1), spr_pxwhite, 0, 100000, 32);
    markerbar.image_xscale = 640;
    markerbar.image_blend = c_black;
    obj_gameshow_swordroute.drawui = false;
    global.interact = 1;
    obj_mainchara_board.facing = 0;
    obj_mainchara_board.sword = true;
    obj_mainchara_board.swordlv = 3;
    if (room == room_board_preshadowmantle_repeat)
    {
        obj_mainchara_board.sword = true;
        obj_mainchara_board.swordlv = 5;
    }
    if (room == room_board_dungeon_3)
    {
        with (obj_mainchara_board)
            setxy_board(1072, 1456);
    }
    timer = 0;
    con = 1;
}
var _screencolor = #7C344F;
if (room == room_board_preshadowmantle_repeat)
    _screencolor = c_black;
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        var steps = 8;
        var delay = 15;
        for (var i = 0; i < steps; i++)
        {
            with (obj_gameshow_swordroute)
                scr_delay_var("screencolor", merge_color(c_black, _screencolor, i / steps), delay * (i - 1));
        }
    }
    if (timer == 60)
    {
        transition.active = true;
        timer = 0;
        con = 2;
    }
}
if (con == 2)
{
    if (transition.completed == true)
    {
        if (room != room_board_preshadowmantle_repeat)
        {
            global.currentsong[0] = snd_init("root_8bit.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
        }
        global.interact = 0;
        obj_mainchara_board.facing = 0;
        obj_gameshow_swordroute.drawui = true;
        obj_gameshow_swordroute.skip = false;
        safe_delete(markerbar);
        con++;
    }
}
if (con == 10)
{
    global.currentsong[0] = snd_init("root_8bit.ogg");
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
    fader = scr_board_marker(board_tilex(0), board_tiley(0), spr_pxwhite, 0, 100000, 640);
    fader.image_blend = c_black;
    with (fader)
    {
        for (var i = 0; i < 6; i++)
            scr_delay_var("image_alpha", 1 - (i / 5), 10 * i);
    }
    with (obj_gameshow_swordroute)
    {
        for (var i = 0; i < 6; i++)
            scr_delay_var("screencolor", merge_color(c_black, #7C344F, i / 5), 10 * i);
    }
    with (obj_mainchara_board)
    {
        facing = 2;
        canfreemove = false;
        scr_delay_var("canfreemove", true, 50);
    }
    con++;
}
if (con == 420)
{
    scr_board_sword_repeat();
    if (timer == 1)
    {
        if (room == room_board_dungeon_3)
        {
            with (obj_mainchara_board)
                setxy_board(1072, 1552);
        }
    }
    if (timer == 20)
    {
        global.currentsong[0] = snd_init("root_8bit.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
    }
}
