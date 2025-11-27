if (init == 0)
{
    player = 0;
    with (obj_mainchara_board)
    {
        if (controlled == 1)
            other.player = id;
    }
    if (side == -1)
    {
        side = 0;
        if (i_ex(player))
        {
            if (player.y < 192)
                side = 1;
        }
        if (room == room_dw_ch3_man)
        {
            depth = 5000;
            if (i_ex(obj_mainchara))
            {
                if (obj_mainchara.y > 250)
                    side = 0;
                else
                    side = 1;
            }
        }
    }
    if (side == 0)
    {
        y = -80;
        endy = 48 + yoff;
    }
    if (side == 1)
    {
        y = 346;
        endy = 218 + yoff;
    }
    x = 128 + xoff;
    if (room == room_dw_ch3_man)
    {
        movespeed = 16;
        if (side == 0)
        {
            y = -80;
            endy = 16;
        }
        if (side == 1)
        {
            y = 480;
            endy = 352;
        }
        x = 128 + xoff;
    }
    init = 1;
    con = 1;
    if (skip == 0)
    {
        if (boardopensound == true)
            snd_play_x(snd_board_lift, 0.5, 1.2);
    }
    if (skip == 1)
    {
        y = endy;
        con = 2;
    }
}
if (con == 1)
{
    if (side == 1)
    {
        if (y > endy)
        {
            y -= movespeed;
        }
        else
        {
            y = endy;
            con = 2;
        }
    }
    if (side == 0)
    {
        if (y < endy)
        {
            y += movespeed;
        }
        else
        {
            y = endy;
            con = 2;
        }
    }
}
if (con == 2)
{
    global.typer = 100;
    global.fc = 0;
    global.msc = 0;
    if (mymessage != -1)
        global.msg[0] = mymessage;
    writer = instance_create(x + 16 + 2, (y + 30) - 2, obj_writer);
    writer.reachedend_sound = reachedend_sound;
    writer.reachedend_sound_play = reachedend_sound_play;
    writer.textsound = textsound;
    writer.mycolor = textcolor;
    writer.skippable = skippable;
    writer.noiseskip = noiseskip;
    writer.rate = rate;
    writer.depth = depth - 5;
    con = 3;
}
if (con == 3)
{
    if (!i_ex(writer))
    {
        if (stay > 0)
        {
            stayer = instance_create_depth(x, y, depth + 1, obj_board_writer_stay);
            stayer.boxcolor = boxcolor;
            scr_doom(stayer, stay);
        }
        instance_destroy();
    }
}
