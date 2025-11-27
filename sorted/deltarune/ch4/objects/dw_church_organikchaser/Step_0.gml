scr_populatechars();
if (!init)
{
    if (instance_exists(obj_dw_churchc_encounter2))
    {
        con = -1;
        delaytime = 1;
        maxspd = 6;
        darkroom = true;
        accl = 0.16666666666666666;
        touchsize = 30;
        if (global.flag[encounterflag] != 0)
        {
            touchsize = 24;
            accl = 1/15;
            maxspeed = 2;
            if (scr_trigcheck_ext("chaseb", id))
                instance_destroy();
        }
    }
    init = 1;
}
scr_depth();
if (darkroom && global.interact == 0)
{
    if (con == -1)
    {
        if (!scr_checklocation(id, xstart, ystart, 8))
        {
            retimer--;
            if (retimer <= 0)
            {
                dir = point_direction(x, y, xstart, ystart);
                x += lengthdir_x(4, dir);
                y += lengthdir_y(4, dir);
                animindex += 0.125;
                facing = 0;
                if (dir < 90 || dir > 270)
                    facing = 1;
            }
        }
        if (scr_trigcheck(extflag) && !scr_trigcheck("notouching"))
        {
            var doomtime = 20;
            with (scr_marker_ext(x + 20 + 14, (y - 20) + 8, spr_exc, 2, 2, undefined, undefined, undefined, depth - 1, undefined, doomtime))
            {
                vspeed = -3;
                gravity = 0.7;
                scr_limitval_upper(id, "y", y);
                snd_play(snd_b);
            }
            timer = 0;
            con = 1;
        }
    }
    if (con == 0 || con == 1)
    {
        if (scr_trigcheck("notouching"))
        {
            spd = 0;
            animspeed = 0;
            animindex = 0;
            con = -1;
            retimer = choose(30, 30, 40, 60, 120, 30);
            with (obj_lerpvar)
            {
                if (target == other.id)
                    instance_destroy();
            }
        }
    }
}
if (con == 0)
{
    timer++;
    if (timer == 1)
    {
        var doomtime = 20;
        with (scr_marker_ext(x + 20 + 14, (y - 20) + 8, spr_exc, 2, 2, undefined, undefined, undefined, depth - 1, undefined, doomtime))
        {
            vspeed = -3;
            gravity = 0.7;
            scr_limitval_upper(id, "y", y);
        }
        if (!darkroom)
        {
            drawaura = true;
            scr_lerpvar("auraalph", 0, 1, delaytime);
        }
        snd_play(snd_b);
    }
    if (timer == delaytime)
    {
        scr_lerpvar("animspeed", 0, 0.5, 15, 2, "in");
        timer = 0;
        con = 1;
    }
}
if (con == 1)
{
    if (global.interact == 0)
    {
        dir = direction_to_object_bbox(undefined, 1049);
        facing = 0;
        if (dir < 90 || dir > 270)
            facing = 1;
        spd = lerp(spd, maxspd, accl);
        x += lengthdir_x(spd, dir);
        y += lengthdir_y(spd, dir);
        if (i_ex(collision_circle(x + 40, y + 70 + 20, touchsize, obj_mainchara, true, true)))
        {
            marker = scr_marker_ext(x - 18, y - 14, spr_dw_churchb_organikenemy_marker, 2, 2, undefined, undefined, undefined, 5000);
            global.interact = 1;
            con = 2;
            timer = 0;
            drawaura = false;
        }
    }
}
if (con == 2)
{
    timer++;
    if (timer == 1)
    {
        with (marker)
        {
            if (instance_exists(obj_dw_churchc_encounter2))
            {
                debug_print("black");
                image_blend = c_black;
                scr_lerp_imageblend(id, c_black, c_white, 8);
            }
        }
        snd_play(snd_tensionhorn);
        snd_play_delay(snd_tensionhorn, 10, undefined, 1.1);
        animspeed = 0;
    }
    if (timer == 25)
    {
        var slot = 0;
        if (instance_exists(obj_dw_churchb_moneyfountain))
            slot = 1;
        global.flag[54] = encounterflag;
        if (slot == 0)
            scr_battle(encounterno, false, marker);
        if (slot == 1)
            scr_battle(encounterno, false, undefined, marker);
        if (clearall)
        {
            with (object_index)
                instance_destroy();
        }
        else
        {
            instance_destroy();
        }
    }
}
