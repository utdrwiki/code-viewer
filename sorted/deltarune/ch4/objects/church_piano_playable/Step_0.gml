scr_populatechars();
instrument = 524;
buffer--;
if (con == 0.1)
{
    if (camx != -1)
        camcon = 1;
    con = 99;
    global.interact = 1;
    kris.cutscene = true;
    if (audio_is_playing(global.currentsong[1]))
    {
        memvolume = audio_sound_get_gain(global.currentsong[1]);
        debug_message(memvolume);
        snd_volume(global.currentsong[1], memvolume * 0.125, 15);
    }
    else
    {
        memvolume = -1;
    }
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    var realsusie = -4;
    var realralsei = -4;
    var fullwait = 0;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            realsusie = id;
    }
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            realralsei = id;
    }
    with (obj_light_following)
    {
        if (target == other.kris)
        {
            target = other.kr_actor;
            other.memlightk = id;
        }
    }
    if (i_ex(realsusie))
    {
        with (obj_light_following)
        {
            if (target == realsusie)
                target = other.su_actor;
        }
    }
    if (i_ex(realralsei))
    {
        with (obj_light_following)
        {
            if (target == realralsei)
                target = other.ra_actor;
        }
    }
    var krx = kr_x;
    var kry = kr_y;
    with (obj_krmarker)
    {
        if (extflag == other.extflag)
        {
            krx = x;
            kry = y;
        }
    }
    c_sel(kr);
    var pointdist = point_distance(krx, kry, kr_actor.x, kr_actor.y);
    if (pointdist > 4)
    {
        var walkwait = min(scr_returnwait(kr_actor.x, kr_actor.y, krx, kry, 4), 15);
        fullwait = max(fullwait, walkwait);
        c_walkdirect(krx, kry, walkwait);
        c_delayfacing(walkwait + 1, "u");
    }
    else
    {
        c_setxy(krx, kry);
        c_facing("u");
        debug_print("no need to move");
    }
    if (catafollow)
    {
        if (i_ex(ralsei))
        {
            c_sel(ra);
            var rax = kr_x - 27 - 8;
            var ray = kr_y + 30 + 2 + 1;
            with (obj_ramarker)
            {
                if (extflag == other.extflag)
                {
                    rax = x;
                    ray = y;
                }
            }
            pointdist = point_distance(rax, ray, ra_actor.x, ra_actor.y);
            if (pointdist > 4)
            {
                var walkwait = min(scr_returnwait(ra_actor.x, ra_actor.y, rax, ray, 4), 15);
                fullwait = max(fullwait, walkwait);
                c_walkdirect(rax, ray, walkwait);
                c_delayfacing(walkwait + 1, "u");
            }
            else
            {
                c_setxy(rax, ray);
                c_facing("u");
            }
        }
        if (i_ex(susie))
        {
            c_sel(su);
            var sux = kr_x + 30;
            var suy = kr_y + 30;
            with (obj_sumarker)
            {
                if (extflag == other.extflag)
                {
                    sux = x;
                    suy = y;
                }
            }
            pointdist = point_distance(sux, suy, su_actor.x, su_actor.y);
            if (pointdist > 4)
            {
                var walkwait = min(scr_returnwait(su_actor.x, su_actor.y, sux, suy, 4), 15);
                fullwait = max(fullwait, walkwait);
                c_walkdirect(sux, suy, walkwait);
                c_delayfacing(walkwait + 1, "u");
            }
            else
            {
                c_setxy(sux, suy);
                c_facing("u");
            }
        }
    }
    c_wait(max(fullwait, 1));
    c_var_instance(id, "resetlight", 1);
    c_wait(1);
    c_var_instance(id, "con", 0.2);
    c_actortokris();
    c_actortocaterpillar();
    c_customfunc(function()
    {
        global.facing = 2;
        if (catafollow)
        {
            with (obj_caterpillarchara)
            {
                x = scr_even(x);
                y = scr_even(y);
                for (var i = 0; i < 75; i += 1)
                    facing[i] = 2;
            }
        }
    });
    c_terminatekillactors();
}
if (resetlight == 1)
{
    resetlight = 0;
    with (obj_light_following)
    {
        if (i_ex(other.susie))
        {
            if (target == other.su_actor)
                target = other.susie;
        }
        if (i_ex(other.ralsei))
        {
            if (target == other.ra_actor)
                target = other.ralsei;
        }
    }
    if (i_ex(memlightk))
    {
        with (memlightk)
            target = other.kris;
    }
}
if (con == 0.2 && !i_ex(cutscene_master))
{
    global.interact = 0;
    global.facing = 2;
    obj_mainchara.freeze = true;
    global.flag[7] = 1;
    con = 1;
    engaged = true;
}
if (con == 1)
{
    if (button2_h())
        canceltimer++;
    else
        canceltimer = 0;
    if (canceltimer >= canceltime || forceend)
    {
        var skipcamreset = false;
        if (dontresetproperly)
            skipcamreset = true;
        if (camerax() == 0 || camerax() == (room_width - 640))
            skipcamreset = true;
        global.flag[7] = 0;
        if (skipcamreset == false)
        {
            debug_print("skipcamreset=false");
            if (memvolume != -1)
                snd_volume(global.currentsong[1], memvolume, 15);
            con = 3;
            var desx = camerax();
            var desy = cameray();
            with (obj_mainchara)
            {
                var roomw = room_width;
                var roomh = room_height;
                var vieww = view_wport[0];
                var viewh = view_hport[0];
                desx = clamp((x - floor((vieww / 2) - (initwd / 2))) + nudgex, 0, roomw - vieww);
                desy = clamp((y - floor((viewh / 2) - (initht / 2))) + nudgey, 0, roomh - viewh);
            }
            scr_lerpvar("camxoverride", camerax(), desx, 4);
            scr_lerpvar("camyoverride", cameray(), desy, 4);
            scr_delay_var("con", 4, 8);
        }
        else
        {
            debug_print("skipcamreset=true");
            con = 4;
            if (memvolume != -1)
                snd_volume(global.currentsong[1], memvolume, 5);
        }
    }
    soundtoplay = -1;
    if (difficulty == 0)
    {
        if (!left_h() && !down_h() && !right_h() && !up_h())
            soundtoplay = 0;
        if (left_h())
            soundtoplay = 1;
        if (down_h())
            soundtoplay = 3;
        if (right_h())
            soundtoplay = 5;
        if (up_h())
            soundtoplay = 7;
    }
    if (difficulty == 1)
    {
        if (!left_h() && !down_h() && !right_h() && !up_h())
            soundtoplay = 0;
        if (left_h() && !down_h() && !right_h() && !up_h())
            soundtoplay = 1;
        if ((left_h() && down_h()) && !up_h() && !right_h())
            soundtoplay = 2;
        if (down_h() && !left_h() && !right_h() && !up_h())
            soundtoplay = 3;
        if ((down_h() && right_h()) && !left_h() && !up_h())
            soundtoplay = 4;
        if (right_h() && !left_h() && !down_h() && !up_h())
            soundtoplay = 5;
        if ((up_h() && right_h()) && !down_h() && !left_h())
            soundtoplay = 6;
        if (up_h() && !left_h() && !down_h() && !right_h())
            soundtoplay = 7;
        if ((up_h() && left_h()) && !down_h() && !right_h())
            soundtoplay = 8;
    }
    var soundplayed = 0;
    if (button1_p() && soundtoplay != -1 && !button2_h())
    {
        var mypitch = scr_piano_determinepitch(soundtoplay);
        snd_play(instrument, 0.7, mypitch);
        soundplayed = 1;
        notesplayed = true;
        buffer = 0;
    }
    if (soundplayed)
    {
        if (!solved)
        {
            var newnote = string(soundtoplay);
            progress += newnote;
            if (string_length(progress) > string_length(solution))
                progress = string_delete(progress, 1, 1);
            if (progress == solution)
            {
                var completiontype = 1;
                if (completiontype == 0)
                    solved = 1;
                if (completiontype == 1)
                {
                    con = 30;
                    timer = 0;
                }
            }
        }
    }
}
if (con == 30)
{
    timer++;
    if (timer == 1)
        snd_play(snd_noise);
    if (timer == 30)
    {
        var playspeed = 6;
        var solinput = [];
        for (var i = 0; i < string_length(solution); i++)
            solinput[i] = string_char_at(solution, i + 1);
        for (var i = 0; i < array_length(solinput); i++)
            snd_play_delay(instrument, 1 + (i * playspeed), 1, scr_piano_determinepitch(solinput[i]));
        con = 31;
        var completiontime = 1 + (playspeed * array_length(solinput)) + 10;
        scr_delay_var("solved", true, completiontime);
        scr_delay_var("con", 1, completiontime);
    }
}
if (con == 4)
{
    forceend = 0;
    con = 0;
    timer = 0;
    buffer = 6;
    canceltimer = 0;
    if (!dontresetproperly)
    {
        kris.cutscene = false;
        global.facing = 0;
    }
    kris.freeze = false;
    kris.fun = 0;
    camcon = 0;
    dontresetproperly = false;
    dontdrawmenu = false;
}
if (camcon == 1)
{
    kris.cutscene = true;
    camxoverride = camerax();
    camyoverride = cameray();
    scr_lerpvar("camxoverride", camerax(), camx, 15);
    scr_lerpvar("camyoverride", cameray(), camy, 15);
    camcon = 2;
}
if (camcon == 2)
{
    kris.cutscene = true;
    camera_set_view_pos(view_camera[0], round(camxoverride), round(camyoverride));
}
