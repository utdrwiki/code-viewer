if (!scr_debug())
    instance_destroy();
if (up_h())
    ubuff++;
else
    ubuff = 0;
if (down_h())
    dbuff++;
else
    dbuff = 0;
if (left_h())
    lbuff++;
else
    lbuff = 0;
if (right_h())
    rbuff++;
else
    rbuff = 0;
but1_h = keyboard_check(ord("Z")) || gamepad_button_check(0, gp_face1) || gamepad_button_check(1, gp_face1);
but1_p = keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(1, gp_face1);
but2_h = keyboard_check(ord("X")) || gamepad_button_check(0, gp_face2) || gamepad_button_check(1, gp_face2);
but2_p = keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(0, gp_face2) || gamepad_button_check_pressed(1, gp_face2);
but3_h = keyboard_check(ord("C")) || gamepad_button_check(0, gp_face4) || gamepad_button_check(1, gp_face4);
but3_p = keyboard_check_pressed(ord("C")) || gamepad_button_check_pressed(0, gp_face4) || gamepad_button_check_pressed(1, gp_face4);
but4_h = keyboard_check(ord("V")) || gamepad_button_check(0, gp_face3) || gamepad_button_check(1, gp_face3);
but4_p = keyboard_check_pressed(ord("V")) || gamepad_button_check_pressed(0, gp_face3) || gamepad_button_check_pressed(1, gp_face3);
but5_h = keyboard_check(ord("E")) || gamepad_button_check(0, gp_shoulderr) || gamepad_button_check(1, gp_shoulderr);
but5_p = keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(0, gp_shoulderr) || gamepad_button_check_pressed(1, gp_shoulderr);
but6_h = keyboard_check(ord("Q")) || gamepad_button_check(0, gp_shoulderl) || gamepad_button_check(1, gp_shoulderl);
but6_p = keyboard_check_pressed(ord("Q")) || gamepad_button_check_pressed(0, gp_shoulderl) || gamepad_button_check_pressed(1, gp_shoulderl);
quit = keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_select) || gamepad_button_check_pressed(1, gp_select);
var updatecurrent = false;
var addnew = false;
var renderaudio = false;
var copytext = false;
if (keyboard_check(vk_control) && keyboard_check_pressed(ord("C")))
    copytext = true;
if (but3_p)
{
    addnew = true;
    but3_p = 0;
}
if (but4_p)
{
    updatecurrent = true;
    but4_p = 0;
}
if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_shoulderrb) || gamepad_button_check_pressed(1, gp_shoulderrb))
    renderaudio = true;
