touchradius = 20;
var ripcol = 255;
if (init == 0)
{
    if (i_ex(obj_dw_church_ripseq2))
    {
        setxy((camerax() + 640) - 70, cameray() + 240);
        if (global.tempflag[50] != 0)
        {
            setxy(camerax() + global.tempflag[50], cameray() + global.tempflag[51]);
            global.tempflag[50] = 0;
            global.tempflag[51] = 0;
        }
        siner = sinertarg - 2;
    }
    if (i_ex(obj_ch4_DCA04))
    {
        con = 400;
        depth = 5000;
    }
    init = 1;
}
if (con == 0)
{
    sinertarg = 30;
    depth = 500;
    var chasespeed = 2;
    var offscreen = false;
    var cx = camerax();
    if (x < cx || x > (cx + 640))
        offscreen = true;
    var cy = cameray();
    if (y < cy || y > (cy + 480))
        offscreen = true;
    var targ = 1049;
    move_towards_point(targ.x + 40, targ.y + 60, chasespeed);
    var lerprate = 0.1;
    if (x > (cx + 640))
        x = lerp(x, cx + 640, lerprate);
    if (x < cx)
        x = lerp(x, cx, lerprate);
    if (y > (cy + 480))
        y = lerp(y, cy + 480, lerprate);
    if (y < cy)
        y = lerp(y, cy, lerprate);
    if (i_ex(collision_circle(x, y, touchradius, obj_mainchara, 0, true)))
    {
        con = 0.5;
        scr_delay_var("con", 1, 15);
        image_alpha = 0;
        var ripcount = 6;
        for (var i = 0; i < ripcount; i++)
        {
            var _hhsp = lengthdir_x(2, (360 / ripcount) * i);
            var _vvsp = lengthdir_y(2, (360 / ripcount) * i);
            scr_fancy_ripple_alt(x, y, 60, ripcol, 120, 1, 14, obj_mainchara.depth + 1000, _hhsp, _vvsp, 0);
        }
        speed = 0;
        snd_stop(snd_hurt1);
        snd_play(snd_hurt1);
        var damagetype = 0;
        target = 0;
        if (damagetype == 0)
        {
            var maxhealth = global.maxhp[1];
            var curhealth = global.hp[1];
            if (curhealth > (maxhealth / 2))
                damage = 40;
            if (curhealth <= (maxhealth / 2))
                damage = 30;
            if (curhealth <= 50)
                damage = 25;
        }
        if (damagetype == 1)
        {
            var highesthp = 0;
            for (var i = 0; i < 4; i++)
            {
                if (global.maxhp[i] > highesthp)
                    highesthp = global.maxhp[i];
            }
            damage = round(highesthp / 2) + 5;
        }
        global.inv = -10;
        scr_damage_all_overworld();
        with (obj_darkcontroller)
            charcon = 1;
        global.interact = 1;
        with (obj_mainchara)
            alarm[1] = 7;
        timer = 0;
    }
}
if (con == 1)
{
    var resettime = 15;
    timer++;
    if (timer == 1)
    {
        sinertarg = 2;
        scr_lerpvar("x", x, camerax() + 640, resettime, 2, "out");
        scr_lerpvar("y", y, cameray(), resettime, 2, "out");
    }
    if (timer == (1 + resettime))
    {
        sinertarg = 30;
        timer = 0;
        con = -1;
        scr_delay_var("con", 0, 15);
        scr_delay_var("image_alpha", 1, 15);
    }
}
if (con == 400)
{
    move_towards_point(targx, targy, 2);
    if (scr_checklocation(undefined, targx, targy, 2))
    {
        con = 401;
        speed = 0;
    }
}
if (con == 401)
{
    var sinamt = 40 + (sin(siner / 10) * 20);
    x = lerp(x, targx + (sin(siner / 30) * sinamt), 0.125);
    y = lerp(y, targy + (cos(siner / 30) * sinamt), 0.125);
}
siner++;
if ((siner % sinertarg) == 0)
{
    var hittarget = 1049;
    if (i_ex(obj_ch4_DCA04))
    {
        with (obj_actor)
        {
            if (name == "susie")
                hittarget = id;
        }
    }
    var _hhsp = lengthdir_x(2, point_direction(x, y, hittarget.x + 40, hittarget.y + 60));
    var _vvsp = lengthdir_y(2, point_direction(x, y, hittarget.x + 40, hittarget.y + 60));
    var targdepth = other.depth + 10;
    if (instance_exists(obj_dw_church_ripseq2))
        targdepth = layer_get_depth("WALLTILES") - 100;
    if (instance_exists(obj_dw_church_waterfallroom))
        targdepth = layer_get_depth("TILES_WALL") - 100;
    scr_fancy_ripple_alt(x, y, ripcol, 60, 120, 1, 14, targdepth, _hhsp, _vvsp, 0);
}
