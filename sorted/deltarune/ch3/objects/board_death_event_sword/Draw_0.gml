draw_set_color(red);
ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480);
draw_set_color(c_white);
draw_self_board();
if (con == 0)
{
    timer++;
    if (timer == 1)
        snd_play(snd_fall);
    if (timer < 48)
    {
        if ((timer % 4) == 0)
            facing--;
    }
    if (timer == 40)
    {
        red = 7079;
        obj_gameshow_swordroute.screencolor = red;
    }
    if (timer == 50)
    {
        red = 5241;
        obj_gameshow_swordroute.screencolor = red;
    }
    if (timer == 60)
    {
        red = 0;
        obj_gameshow_swordroute.screencolor = red;
    }
    if (timer == 61)
        obj_gameshow_swordroute.drawui = false;
    if (timer == 90)
    {
        with (instance_create_depth(x, y, 99999, obj_tvturnoff_manager))
            yoff = -64;
        snd_free_all();
        safe_delete(obj_writer);
        safe_delete(obj_board_writer);
        depth = 100000;
        obj_gameshow_swordroute.drawui = false;
        obj_board_controller.drawcrt = false;
        drawblack = true;
        with (obj_mainchara_board)
            controlled = 0;
    }
    if (timer == 120)
    {
        global.interact = 0;
        obj_mainchara.freeze = false;
        obj_mainchara.fun = false;
        global.facing = 0;
        room_goto(room_board_sword_intro);
    }
}
if (facing > 3)
    facing = 0;
if (facing < 0)
    facing = 3;
sprite_index = face[facing];
