scr_populatechars();
instrument = 524;
buffer--;
if (con == 0.1)
{
    con = 99;
    global.interact = 1;
    kris.cutscene = true;
    kr = -4;
    su = -4;
    ra = -4;
    global.facing = 2;
    actor_count = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    var targ = "a";
    var walkspeed = 6;
    var krpos = scr_heromarker("kris", "a");
    var krdist = scr_returnwait_instance(kr_actor, krpos[2], walkspeed);
    var supos = scr_heromarker("susie", "");
    var sudist = scr_returnwait_instance(su_actor, supos[2], walkspeed);
    var rapos = scr_heromarker("ralsei", "");
    var radist = scr_returnwait_instance(ra_actor, rapos[2], walkspeed);
    c_sel(kr);
    if (krdist > 1)
    {
        c_walkdirect(krpos[0], krpos[1], krdist);
        c_delayfacing(krdist + 1, "u");
    }
    else
    {
        c_setxy(krpos[0], krpos[1]);
        c_facing("u");
    }
    c_sel(ra);
    if (radist > 1)
    {
        c_walkdirect(rapos[0], rapos[1], radist);
        c_delayfacing(radist + 1, "u");
    }
    else
    {
        c_setxy(rapos[0], rapos[1]);
        c_facing("u");
    }
    c_sel(su);
    if (sudist > 1)
    {
        c_walkdirect(supos[0], supos[1], sudist);
        c_delayfacing(sudist + 1, "u");
    }
    else
    {
        c_setxy(supos[0], supos[1]);
        c_facing("u");
    }
    c_wait(max(sudist, radist, krdist) + 2);
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
    if (canceltimer > canceltime || forceend)
    {
        forceend = 0;
        var skipcamreset = false;
        if (camerax() == 0 || camerax() == (room_width - 640))
            skipcamreset = true;
        global.flag[7] = 0;
        if (skipcamreset == false)
        {
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
            con = 4;
            if (memvolume != -1)
                snd_volume(global.currentsong[1], memvolume, 5);
        }
    }
    soundtoplay = -1;
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
    var soundplayed = 0;
    if (button1_p() && soundtoplay != -1)
    {
        var mypitch = scr_piano_determinepitch(soundtoplay);
        snd_play_pitch(instrument, mypitch);
        soundplayed = 1;
        notesplayed = true;
        buffer = 0;
    }
    var skipupdate = false;
    if (scr_debug())
    {
        if (keyboard_check_pressed(vk_f5))
        {
            debug_print("solved puzzle");
            skipupdate = true;
            soundplayed = true;
            progress = solution;
        }
    }
    if (soundplayed)
    {
        if (!solved)
        {
            if (!skipupdate)
            {
                var newnote = string(soundtoplay + index);
                progress += newnote;
                if (string_length(progress) > string_length(solution))
                    progress = string_delete(progress, 1, 1);
            }
            if (progress == solution)
            {
                debug_print("yes!");
                solved = 1;
                progress = "";
                global.interact = 1;
                con = 99;
                kris.freeze = false;
                kris.fun = 0;
                kris.cutscene = false;
                with (obj_caterpillarchara)
                    follow = true;
            }
        }
    }
}
if (con == 99)
{
}
if (con == 4)
{
    con = 0;
    timer = 0;
    buffer = 6;
    canceltimer = 0;
    kris.freeze = false;
    kris.fun = 0;
    kris.cutscene = false;
    with (obj_caterpillarchara)
        follow = true;
    global.facing = 0;
    camcon = 0;
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
