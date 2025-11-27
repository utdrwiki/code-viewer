var foughtbefore = false;
if (!init)
{
    if (global.flag[encounterflag] != 0)
    {
        alertrad = 90;
        foughtbefore = true;
        var _list = ds_list_create();
        var _num = instance_place_list(x, y, 334, _list, false);
        if (_num > 0)
        {
            for (var i = 0; i < _num; i++)
            {
                ds_list_find_value(_list, i).extflag = "removemizzle";
                instance_destroy();
            }
        }
        ds_list_destroy(_list);
    }
    init = 1;
}
if (con == 0)
{
    var dist = point_distance(x + 20, y + 38, obj_mainchara.x + 20, obj_mainchara.y + 70);
    if (dist < alertrad || (scr_debug() && keyboard_check_pressed(ord("P"))))
    {
        doappear = 2;
        con = 1;
    }
}
if (con == 1 && mizzle.image_alpha == 2)
{
    var mx = mizzle.x + 24;
    var my = mizzle.y + 28;
    var mwid = 52;
    var mhei = 50;
    var inst = collision_rectangle(mx, my, (mx + mwid) - 1, (my + mhei) - 1, obj_mainchara, 1, 1);
    if (i_ex(obj_climb_kris) || global.interact != 0)
        inst = -4;
    if (i_ex(inst))
    {
        with (object_index)
            con = 20;
        con = 2;
        var snd = snd_play_complex(0, 0, -1);
        snd_add_complex(snd, 0, 272, 1.2, 1, 0, -1, 0);
        snd_add_complex(snd, 0, 272, 1.3, 0.7, 1, -1, 0);
        snd_add_complex(snd, 0, 272, 1.4, 0.5, 2, -1, 0);
        snd_add_complex(snd, 1, 352, 1.8, 0.9, 0, -1, 0);
        mizzle.con = 99;
        mizzle.speed = 0;
        global.interact = 1;
    }
}
if (con == 20)
{
    with (mizzle)
    {
        scr_depth();
        scr_lerpvar("image_alpha", image_alpha, 0, 12, 2, "out");
        con = 999;
        gravity = -0.2;
    }
    scr_lerpvar_respect("haswater", haswater, 0, 12, 2, "out");
    con = 21;
}
if (con == 21)
{
    if (i_ex(mizzle))
    {
        if (mizzle.image_alpha <= 0)
        {
            safe_delete(mizzle);
            mizzle = 0;
            con = 22;
        }
    }
}
if (i_ex(mizzle))
{
    if (mizzle.con == 0)
    {
        var __amt = 1;
        if (dir == 1)
            __amt = -1;
        if (global.interact == 0)
            siner += __amt;
        mizzle.x = scr_even((x - 32) + (sin(siner / 20) * patrolradius));
        mizzle.y = scr_even((y - 12) + (cos(siner / 20) * patrolradius));
    }
}
with (mizzle)
{
    if (alerted == 1)
    {
        if (image_alpha > 0.5)
        {
            alerted = 2;
            with (scr_marker_ext(x + 34, y + 4, spr_exc, 2, 2, 0, undefined, undefined, undefined, undefined, 30))
            {
                depth = 50;
                scr_limitval_upper(id, "y", y);
                gravity = 0.75;
                vspeed = -6;
            }
        }
    }
    if (con == 20 && image_alpha == 2)
    {
        sprite_index = spr_holywater_alarm;
        con = 21;
    }
    if (con == 30)
    {
        if (global.interact == 0)
        {
            movespeed = lerp(movespeed, 10, 1/30);
            direction = point_direction(x, y, obj_mainchara.x, obj_mainchara.y);
            x += lengthdir_x(movespeed, direction);
            y += lengthdir_y(movespeed, direction);
            setxy(scr_even(x), scr_even(y));
            if ((x + 51) > (obj_mainchara.x + 20))
                sprite_index = spr_holywater_alarm;
            else
                sprite_index = spr_holywater_alarm_right;
            var fleeaway = false;
            with (obj_mainchara)
            {
                if (place_meeting(x, y, obj_solidenemy))
                    fleeaway = true;
            }
            if (i_ex(obj_climb_kris))
                fleeaway = true;
            with (obj_climbstarter)
            {
                if (con != 0)
                    fleeaway = true;
            }
            if (fleeaway == true)
            {
                with (obj_dw_church_watercooler)
                    drain = 0;
                debug_print("flee!");
                other.con = 20;
            }
            scr_depth();
            depth -= 92341;
        }
        else
        {
        }
    }
    if (con == 99)
    {
        image_speed = 0;
        sprite_index = spr_holywater_alarm;
        image_index %= 9;
        scr_lerpvar("image_index", image_index, 6, 12);
        var targx = obj_mainchara.x + 40;
        var targy = obj_mainchara.y - 22;
        scr_lerpvar("x", x, targx, 12, 2, "in");
        scr_lerpvar("y", y, targy, 12, 2, "out");
        con++;
    }
    if (con == 100)
    {
        if ((x + 51) > (obj_mainchara.x + 20))
            global.facing = 1;
        timer++;
        if (timer == 12)
        {
            snd_play(snd_tensionhorn);
            snd_play_delay(snd_tensionhorn, 10, undefined, 1.1);
        }
        if (timer == 36)
        {
            other.con = 21;
            other.mizzle = 0;
            global.flag[54] = other.encounterflag;
            scr_battle(other.encounterno, 0, id);
            with (obj_dw_church_watercooler)
                dodrain = true;
        }
    }
}
if (doappear)
{
    with (mizzle)
    {
        image_alpha = 0;
        var count = 1;
        scr_delay_var("image_alpha", 0.125, count);
        count++;
        scr_delay_var("image_alpha", 0, count);
        count++;
        scr_delay_var("image_alpha", 0.5, count);
        count++;
        scr_delay_var("image_alpha", 0.25, count);
        count++;
        scr_delay_var("image_alpha", 0.75, count);
        count++;
        scr_delay_var("image_alpha", 0.5, count);
        count++;
        scr_delay_var("image_alpha", 1, count);
        count++;
        scr_delay_var("image_alpha", 2, count + 4);
        count++;
    }
    if (foughtbefore)
        scr_lerpvar_respect("patrolradius", 0, 100, 120);
    else
        scr_lerpvar_respect("patrolradius", 0, 100, 60, 2, "out");
    if (doappear == 2)
    {
        var snd = snd_play_complex(0, 0, -1);
        snd_add_complex(snd, 0, 271, 0.9, 1, 0, -1, 0);
        snd_add_complex(snd, 1, 271, 0.8, 1, 2, -1, 0);
        snd_add_complex(snd, 2, 271, 0.7, 1, 4, -1, 0);
        snd_add_complex(snd, 2, 271, 0.6, 1, 6, -1, 0);
        snd_add_complex(snd, 2, 271, 0.5, 1, 7, -1, 0);
    }
    doappear = 0;
}
