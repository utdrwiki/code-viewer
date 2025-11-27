scr_board_populatevars();
if (obj_board_camera.con != 0)
    instance_destroy();
if (init == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
    kris.canfreemove = 0;
    init = 1;
}
if (instance_exists(kris))
{
    if (kris.iframes > 0)
        _end = 99;
}
if (con == 0 && global.interact == 0)
{
    if (controllable)
    {
        if (up_h() || remoteu)
            uholdbuff++;
        else
            uholdbuff = -1;
        if (down_h() || remoted)
            dholdbuff++;
        else
            dholdbuff = -1;
        if (left_h() || remotel)
            lholdbuff++;
        else
            lholdbuff = -1;
        if (right_h() || remoter)
            rholdbuff++;
        else
            rholdbuff = -1;
        if (up_h() && down_h())
        {
            dholdbuff = -1;
            uholdbuff = -1;
        }
        if (left_h() && right_h())
        {
            lholdbuff = -1;
            rholdbuff = -1;
        }
    }
    else
    {
        if (remoteu)
            uholdbuff++;
        else
            uholdbuff = -1;
        if (remoted)
            dholdbuff++;
        else
            dholdbuff = -1;
        if (remotel)
            lholdbuff++;
        else
            lholdbuff = -1;
        if (remoter)
            rholdbuff++;
        else
            rholdbuff = -1;
    }
    buffmodrate = 2;
    if ((dholdbuff % buffmodrate) == 0)
    {
        y += 16;
        snd_stop(snd_menumove);
        snd_play_x(snd_menumove, 0.5, 1.1);
    }
    if ((uholdbuff % buffmodrate) == 0)
    {
        y -= 16;
        snd_stop(snd_menumove);
        snd_play_x(snd_menumove, 0.5, 1.2);
    }
    if ((lholdbuff % buffmodrate) == 0)
    {
        x -= 16;
        snd_stop(snd_menumove);
        snd_play_x(snd_menumove, 0.5, 1.1);
    }
    if ((rholdbuff % buffmodrate) == 0)
    {
        x += 16;
        snd_stop(snd_menumove);
        snd_play_x(snd_menumove, 0.5, 1.2);
    }
    if (controllable)
    {
        if (button2_p())
            _end = 99;
        else if (button1_p())
            event_user(1);
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        if (i_ex(ralsei))
        {
            memralfun = ralsei.fun;
            memralspr = ralsei.sprite_index;
            ralsei.fun = true;
        }
        if (i_ex(susie))
        {
            memsusfun = susie.fun;
            memsusspr = susie.sprite_index;
            susie.fun = true;
        }
        if (i_ex(kris))
        {
            memkrsfun = kris.fun;
            memkrsspr = kris.sprite_index;
            kris.fun = true;
        }
    }
    var shutterwait = 1;
    var closetime = 4;
    var opentime = 3;
    var closepause = 3;
    var photowaittime = 15;
    if (timer == 1)
        camshot = true;
    if (timer == shutterwait)
        scr_lerpvar("rectprog", 0, 1, closetime);
    if (timer == (shutterwait + closetime))
        event_user(0);
    if (timer == (shutterwait + closepause + closetime))
    {
        scr_lerpvar("rectprog", 1, 0, opentime);
        kris.canfreemove = 0;
    }
    if (createphoto)
    {
        if (timer == ((shutterwait + closepause + closetime + opentime) - 1))
        {
        }
        if (timer == 61)
        {
            var photox = (x + ((camwidth / 2) * 32)) - 16;
            var photoy = (y + ((camheight / 2) * 32)) - 16;
            photo = scr_board_marker(photox, photoy, spr_board_photo, 0, depth + 1, 2);
            with (photo)
            {
                var starcount = 16;
                for (var i = 0; i < starcount; i++)
                {
                    var star = scr_board_marker(x, y, spr_board_star_8px, 0, depth + 1);
                    with (star)
                    {
                        direction = (i / starcount) * 360;
                        speed = 20;
                        friction = 0.1;
                        image_index = irandom(3);
                        scr_doom(id, 15);
                    }
                }
            }
            timer = -15;
            cameraframe = false;
            con++;
        }
    }
    else if (timer == 21)
    {
        _end = true;
    }
}
if (con == 2)
{
    timer++;
    if (timer == 5)
    {
        if (i_ex(kris))
        {
            kris.fun = true;
            kris.facing = 0;
            kris.sprite_index = kris.dsprite_item;
            var _kris = kris;
            with (photo)
            {
                scr_lerpvar("x", x, _kris.x, 5, 2, "in");
                scr_lerpvar("y", y, _kris.y - 32, 5, 2, "out");
            }
        }
    }
    if (timer == 20)
    {
        snd_play(snd_link_sfx_itemget);
        makestars = true;
    }
    var photodescendtime = 6;
    if (timer == 50)
    {
        photo.depth = kris.depth;
        with (photo)
            scr_lerpvar("y", y, y + 30, photodescendtime, 2, "out");
        scr_doom(photo, photodescendtime);
    }
    if (timer == ((60 + photodescendtime) - 10))
        _end = true;
}
if (_end)
{
    if (i_ex(kris))
    {
        kris.fun = 0;
        kris.canfreemove = true;
    }
    if (_end != 99)
    {
        if (i_ex(susie))
        {
            susie.fun = memsusfun;
            susie.sprite_index = memsusspr;
        }
        if (i_ex(ralsei))
        {
            ralsei.fun = memralfun;
            ralsei.sprite_index = memralspr;
        }
    }
    if (flagtoset != 0)
    {
        global.flag[flagtoset] = 1;
        with (obj_b2pantheonentrance)
            flagtoset = other.flagtoset;
        var photocount = global.flag[1041] + global.flag[1042] + global.flag[1043] + global.flag[1227];
        if (global.flag[1022] == 1)
            notalk = true;
        var tetalk = stringsetloc("You got SPECIAL PHOTO! Just 2 more!!!", "obj_board_playercamera_slash_Step_0_gml_290_0");
        if (photocount == 2)
            tetalk = stringsetloc("Another SPECIAL PHOTO! Just 1 more!!!", "obj_board_playercamera_slash_Step_0_gml_290_0_b");
        if (photocount == 3)
            tetalk = stringsetloc("Three SPECIAL PHOTOs! Head back to KODAKODA SHRINE...", "obj_board_playercamera_slash_Step_0_gml_287_0");
        if (photocount == 4)
            tetalk = stringsetloc("A FOURTH SPECIAL PHOTO?! Unbelievable!!!", "obj_board_playercamera_slash_Step_0_gml_292_0");
        if (flagtoset != 0)
        {
            if (notalk == false)
            {
                with (obj_actor_tenna)
                    bounce = 1;
                scr_couchtalk(tetalk, "tenna", 2, 120);
            }
        }
    }
    for (var i = 0; i < array_length(photoarray); i++)
    {
        if (i_ex(photoarray[i]))
            photoarray[i].frozen = false;
    }
    instance_destroy();
}
if (makestars == true && i_ex(photo))
{
    var stardepth = kris.depth + 1;
    makestarstimer++;
    if ((makestarstimer % 2) == 0)
    {
        var star = scr_board_marker(photo.x, photo.y, spr_board_star_8px, 0, stardepth);
        with (star)
        {
            direction = other.makestarstimer * 20;
            speed = 5;
            friction = 0.25;
            image_index = irandom(3);
            scr_doom(id, random_range(13, 16));
        }
        star = scr_board_marker(photo.x, photo.y, spr_board_star_8px, 0, stardepth);
        with (star)
        {
            direction = (other.makestarstimer * 20) + 180;
            speed = 5;
            friction = 0.25;
            image_index = irandom(3);
            scr_doom(id, random_range(13, 16));
        }
    }
    if (makestarstimer >= 16)
        makestars = false;
}
remoted = 0;
remoteu = 0;
remotel = 0;
remoter = 0;
