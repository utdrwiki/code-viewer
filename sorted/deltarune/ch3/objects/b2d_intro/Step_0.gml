if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
if (kr_real == 0)
{
    with (obj_mainchara)
        other.kr_real = id;
}
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        con = -1;
        if (global.flag[1087] == 0)
        {
            global.currentsong[0] = snd_init("glacier.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
            mus_volume(global.currentsong[1], 0, 0);
            mus_volume(global.currentsong[1], 1, 60);
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
                    scr_delay_var("screencolor", merge_color(c_black, #344FD0, i / 5), 10 * i);
            }
            with (obj_mainchara_board)
            {
                canfreemove = false;
                scr_delay_var("canfreemove", true, 50);
            }
            global.flag[1087] = 1;
        }
        else
        {
            con = 1;
        }
    }
    if (con == 1)
    {
        obj_gameshow_swordroute.drawui = false;
        global.swordscreencolor = c_black;
        obj_gameshow_swordroute.screenalpha = 0;
        global.interact = 1;
        obj_mainchara_board.facing = 2;
        timer = 0;
        con = 2;
    }
    if (con == 2)
    {
        timer++;
        if (timer == 1)
        {
            var steps = 8;
            var delay = 15;
            for (var i = 0; i < steps; i++)
            {
                with (obj_gameshow_swordroute)
                    scr_delay_var("screencolor", merge_color(c_black, #334ED2, i / steps), delay * (i - 1));
            }
        }
        if (timer == 16)
            obj_gameshow_swordroute.screenalpha = 1;
        if (timer == 60)
        {
            transition.active = true;
            timer = 0;
            con = 3;
        }
    }
    if (con == 3)
    {
        if (transition.completed == true)
        {
            with (instance_create(1344, 1920, obj_board_screenColorChanger))
            {
                image_blend = #334BD2;
                setxy_board();
            }
            global.currentsong[0] = snd_init("glacier.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
            mus_volume(global.currentsong[1], 0, 0);
            mus_volume(global.currentsong[1], 1, 60);
            global.interact = 0;
            obj_mainchara_board.facing = 0;
            obj_gameshow_swordroute.drawui = true;
            obj_gameshow_swordroute.skip = false;
            safe_delete(transitionmarker);
            con++;
        }
    }
}
else
{
}
if (con == 49.6)
{
    scr_board_sword_repeat();
    if (timer == 15)
    {
        global.currentsong[0] = snd_init("glacier.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
        mus_volume(global.currentsong[1], 0, 0);
        mus_volume(global.currentsong[1], 1, 60);
    }
}
