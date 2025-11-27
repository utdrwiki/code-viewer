if (con == 0 && global.interact == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "bibtrig")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig)
    {
        con = 1;
        timer = 0;
    }
}
if (con == 1)
{
    if (global.interact == 0)
    {
        timer++;
        var delay = 0;
        var movetime = 16;
        if (foughtbefore)
            movetime = 36;
        if (timer == 1)
        {
            snd_play(snd_wing);
            scr_lerpvar_respect("image_index", 0, 2, 4);
            scr_lerpvar_respect("auraalpha", 0, 1, movetime, 2, "out");
            if (foughtbefore)
            {
                scr_lerpvar_respect("y", y, y - 30, movetime, -1, "out");
                scr_lerpvar_respect("x", x, x + 30, movetime, 2, "out");
            }
            else
            {
                scr_lerpvar_respect("y", y, y - 40, movetime, -1, "out");
            }
        }
        if (timer == (1 + movetime + delay))
        {
            con = 2;
            timer = 0;
        }
    }
}
if (con == 2)
{
    if (global.interact == 0)
    {
        var maxspd = 10;
        var accel = 0.05;
        if (foughtbefore)
        {
            maxspd = 4;
            accel = 1/30;
        }
        spd = lerp(spd, maxspd, accel);
        var myxoff = x + 48 + 4;
        var myyoff = y + 40 + 8;
        var obj2 = 1049;
        var point2x = obj2.bbox_left + ((obj2.bbox_right - obj2.bbox_left) / 2);
        var point2y = obj2.bbox_top + ((obj2.bbox_bottom - obj2.bbox_top) / 2);
        var dir = point_direction(myxoff, myyoff, point2x, point2y);
        x += lengthdir_x(spd, dir);
        y += lengthdir_y(spd, dir);
        image_index += 0.375;
        var wid = 40;
        var hei = 50;
        var heioff = 12;
        myxoff = x + 48 + 4;
        myyoff = y + 40 + 8;
        var touchradius = 30;
        if (foughtbefore)
            touchradius = 20;
        var inst = collision_circle(myxoff, myyoff, touchradius, obj_mainchara, false, true);
        if (i_ex(inst))
        {
            with (obj_mainchara)
                other.krismarker = scr_marker_ext(x, y, sprite_index, 2, 2, 0, image_index, undefined, undefined, undefined, undefined, 0);
            with (krismarker)
            {
                depth = other.depth + 1;
                scr_lerpvar("image_alpha", 0, 1, 8);
            }
            con = 3;
            timer = 0;
            scr_lerpvar("auraalpha", 1, 0, 4, 2, "in");
            global.interact = 1;
            speed = 0;
            spd = 0;
        }
    }
    else
    {
    }
}
if (con == 3)
{
    timer++;
    if (timer == 1)
    {
        var myxoff = 48;
        var myyoff = 40;
        var xtarg = (obj_mainchara.x + 120) - myxoff;
        var ytarg = (obj_mainchara.y + 38) - myyoff;
        scr_lerpvar("x", x, xtarg, 16, 2, "out");
        scr_lerpvar("y", y, ytarg, 16, 2, "out");
        scr_lerpvar("image_index", image_index, 0, 3);
        snd_play(snd_tensionhorn);
        snd_play_delay(snd_tensionhorn, 10, undefined, 1.1);
    }
    if (timer == 4)
    {
        sprite_index = spr_bibliox_intro;
        image_index = 0;
        scr_lerpvar("image_index", 0, 5, 10);
    }
    if (timer == 24)
    {
        visible = false;
        var marker = scr_marker_ext(x, y, sprite_index, 2, 2, undefined, image_index, image_blend, 500);
        global.flag[54] = encounterflag;
        scr_battle(encounterno, 0, marker);
        safe_delete(krismarker);
        instance_destroy();
    }
}
