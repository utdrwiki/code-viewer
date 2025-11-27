scr_depth();
depth += 1000;
if (init == 0)
{
    if (x1 == -1)
        x1 = xstart;
    if (y1 == -1)
        y1 = ystart;
    if (r_traveltime == -1)
        traveltime = clamp(round(point_distance(x1, y1, x2, y2) / 12) + 1, 15, 60);
    else
        traveltime = r_traveltime;
    if (r_travelstyle != -1)
        travelstyle = r_travelstyle;
    init = 1;
}
if (con == 0)
{
    if (global.interact == 0)
    {
        var trig = 0;
        trigtype = 0;
        if (i_ex(obj_climb_kris))
            trig = 2;
        if (trig == 0)
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 10;
        }
        if (trig == 2)
        {
            if (obj_climb_kris.neutralcon == 1)
            {
                if (place_meeting(x, y, obj_climb_kris))
                {
                    global.interact = 1;
                    trig = 4;
                }
            }
        }
        if (trig == 10)
        {
            global.interact = 1;
            con = 1;
            timer = 0;
        }
        if (trig == 4)
        {
            snd_play(snd_noise);
            timer = 0;
            con = 2;
            stick = true;
            xprediction = x;
            yprediction = y;
            trigtype = 1;
        }
    }
}
if (con == 0.5)
{
    timer++;
    if (timer == 1)
        global.interact = 1;
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        obj_mainchara.visible = false;
        obj_mainchara.freeze = true;
        obj_mainchara.cutscene = true;
        endtime = 8;
        with (obj_caterpillarchara)
        {
            visible = 1;
            image_alpha = 1;
            scr_lerp_imageblend(id, c_white, c_gray, 7);
            scr_lerpvar("image_alpha", 1, 0, 7);
        }
        jumpmarker = scr_marker_ext(obj_mainchara.x, obj_mainchara.y, spr_kris_jump_ball_fixed, 2, 2, 0.25, 0, c_white, obj_mainchara.depth);
        with (jumpmarker)
            scr_jump_to_point(other.x - 2, other.y - 22, 8, other.endtime, true);
        snd_play(snd_wing);
    }
    if (timer == (1 + endtime))
    {
        snd_play(snd_noise);
        safe_delete(jumpmarker);
        instance_create(x + 20, y + 20, obj_climb_kris);
        timer = 0;
        con = 2;
        stick = true;
        xprediction = x;
        yprediction = y;
    }
}
if (con == 2)
{
    timer++;
    if (timer == (1 + waittime))
    {
        var ver = 0;
        if (x == x2 && y == y2)
            ver = 1;
        var xtarg = x2;
        var ytarg = y2;
        if (ver == 1)
        {
            xtarg = x1;
            ytarg = y1;
        }
        debug_print("ver=" + string(ver));
        if (travelstyle == 0)
        {
            scr_lerpvar("x", x, xtarg, traveltime, 2, "out");
            scr_lerpvar("y", y, ytarg, traveltime, -1, "in");
        }
    }
    if (i_ex(obj_rotating_tower_controller_new))
    {
        if (timer == waittime)
        {
            var ver = 0;
            if (x == x2 && y == y2)
                ver = 1;
            var xtarg = x2;
            var ytarg = y2;
            movedwithclimb = 1 - ver;
            if (ver == 1)
            {
                xtarg = x1;
                ytarg = y1;
            }
            xprediction = x;
            yprediction = y;
            scr_lerpvar("xprediction", x, xtarg, traveltime, 2, "out");
            scr_lerpvar("yprediction", y, ytarg, traveltime, -1, "in");
        }
        if (timer > (1 + waittime) && timer <= (1 + waittime + traveltime))
        {
            var starttime = 1 + waittime;
            var scale = 2 + (sin(min((timer - starttime) / (traveltime - starttime), 1) * pi) * 0.5);
            image_xscale = scale;
            image_yscale = scale;
        }
    }
    if (timer == (1 + traveltime + 1))
    {
        snd_play(snd_impact, 0.6, 1.2);
        snd_play(snd_noise, 0.7, 0.9);
    }
    if (timer == (1 + traveltime + (waittime * 2)))
    {
        con = 3;
        timer = 0;
    }
}
if (movedwithclimb == 1 && (!i_ex(obj_climb_kris) || !obj_climb_kris.onrotatingtower))
{
    scr_lerpvar("x", x, x1, traveltime, 2, "out");
    scr_lerpvar("y", y, y1, traveltime, -1, "in");
    movedwithclimb = 0;
}
if (con == 3)
{
    if (trigtype == 0)
    {
        var targname = extflag;
        if (x == x1 && y == y1)
            targname = extflag2;
        var mytarg = -4;
        with (obj_climbloc)
        {
            if (exitmarkerflag == targname)
                mytarg = id;
        }
        with (obj_krmarker)
        {
            if (extflag == targname)
                mytarg = id;
        }
        if (mytarg == -4)
        {
            with (obj_climbstarter)
            {
                if (exitmarkerflag == targname)
                    mytarg = id;
            }
        }
        stick = false;
        with (obj_climb_kris)
        {
            neutralcon = -1;
            climbcon = -1;
            jumpchargecon = -1;
            fallingcon = -1;
            graboncon = -1;
            damagecon = -1;
            camera = 0;
            timer = 0;
            exitcon = 1;
            myexitloc = mytarg;
        }
        con = 4;
        timer = 0;
    }
    else
    {
        stick = false;
        con = 3.1;
        timer = 0;
        global.interact = 0;
    }
}
if (con == 3.1)
{
    if (!place_meeting(x, y, obj_climb_kris))
    {
        con = 4;
        timer = 0;
    }
    else if (button2_p())
    {
        con = 0;
    }
}
if (con == 4)
{
    timer++;
    if (timer == (1 + (waittime * 2)))
    {
        if (oneway)
        {
            var xtarg = x1;
            var ytarg = y1;
            if (x == x1 && y == y1)
            {
                xtarg = x2;
                ytarg = y2;
            }
            scr_lerpvar("x", x, xtarg, traveltime);
            scr_lerpvar("y", y, ytarg, traveltime);
        }
    }
    if (timer >= (1 + (waittime * 2) + traveltime) || !oneway)
    {
        con = 0;
        timer = 0;
    }
}
if (reset == 1)
{
    var returntime = 4;
    con = -1;
    timer = 0;
    scr_delay_var("con", 0, returntime);
    with (obj_lerpvar)
    {
        if (target == other.id)
            instance_destroy();
    }
    scr_lerpvar("x", x, x1, returntime, 2, "out");
    scr_lerpvar("y", y, y1, returntime, 2, "out");
    reset = 0;
}
