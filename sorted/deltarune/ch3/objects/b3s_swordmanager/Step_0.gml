if (kris == 0)
{
    with (obj_mainchara_board)
        other.kris = id;
}
if (init == 0)
{
    if (i_ex(kris))
    {
        init = 1;
        global.flag[1055] = 3;
        if (global.plot < 180)
            global.plot = 180;
        global.interact = 1;
        obj_mainchara_board.facing = 0;
        var xpos = obj_mainchara_board.x;
        var ypos = obj_mainchara_board.y;
        susie = instance_create(xpos, ypos, obj_board_caterpillarchara);
        ralsei = instance_create(xpos, ypos, obj_board_caterpillarchara);
        ralsei.name = "ralsei";
        ralsei.facing = 0;
        susie.facing = 0;
        with (obj_board_caterpillarchara)
            scr_board_b3s_interpolatecaterpillarchara();
    }
}
if (con == 0)
{
    timer = 0;
    con = 1;
}
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
                scr_delay_var("screencolor", merge_color(c_black, #4DAFFF, i / steps), delay * (i - 1));
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
        global.currentsong[0] = snd_init("board_ocean.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
        mus_volume(global.currentsong[1], 0, 0);
        mus_volume(global.currentsong[1], 1, 60);
        global.interact = 0;
        obj_mainchara_board.facing = 0;
        obj_gameshow_swordroute.drawui = true;
        obj_gameshow_swordroute.skip = false;
        con++;
    }
}
if (con == 10)
    scr_board_sword_repeat();
if (kpause == 1)
{
    global.interact = 1;
    ktimer++;
    if (ktimer == 1)
    {
        scr_shakeobj_ext(1185, 4, 0);
        obj_mainchara.sprite_index = spr_krisu_holdcontroller_slightright;
    }
    if (ktimer == 30)
    {
        obj_mainchara.sprite_index = spr_krisu_holdcontroller;
        global.interact = 0;
        ktimer = 0;
        kpause = 0;
    }
}
if (con != 999)
{
    var trig = 0;
    with (obj_board_trigger)
    {
        if (scr_onscreen(id))
        {
            if (place_meeting(x, y, obj_mainchara_board))
                trig = true;
        }
    }
    if (trig)
    {
        timer = 0;
        con = 999;
    }
}
if (con == 999)
{
    timer++;
    if (timer == 1)
    {
        global.interact = 1;
        snd_play(snd_board_escaped);
        marker = scr_board_marker(board_tilex(0), board_tiley(0), spr_pxwhite, 0, 900000, 640);
        marker.image_blend = c_black;
        marker.image_alpha = 0;
        mus_volume(global.currentsong[1], 0, 50);
    }
    var count = 5;
    for (var i = 1; i < (count + 1); i++)
    {
        if (timer == (10 * i))
        {
            obj_gameshow_swordroute.screencolor = merge_color(#003CCE, c_black, i / count);
            marker.image_alpha = i / count;
        }
    }
    if (timer == (10 * (count + 1)))
    {
        obj_gameshow_swordroute.screencolor = c_black;
        global.swordscreencolor = c_black;
        global.interact = 0;
        global.flag[1055] = 4;
        room_goto(room_board_dungeon_3);
    }
}
