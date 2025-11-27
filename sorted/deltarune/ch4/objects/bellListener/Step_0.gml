if (init == 0)
{
    with (obj_bell_small_playable)
    {
        if (mypitch == 1)
            other.bell1 = id;
        if (mypitch == 1.1)
            other.bell2 = id;
        if (mypitch == 1.2)
            other.bell3 = id;
        if (mypitch == 1.3)
            other.bell4 = id;
        if (mypitch == 1.4)
            other.bell5 = id;
    }
    if (bell1 != 0 && bell2 != 0 && bell3 != 0 && bell4 != 0 && bell5 != 0)
    {
        pat[0] = bell2;
        pat[1] = bell3;
        pat[2] = bell2;
        pat[3] = bell1;
        pat[4] = bell4;
        badpat[0] = bell3;
        badpat[1] = bell3;
        badpat[2] = bell4;
        badpat[3] = bell3;
        init = 1;
    }
}
else
{
    buffer--;
    if (con == 0 && buffer <= 0)
    {
        if (pat[0].con == 1)
        {
            con++;
            buffer = 3;
        }
    }
    if ((con > 0 && con < array_length(pat)) && buffer <= 0)
    {
        with (obj_bell_small_playable)
        {
            if (con == 1)
            {
                if (id == other.pat[other.con])
                {
                    other.con++;
                    other.buffer = 3;
                }
                else
                {
                    other.con = 0;
                    other.buffer = 3;
                }
            }
        }
    }
    if (con == array_length(pat))
    {
        con = 98;
        timer = 0;
    }
    if (con == 98)
    {
        global.interact = 1;
        timer++;
        if (timer == 15)
        {
            snd_play(snd_levelup);
            timer = 0;
            con = 99;
        }
    }
    if (con == 99)
    {
        with (obj_bell_small_playable)
            scr_move_to_point_over_time(x, -90, 15);
        con++;
    }
    if (con == 100)
    {
        timer++;
        if (timer == 14)
        {
            global.interact = 0;
            global.facing = 0;
            con++;
        }
    }
    if (badcon == 0 && buffer <= 0)
    {
        if (badpat[0].con == 1)
        {
            badcon++;
            buffer = 3;
        }
    }
    if ((badcon > 0 && badcon < array_length(badpat)) && buffer <= 0)
    {
        with (obj_bell_small_playable)
        {
            if (con == 1)
            {
                if (id == other.badpat[other.badcon])
                {
                    other.badcon++;
                    other.buffer = 3;
                }
                else
                {
                    other.badcon = 0;
                    other.buffer = 3;
                }
            }
        }
    }
    if (badcon == array_length(badpat))
    {
        badcon = 98;
        blockBlock = instance_create(280, 320, obj_solidblockDark);
        blockBlock.image_xscale = 2;
        layer_set_visible("TILES_FAKE_MAIN", 1);
        snd_play(snd_locker);
        global.facing = 0;
        timer = 0;
    }
    if (badcon == 98)
    {
        timer++;
        if (timer == 45)
            badcon = 99;
    }
    if (badcon == 99)
    {
        dogcar = instance_create(room_width + 64, obj_mainchara.y - 8, obj_dogcar_ch4);
        badcon++;
    }
    if (badcon == 101)
    {
        global.interact = 1;
        with (obj_mainchara)
            alarm[1] = -1;
        black = 1;
        with (obj_dogcar_ch4)
            instance_destroy();
        with (obj_animation)
            instance_destroy();
        with (obj_dmgwriter)
            instance_destroy();
        audio_stop_all();
        audio_play_sound(snd_break2, 50, 0);
        con = 3;
        timer = 0;
        remy = obj_mainchara.y;
        remx = obj_mainchara.x;
        obj_mainchara.visible = false;
        obj_overworldheart.visible = false;
        fellkris = scr_dark_marker(obj_mainchara.x, obj_mainchara.y, spr_kris_fell);
        fellkris.depth = -200;
        badcon++;
    }
    if (badcon == 102)
    {
        timer += 1;
        if (timer >= 45)
        {
            timer = 0;
            badcon = 103;
        }
    }
    if (badcon == 103)
    {
        mus_initloop("gameover_short.ogg");
        instance_create(camerax() + 110, cameray() + 100, obj_dogcar_gameover_ch4);
        badcon = 104;
        timer = 0;
    }
    if (badcon == 104)
    {
        with (fellkris)
        {
            image_alpha -= 0.04;
            y += 4;
        }
        timer += 1;
        if (timer >= 120)
        {
            badcon = 105;
            timer = 0;
            snd_free_all();
            dogcar = instance_create(camerax() + 700, obj_dogcar_gameover_ch4.y + 50, obj_dogcar_ch4);
            dogcar.hspeed = -30;
            dogcar.mode = 1;
        }
    }
    if (badcon == 105)
    {
        if (!instance_exists(obj_dogcar_gameover_ch4))
        {
            timer += 1;
            if (timer >= 100)
            {
                global.interact = 0;
                global.facing = 0;
                fader = instance_create(0, 0, obj_persistentfadein);
                fader.image_alpha = 6;
                fader.fadespeed = -2;
                scr_itemget(33);
                room_goto(room);
            }
        }
    }
}
