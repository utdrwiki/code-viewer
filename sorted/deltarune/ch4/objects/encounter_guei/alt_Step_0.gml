var active = false;
with (obj_trigger)
{
    if (extflag == "gueiactive")
    {
        if (place_meeting(x, y, obj_mainchara))
            active = true;
    }
}
if (active && con < 2)
{
    var makegueimarker = 0;
    timer++;
    if ((timer % 15) == 0 || (timer % 7) == 0 || (timer % 32) == 0 || (timer % 19) == 0)
        makegueimarker = true;
    if (makegueimarker)
    {
        var targx = camerax() + 320 + random_range(-180, 180);
        var targy = cameray() + 60 + random_range(-80, 40);
        var guei = scr_marker_ext(targx, targy, spr_guei_chase, 2, 2, 0.125, undefined, undefined, 500, undefined, undefined, 0.5);
        with (guei)
        {
            extflag = "guei";
            var lifetime = irandom_range(60, 120);
            scr_lerpvar("x", x, x + (random_range(60, 120) * choose(-1, 1)), lifetime, choose(2, 3, -1), "out");
            scr_lerpvar("y", y, y + random_range(40, 60), lifetime, choose(2, 2, 2, 3, 4, -1), choose("out", "out", "out", "in"));
            scr_lerpvar("image_alpha", image_alpha, 0, 60, choose(2, 2, 2, 3, 4), "out");
            scr_doom(undefined, lifetime);
        }
    }
}
if (con == 0)
{
    var triggered = false;
    with (obj_trigger)
    {
        if (extflag == "guei")
        {
            if (place_meeting(x, y, obj_mainchara))
                triggered = true;
        }
    }
    if (triggered == true)
    {
        con = 1;
        timer = 0;
        var xloc = camerax() + 320;
        var yloc = cameray() + 20;
        chaser = scr_marker_ext(xloc, yloc, sprite_index, 2, 2, 0, undefined, undefined, 500);
        chaser.image_alpha = 0;
        chaser.image_speed = 0.125;
        chaser.alpha = 0;
        chaser.depth = 400;
        chaser.drawsiner = 0;
        chaser.auraalpha = 0;
        with (chaser)
            scr_lerpvar("auraalpha", 0, 1, 5, 2, "out");
        with (chaser)
            scr_lerpvar("alpha", 0, 0.7, 10, 2, "out");
        snd_play(snd_ghostappear, 0.5, 2);
        chasespeed = 0.1;
    }
}
if (con == 1)
{
    var maxchase = 30;
    if (global.flag[encounterflag] != 0 && global.plot >= 127)
        maxchase = 12;
    if (global.interact == 0)
        chasespeed = lerp(chasespeed, maxchase, 0.0125);
    var targ = 1049;
    with (chaser)
    {
        if (global.interact == 0)
            move_towards_point(targ.x + 16, targ.y + 36, other.chasespeed);
        else
            speed = 0;
        var _xloc = x - 14;
        var _yloc = y - 1;
        if (global.interact == 0)
        {
            if (i_ex(collision_rectangle(_xloc, _yloc, _xloc + 28, _yloc + 20, obj_mainchara, 0, true)))
            {
                snd_play(snd_cough, 1, 1.4);
                snd_play(snd_paper_rise, 0.7, 1.2);
                snd_play(snd_paper_rise, 0.4, 1.8);
                snd_play(snd_ghostappear, undefined, 1.6);
                global.interact = 1;
                speed = 0;
                other.con++;
                scr_lerpvar("x", x, (x - 60) + 120, 20, 4, "out");
                scr_lerpvar("y", y, y - 80, 20, 2, "in");
            }
        }
    }
    if (global.interact == 0)
    {
        var giveup = false;
        with (obj_mainchara)
        {
            if (place_meeting(x, y, obj_solidenemy))
                giveup = true;
        }
        if (giveup)
        {
            with (chaser)
            {
                scr_lerpvar("auraalpha", auraalpha, 0, 5, 2, "out");
                scr_lerpvar("alpha", 0.7, 0, 10, 2, "out");
                with (scr_marker_ext(x, y, sprite_index, image_xscale, 2, undefined, undefined, undefined, undefined, undefined, undefined, alpha))
                {
                    direction = other.direction;
                    speed = other.speed / 2;
                    gravity = -1;
                    scr_lerpvar("image_alpha", 0.7, 0, 8, 2, "out");
                    scr_doom(id, 9);
                }
                visible = false;
                alpha = 0;
                scr_doom(id, 10);
            }
            chaser = 0;
            con = 0;
            timer = 0;
        }
    }
}
if (con == 2)
{
    btimer++;
    if (btimer == 35)
    {
        snd_play(snd_tensionhorn);
        snd_play_delay(snd_tensionhorn, 10, undefined, 1.1);
    }
    if (btimer == 59)
    {
        global.flag[54] = encounterflag;
        scr_battle(150, 0, chaser);
        con = 3;
        scr_doom(id, 120);
    }
}