if (page == 0)
{
    var repeatrate = 7;
    if (ubuff == 1)
        ubuff = repeatrate;
    if (lbuff == 1)
        lbuff = repeatrate;
    if (dbuff == 1)
        dbuff = repeatrate;
    if (rbuff == 1)
        rbuff = repeatrate;
    if (ubuff && (ubuff % repeatrate) == 0)
    {
        mpos--;
        ubuff++;
    }
    if (lbuff && (lbuff % repeatrate) == 0)
    {
        mpos -= 10;
        lbuff++;
    }
    if (dbuff && (dbuff % repeatrate) == 0)
    {
        mpos++;
        dbuff++;
    }
    if (rbuff && (rbuff % repeatrate) == 0)
    {
        mpos += 10;
        rbuff++;
    }
    if (mpos < 0)
        mpos += soundtotal;
    if (mpos > (soundtotal - 1))
        mpos -= soundtotal;
    cursound = soundName[mpos];
    pageind[0] = mpos;
}
else if (page == 1)
{
    var repeatrate = 7;
    if (ubuff == 1)
        ubuff = repeatrate;
    if (lbuff == 1)
        lbuff = repeatrate;
    if (dbuff == 1)
        dbuff = repeatrate;
    if (rbuff == 1)
        rbuff = repeatrate;
    var down = 0;
    var up = 0;
    var left = 0;
    var right = 0;
    if (ubuff && (ubuff % repeatrate) == 0)
    {
        up = 1;
        ubuff++;
    }
    if (lbuff && (lbuff % repeatrate) == 0)
    {
        left = 1;
        lbuff++;
    }
    if (dbuff && (dbuff % repeatrate) == 0)
    {
        down = 1;
        dbuff++;
    }
    if (rbuff && (rbuff % repeatrate) == 0)
    {
        right = 1;
        rbuff++;
    }
    if (down)
        mpos++;
    if (up)
        mpos--;
    if (mpos == 0)
    {
        if (left)
            curvolume -= 0.05;
        if (right)
            curvolume += 0.05;
        curvolume = clamp(curvolume, 0, 2);
    }
    if (mpos == 1)
    {
        if (left)
            curpitch -= 0.05;
        if (right)
            curpitch += 0.05;
        curpitch = clamp(curpitch, 0, 20);
    }
    if (mpos == 2)
    {
        if (left)
            curdelay -= 1;
        if (right)
            curdelay += 1;
        if (but1_p)
        {
            but1_p = 0;
            curdelay = get_integer("Enter Delay", curdelay);
        }
        if (curdelay < 0)
            curdelay = 0;
    }
    if (mpos == 3)
    {
        if (left)
            curlooprate -= 1;
        if (right)
        {
            curlooprate += 1;
            if (curlooprate == 0)
                curlooprate = 1;
        }
        if (but1_p)
        {
            but1_p = 0;
            curlooprate = get_integer("Enter Loop Rate", curlooprate);
        }
        if (curlooprate < 1)
            curlooprate = -1;
    }
    if (mpos == 4)
    {
        if (left || right || but1_p)
        {
            curkillsnd = !curkillsnd;
            but1_p = 0;
        }
    }
    if (mpos == 5)
    {
        if (but1_p)
        {
            but1_p = 0;
            addnew = true;
        }
    }
    if (mpos == 6)
    {
        if (but1_p)
        {
            but1_p = 0;
            updatecurrent = true;
        }
    }
    if (mpos == 7)
    {
        if (but1_p)
        {
            but1_p = 0;
            if (sndcount > 0)
            {
                array_delete(snd, cursnd, 1);
                array_delete(pitch, cursnd, 1);
                array_delete(delay, cursnd, 1);
                array_delete(volume, cursnd, 1);
                array_delete(looprate, cursnd, 1);
                array_delete(killsnd, cursnd, 1);
                sndcount--;
                array_push(snd, -1);
                array_push(pitch, 1);
                array_push(delay, 0);
                array_push(volume, 1);
                array_push(looprate, -1);
                array_push(killsnd, false);
                cursnd--;
                if (cursnd < 0)
                    cursnd = 0;
            }
        }
    }
    if (mpos == 8)
    {
        if (but1_p)
        {
            but1_p = 0;
            renderaudio = true;
        }
    }
    if (mpos == 9)
    {
        if (left)
            curlifetime -= 1;
        if (right)
        {
            curlifetime += 1;
            if (curlifetime == 0)
                curlifetime = 1;
        }
        if (but1_p)
        {
            but1_p = 0;
            curlifetime = get_integer("Enter Lifetime", curlifetime);
        }
        if (curlifetime < 1)
            curlifetime = -1;
    }
    if (mpos == 10)
    {
        if (left || right || but1_p)
        {
            curkillall = !curkillall;
            but1_p = 0;
        }
    }
    if (mpos == 11)
    {
        if (left || right || but1_p)
        {
            curkillind = !curkillind;
            but1_p = 0;
        }
    }
    if (mpos > 11)
        mpos = 0;
    if (mpos < 0)
        mpos = 11;
    pageind[1] = mpos;
}
if (page == 2)
{
    if (dbuff == 1)
        cursnd++;
    if (ubuff == 1)
        cursnd--;
    if (cursnd < 0)
        cursnd = sndcount - 1;
    if (cursnd > (sndcount - 1))
        cursnd = 0;
    if (but5_p || (keyboard_check_pressed(vk_tab) && !keyboard_check(vk_alt)) || but6_p)
    {
        if (sndcount > 0)
        {
            cursound = snd[cursnd];
            curvolume = volume[cursnd];
            curpitch = pitch[cursnd];
            curdelay = delay[cursnd];
            curlooprate = looprate[cursnd];
            curkillsnd = killsnd[cursnd];
            var soundtofind = audio_get_name(snd[cursnd]);
            for (var i = 0; i < array_length(soundName); i++)
            {
                if (soundName[i] == soundtofind)
                    pageind[0] = i;
            }
        }
    }
}
var maxpage = 2;
if (but5_p || (keyboard_check_pressed(vk_tab) && !keyboard_check(vk_alt)))
{
    but5_p = 0;
    pageind[page] = mpos;
    page++;
    if (page > maxpage)
        page = 0;
    mpos = pageind[page];
}
if (but6_p)
{
    but6_p = 0;
    pageind[page] = mpos;
    page--;
    if (page < 0)
        page = maxpage;
    mpos = pageind[page];
}
if (but1_p)
{
    snd_stop(playsnd);
    playsnd = snd_play(asset_get_index(cursound), curvolume, curpitch);
}
if (but2_p)
{
    snd_stop(playsnd);
    with (complexsound)
    {
        killall = true;
        instance_destroy();
    }
}
if (copytext)
{
    but3_p = 0;
    addnew = false;
    var commandstring = "var snd=snd_play_complex(" + string(curkillall) + "," + string(curkillind) + "," + string(curlifetime) + ");\t";
    for (var i = 0; i < sndcount; i++)
        commandstring += ("snd_add_complex(snd," + string(i) + "," + string(audio_get_name(snd[i])) + "," + string(pitch[i]) + "," + string(volume[i]) + "," + string(delay[i]) + "," + string(looprate[i]) + "," + string(killsnd[i]) + ");\t");
    debug_print("Copied command to clipboard");
    clipboard_set_text(commandstring);
}
if (quit)
    instance_destroy();
if (addnew)
{
    cursound = soundName[pageind[0]];
    snd[sndcount] = asset_get_index(cursound);
    volume[sndcount] = curvolume;
    pitch[sndcount] = curpitch;
    delay[sndcount] = curdelay;
    looprate[sndcount] = curlooprate;
    killsnd[sndcount] = curkillsnd;
    sndcount++;
    cursnd = sndcount - 1;
}
if (updatecurrent)
{
    cursound = soundName[pageind[0]];
    snd[cursnd] = asset_get_index(cursound);
    volume[cursnd] = curvolume;
    pitch[cursnd] = curpitch;
    delay[cursnd] = curdelay;
    looprate[cursnd] = curlooprate;
    killsnd[cursnd] = curkillsnd;
    if (i_ex(complexsound))
        renderaudio = true;
}
if (renderaudio)
{
    snd_stop(playsnd);
    with (obj_snd_complex)
    {
        killall = true;
        instance_destroy();
    }
    complexsound = snd_play_complex(curlifetime, curkillall, curkillind);
    for (var i = 0; i < sndcount; i++)
    {
        if (snd[i] != -1)
            snd_add_complex(complexsound, i, snd[i], pitch[i], volume[i], delay[i], looprate[i], killsnd[i]);
    }
}
